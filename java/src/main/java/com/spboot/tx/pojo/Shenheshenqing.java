package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("shenheshenqing")
public class Shenheshenqing implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer huodongshenqingid;

    private Integer zuzhihuodongid;

    private Integer zuzhixinxiid;

    private String mingcheng;

    private Integer diqu;

    private String chuangjianren;

    private String xingming;

    private String dianhua;

    private String shenqingren;

    private String shenhe;

    private String yijian;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getHuodongshenqingid() {
        return huodongshenqingid;
    }

    public void setHuodongshenqingid(Integer huodongshenqingid) {
        this.huodongshenqingid = huodongshenqingid == null ? 0 : huodongshenqingid;
    }

    public Integer getZuzhihuodongid() {
        return zuzhihuodongid;
    }

    public void setZuzhihuodongid(Integer zuzhihuodongid) {
        this.zuzhihuodongid = zuzhihuodongid == null ? 0 : zuzhihuodongid;
    }

    public Integer getZuzhixinxiid() {
        return zuzhixinxiid;
    }

    public void setZuzhixinxiid(Integer zuzhixinxiid) {
        this.zuzhixinxiid = zuzhixinxiid == null ? 0 : zuzhixinxiid;
    }

    public String getMingcheng() {
        return mingcheng;
    }

    public void setMingcheng(String mingcheng) {
        this.mingcheng = mingcheng == null ? "" : mingcheng.trim();
    }

    public Integer getDiqu() {
        return diqu;
    }

    public void setDiqu(Integer diqu) {
        this.diqu = diqu == null ? 0 : diqu;
    }

    public String getChuangjianren() {
        return chuangjianren;
    }

    public void setChuangjianren(String chuangjianren) {
        this.chuangjianren = chuangjianren == null ? "" : chuangjianren.trim();
    }

    public String getXingming() {
        return xingming;
    }

    public void setXingming(String xingming) {
        this.xingming = xingming == null ? "" : xingming.trim();
    }

    public String getDianhua() {
        return dianhua;
    }

    public void setDianhua(String dianhua) {
        this.dianhua = dianhua == null ? "" : dianhua.trim();
    }

    public String getShenqingren() {
        return shenqingren;
    }

    public void setShenqingren(String shenqingren) {
        this.shenqingren = shenqingren == null ? "" : shenqingren.trim();
    }

    public String getShenhe() {
        return shenhe;
    }

    public void setShenhe(String shenhe) {
        this.shenhe = shenhe == null ? "" : shenhe.trim();
    }

    public String getYijian() {
        return yijian;
    }

    public void setYijian(String yijian) {
        this.yijian = yijian == null ? "" : yijian.trim();
    }
}
