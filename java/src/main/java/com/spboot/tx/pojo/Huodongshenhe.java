package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("huodongshenhe")
public class Huodongshenhe implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer zuzhihuodongid;

    private Integer zuzhixinxiid;

    private String mingcheng;

    private String chuangjianren;

    private String huodongzhuti;

    private String kaishishijian;

    private String jieshushijian;

    private String huodongdizhi;

    private Integer huodongshizhang;

    private String shenhe;

    private String yijian;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getChuangjianren() {
        return chuangjianren;
    }

    public void setChuangjianren(String chuangjianren) {
        this.chuangjianren = chuangjianren == null ? "" : chuangjianren.trim();
    }

    public String getHuodongzhuti() {
        return huodongzhuti;
    }

    public void setHuodongzhuti(String huodongzhuti) {
        this.huodongzhuti = huodongzhuti == null ? "" : huodongzhuti.trim();
    }

    public String getKaishishijian() {
        return kaishishijian;
    }

    public void setKaishishijian(String kaishishijian) {
        this.kaishishijian = kaishishijian == null ? "" : kaishishijian.trim();
    }

    public String getJieshushijian() {
        return jieshushijian;
    }

    public void setJieshushijian(String jieshushijian) {
        this.jieshushijian = jieshushijian == null ? "" : jieshushijian.trim();
    }

    public String getHuodongdizhi() {
        return huodongdizhi;
    }

    public void setHuodongdizhi(String huodongdizhi) {
        this.huodongdizhi = huodongdizhi == null ? "" : huodongdizhi.trim();
    }

    public Integer getHuodongshizhang() {
        return huodongshizhang;
    }

    public void setHuodongshizhang(Integer huodongshizhang) {
        this.huodongshizhang = huodongshizhang == null ? 0 : huodongshizhang;
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
