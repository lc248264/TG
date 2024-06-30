package com.spboot.tx.service;

import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jntoo.db.DB;
import com.jntoo.db.QueryMap;
import com.jntoo.db.model.Options;
import com.jntoo.db.utils.StringUtil;
import com.spboot.tx.mapper.*;
import com.spboot.tx.pojo.*;
import com.spboot.tx.utils.*;
import java.util.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UsersService implements UserDetailsService {

    @Resource
    private AdminsService adminsService;

    @Resource
    private ZhiyuanzheService zhiyuanzheService;

    @Resource
    private GuanfangzuzhiService guanfangzuzhiService;

    @Value("${wx.appid}")
    private String appid;

    @Value("${wx.secret}")
    private String secret;

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private JwtTokenUtils jwtTokenUtils;

    @Resource
    private WxuserMapper wxUserMapper;

    /**
     * 由WebSecurity系统自动调用获取用户信息，并判断用户得账号密码是否正确
     * @param s 用户名
     * @return 成功返回用户行信息
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        Admins admins = adminsService.findByUsername(s);
        if (admins != null) {
            return new UsersDetailsImpl(adminsService.toSession(admins));
        }
        Zhiyuanzhe zhiyuanzhe = zhiyuanzheService.findByXuehao(s);
        if (zhiyuanzhe != null) {
            return new UsersDetailsImpl(zhiyuanzheService.toSession(zhiyuanzhe));
        }
        Guanfangzuzhi guanfangzuzhi = guanfangzuzhiService.findByZhanghao(s);
        if (guanfangzuzhi != null) {
            return new UsersDetailsImpl(guanfangzuzhiService.toSession(guanfangzuzhi));
        }

        throw new UsernameNotFoundException("登录用户不存在");
    }

    public ResponseData<Object> login(LoginPojo pojo) {
        String username = pojo.getUsername();
        String pwd = pojo.getPwd();
        String cx = pojo.getCx();
        if (StringUtil.isNullOrEmpty(username)) {
            return JsonResult.error("请填写用户");
        }
        if (StringUtil.isNullOrEmpty(pwd)) {
            return JsonResult.error("请填写密码");
        }
        if (StringUtil.isNullOrEmpty(cx)) {
            return JsonResult.error("请填写角色");
        }

        if (!StringUtil.isNullOrEmpty(pojo.getA())) {
            if (StrUtil.hasBlank(pojo.getPagerandom())) {
                return JsonResult.error("请填写验证码");
            }
            String token = jwtTokenUtils.getUserIdFromToken(pojo.getCaptchToken());
            if (!token.equals(pojo.getPagerandom())) {
                return JsonResult.error("验证码错误请重新输入");
            }
        }

        Map result = new HashMap();
        if (cx.equals("管理员")) {
            String password = pwd;

            Admins user = DB.name(Admins.class).where("username", username).where("pwd", password).find();
            if (user == null) {
                return JsonResult.error("账号或密码错误");
            }
            SessionUser sessionUser = adminsService.toSession(user);

            Map<String, Object> m = new HashMap();
            m.put("id", user.getId());
            m.put("username", username);
            m.put("roles", cx);
            m.put("table", "admins");

            m.put("cx", cx);

            String token = jwtTokenUtils.generateToken(user.getId(), m);
            result.put("session", sessionUser);
            result.put("token", token);
        }
        if (cx.equals("志愿者")) {
            String password = pwd;

            Zhiyuanzhe user = DB.name(Zhiyuanzhe.class).where("xuehao", username).where("mima", password).find();
            if (user == null) {
                return JsonResult.error("账号或密码错误");
            }
            SessionUser sessionUser = zhiyuanzheService.toSession(user);

            Map<String, Object> m = new HashMap();
            m.put("id", user.getId());
            m.put("username", username);
            m.put("roles", cx);
            m.put("table", "zhiyuanzhe");

            m.put("cx", cx);

            String token = jwtTokenUtils.generateToken(user.getId(), m);
            result.put("session", sessionUser);
            result.put("token", token);
        }
        if (cx.equals("官方组织")) {
            String password = pwd;

            Guanfangzuzhi user = DB.name(Guanfangzuzhi.class).where("zhanghao", username).where("mima", password).find();
            if (user == null) {
                return JsonResult.error("账号或密码错误");
            }
            SessionUser sessionUser = guanfangzuzhiService.toSession(user);

            Map<String, Object> m = new HashMap();
            m.put("id", user.getId());
            m.put("username", username);
            m.put("roles", cx);
            m.put("table", "guanfangzuzhi");

            m.put("cx", cx);

            String token = jwtTokenUtils.generateToken(user.getId(), m);
            result.put("session", sessionUser);
            result.put("token", token);
        }

        return JsonResult.success(result);
    }

    public ResponseData<Object> query(Map map) {
        if (!map.containsKey("name")) {
            return JsonResult.error("找不到相关名称");
        }
        if (!map.containsKey("options") && !(map.get("options") instanceof Map)) {
            return JsonResult.error("找不到相关配置");
        }
        if (!map.containsKey("func")) {
            return JsonResult.error("找不到引用");
        }

        JSONObject object = new JSONObject();
        object.putAll((Map) map.get("options"));

        QueryMap queryWrapper = DB.name(map.get("name").toString());
        queryWrapper.setOptions(object.toJavaObject(Options.class));
        String func = map.get("func").toString().toLowerCase();
        Object result = null;
        List args = (List) map.get("args");
        try {
            if (func.equals("select")) {
                result = queryWrapper.select();
            } else if (func.equals("find")) {
                if (args == null) {
                    result = queryWrapper.find();
                } else {
                    result = queryWrapper.find(args.get(0));
                }
            } else if (func.equals("count")) {
                if (args == null) {
                    result = queryWrapper.count();
                } else {
                    result = queryWrapper.count(String.valueOf(args.get(0)));
                }
            } else if (func.equals("avg")) {
                result = queryWrapper.avg(String.valueOf(args.get(0)));
            } else if (func.equals("sum")) {
                result = queryWrapper.sum(String.valueOf(args.get(0)));
            } else if (func.equals("max")) {
                result = queryWrapper.max(String.valueOf(args.get(0)));
            } else if (func.equals("min")) {
                result = queryWrapper.min(String.valueOf(args.get(0)));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error(e.getMessage());
        }
        return JsonResult.success(result);
    }

    /**
     * 微信登录系统
     * @param code 微信获取得code
     * @param wxUser 前台提交得用户信息
     * @return 成功获取失败值
     */
    public ResponseData<Object> wxLogin(String code, Wxuser wxUser) {
        String url = "https://api.weixin.qq.com/sns/jscode2session?" + "appid=" + appid + "&secret=" + secret + "&js_code=" + code + "&grant_type=authorization_code";
        //System.out.println(url);
        JSONObject jsonObject = JSONObject.parseObject(HttpUtil.get(url));
        if (jsonObject.containsKey("openid")) {
            String openid = String.valueOf(jsonObject.get("openid"));
            wxUser.setOpenid(openid);
            Wxuser wxUser1 = new Wxuser();
            wxUser1.setOpenid(openid);

            QueryWrapper<Wxuser> wrapper = Wrappers.query(wxUser1);
            wrapper.eq("openid", openid);
            List<Wxuser> users = wxUserMapper.selectList(wrapper);
            Integer userid;
            if (users.isEmpty()) {
                Info.handlerNullEntity(wxUser);
                wxUserMapper.insert(wxUser);
                userid = wxUser.getId();
            } else {
                wxUser.setId(users.get(0).getId());
                wxUserMapper.updateById(wxUser);
                userid = users.get(0).getId();
            }

            SessionUser sessionUser = new SessionUser(wxUser);
            Map<String, Object> map = new HashMap(JSON.parseObject(JSON.toJSONString(sessionUser)));

            String token = jwtTokenUtils.generateToken(userid, map);
            Map userMap = DB.name("wxuser").find(userid);
            userMap.put("userid", userid);
            map.put("token", token);
            map.put("session", userMap);
            return JsonResult.success(map);
        } else {
            return JsonResult.error("无法登录，请检查appid和secret是否填写正确");
        }
    }
}
