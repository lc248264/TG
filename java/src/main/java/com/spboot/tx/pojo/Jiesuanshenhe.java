package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("jiesuanshenhe")
public class Jiesuanshenhe implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer jiesuanzhiyuanid;

    private Integer zuzhixinxiid;

    private Integer zuzhihuodongid;

    private Integer huodongshenqingid;

    private String mingcheng;

    private Integer diqu;

    private String chuangjianren;

    private String huodongzhuti;

    private Integer huodongshizhang;

    private String shenqingren;

    private String wanchengqingkuang;

    private String shenhe;

    private Integer jiesuanshizhang;

    private String beizhu;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getJiesuanzhiyuanid() {
        return jiesuanzhiyuanid;
    }

    public void setJiesuanzhiyuanid(Integer jiesuanzhiyuanid) {
        this.jiesuanzhiyuanid = jiesuanzhiyuanid == null ? 0 : jiesuanzhiyuanid;
    }

    public Integer getZuzhixinxiid() {
        return zuzhixinxiid;
    }

    public void setZuzhixinxiid(Integer zuzhixinxiid) {
        this.zuzhixinxiid = zuzhixinxiid == null ? 0 : zuzhixinxiid;
    }

    public Integer getZuzhihuodongid() {
        return zuzhihuodongid;
    }

    public void setZuzhihuodongid(Integer zuzhihuodongid) {
        this.zuzhihuodongid = zuzhihuodongid == null ? 0 : zuzhihuodongid;
    }

    public Integer getHuodongshenqingid() {
        return huodongshenqingid;
    }

    public void setHuodongshenqingid(Integer huodongshenqingid) {
        this.huodongshenqingid = huodongshenqingid == null ? 0 : huodongshenqingid;
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

    public String getHuodongzhuti() {
        return huodongzhuti;
    }

    public void setHuodongzhuti(String huodongzhuti) {
        this.huodongzhuti = huodongzhuti == null ? "" : huodongzhuti.trim();
    }

    public Integer getHuodongshizhang() {
        return huodongshizhang;
    }

    public void setHuodongshizhang(Integer huodongshizhang) {
        this.huodongshizhang = huodongshizhang == null ? 0 : huodongshizhang;
    }

    public String getShenqingren() {
        return shenqingren;
    }

    public void setShenqingren(String shenqingren) {
        this.shenqingren = shenqingren == null ? "" : shenqingren.trim();
    }

    public String getWanchengqingkuang() {
        return wanchengqingkuang;
    }

    public void setWanchengqingkuang(String wanchengqingkuang) {
        this.wanchengqingkuang = wanchengqingkuang == null ? "" : wanchengqingkuang.trim();
    }

    public String getShenhe() {
        return shenhe;
    }

    public void setShenhe(String shenhe) {
        this.shenhe = shenhe == null ? "" : shenhe.trim();
    }

    public Integer getJiesuanshizhang() {
        return jiesuanshizhang;
    }

    public void setJiesuanshizhang(Integer jiesuanshizhang) {
        this.jiesuanshizhang = jiesuanshizhang == null ? 0 : jiesuanshizhang;
    }

    public String getBeizhu() {
        return beizhu;
    }

    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu == null ? "" : beizhu.trim();
    }
}
