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

@Api(tags = { "组织审核控制器" })
@RestController
@RequestMapping("/api/zuzhishenhe")
public class ZuzhishenheController {

    @Autowired
    public ZuzhishenheService zuzhishenheService;

    @Resource
    private HttpServletRequest request;

    @Resource
    private HttpServletResponse response;

    @ApiOperation(value = "获取全部组织审核", httpMethod = "GET")
    @RequestMapping("/selectAll")
    public ResponseData<List<Zuzhishenhe>> selectAll() {
        return zuzhishenheService.selectAll();
    }

    @ApiOperation(value = "根据条件筛选获取组织审核列表，并分页", httpMethod = "POST")
    @RequestMapping("/selectPages")
    public ResponseData selectPages(@RequestBody Map<String, Object> req) {
        return zuzhishenheService.selectPages(req);
    }

    @ApiOperation(value = "根据条件筛选获取组织审核列表，并分页，且只出现某用户列表信息", httpMethod = "POST")
    @RequestMapping("/selectPagesChuangjianren")
    public ResponseData selectPagesChuangjianren(@RequestBody Map<String, Object> req) {
        req.put("session_name", "chuangjianren");
        return zuzhishenheService.selectPages(req);
    }

    @ApiOperation(value = "根据过滤信息获取相关数据", httpMethod = "POST")
    @RequestMapping("/filter")
    public ResponseData<List<Zuzhishenhe>> filter(@RequestBody Map<String, Object> req) {
        return zuzhishenheService.filter(req);
    }

    @ApiOperation(value = "根据id获取信息", httpMethod = "GET")
    @RequestMapping("/findById")
    @ApiImplicitParam(name = "id", value = "组织审核对应的id", dataType = "Integer")
    public ResponseData findById(@RequestParam Integer id) {
        return zuzhishenheService.findById(id);
    }

    @ApiOperation(value = "根据id更新数据", httpMethod = "POST")
    @RequestMapping("/update")
    @ApiImplicitParam(name = "data", value = "使用json数据提交", type = "json", dataTypeClass = Zuzhishenhe.class, paramType = "body")
    public ResponseData update(@RequestBody Map data) {
        Zuzhishenhe post = BeanUtil.mapToBean(data, Zuzhishenhe.class, true);
        return zuzhishenheService.update(post, data);
    }

    @ApiOperation(value = "插入一行数据，返回插入后的组织审核", httpMethod = "POST")
    @RequestMapping("/insert")
    @ApiImplicitParam(name = "data", value = "使用json数据提交", type = "json", dataTypeClass = Zuzhishenhe.class, paramType = "body")
    public ResponseData insert(@RequestBody Map data) {
        Zuzhishenhe post = BeanUtil.mapToBean(data, Zuzhishenhe.class, true);
        return zuzhishenheService.insert(post, data);
    }

    @ApiOperation(value = "根据id列表删除数据", httpMethod = "POST")
    @RequestMapping("/delete")
    @ApiImplicitParam(name = "id", value = "组织审核对应的id", type = "json", dataTypeClass = List.class)
    public ResponseData delete(@RequestBody List<Integer> id) {
        return zuzhishenheService.delete(id);
    }
}
