package com.spboot.tx.controller;

import cn.hutool.core.bean.BeanUtil;
import com.jntoo.db.DB;
import com.jntoo.db.utils.StringUtil;
import com.spboot.tx.config.Configure;
import com.spboot.tx.mapper.*;
import com.spboot.tx.pojo.*;
import com.spboot.tx.service.*;
import com.spboot.tx.utils.*;
import io.swagger.annotations.*;
import java.io.*;
import java.util.*;
import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Api(tags = { "帖子控制器" })
@RestController
@RequestMapping("/api/tiezi")
public class TieziController {

    @Autowired
    public TieziService tieziService;

    @Resource
    private HttpServletRequest request;

    @Resource
    private HttpServletResponse response;

    @ApiOperation(value = "获取全部帖子", httpMethod = "GET")
    @RequestMapping("/selectAll")
    public ResponseData<List<Tiezi>> selectAll() {
        return tieziService.selectAll();
    }

    @ApiOperation(value = "根据条件筛选获取帖子列表，并分页", httpMethod = "POST")
    @RequestMapping("/selectPages")
    public ResponseData selectPages(@RequestBody Map<String, Object> req) {
        return tieziService.selectPages(req);
    }

    @ApiOperation(value = "根据条件筛选获取帖子列表，并分页，且只出现某用户列表信息", httpMethod = "POST")
    @RequestMapping("/selectPagesFaburen")
    public ResponseData selectPagesFaburen(@RequestBody Map<String, Object> req) {
        req.put("session_name", "faburen");
        return tieziService.selectPages(req);
    }

    @ApiOperation(value = "根据过滤信息获取相关数据", httpMethod = "POST")
    @RequestMapping("/filter")
    public ResponseData<List<Tiezi>> filter(@RequestBody Map<String, Object> req) {
        return tieziService.filter(req);
    }

    @ApiOperation(value = "根据id获取信息", httpMethod = "GET")
    @RequestMapping("/findById")
    @ApiImplicitParam(name = "id", value = "帖子对应的id", dataType = "Integer")
    public ResponseData findById(@RequestParam Integer id) {
        return tieziService.findById(id);
    }

    @ApiOperation(value = "根据id更新数据", httpMethod = "POST")
    @RequestMapping("/update")
    @ApiImplicitParam(name = "data", value = "使用json数据提交", type = "json", dataTypeClass = Tiezi.class, paramType = "body")
    public ResponseData update(@RequestBody Map data) {
        Tiezi post = BeanUtil.mapToBean(data, Tiezi.class, true);
        return tieziService.update(post, data);
    }

    @ApiOperation(value = "插入一行数据，返回插入后的帖子", httpMethod = "POST")
    @RequestMapping("/insert")
    @ApiImplicitParam(name = "data", value = "使用json数据提交", type = "json", dataTypeClass = Tiezi.class, paramType = "body")
    public ResponseData insert(@RequestBody Map data) {
        Tiezi post = BeanUtil.mapToBean(data, Tiezi.class, true);
        return tieziService.insert(post, data);
    }

    @ApiOperation(value = "根据id列表删除数据", httpMethod = "POST")
    @RequestMapping("/delete")
    @ApiImplicitParam(name = "id", value = "帖子对应的id", type = "json", dataTypeClass = List.class)
    public ResponseData delete(@RequestBody List<Integer> id) {
        return tieziService.delete(id);
    }
}
