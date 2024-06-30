package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("jiesuanzhiyuan")
public class Jiesuanzhiyuan implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer huodongshenqingid;

    private Integer zuzhihuodongid;

    private Integer zuzhixinxiid;

    private String mingcheng;

    private Integer diqu;

    private String chuangjianren;

    private String huodongzhuti;

    private String kaishishijian;

    private String jieshushijian;

    private Integer huodongshizhang;

    private String shenqingren;

    private String wanchengqingkuang;

    private String shenhezhuangtai;

    private String yijian;

    private String addtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getJiesuanshenheCount() {
        return DB.name("jiesuanshenhe").where("jiesuanzhiyuanid", id).count();
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

    public String getShenhezhuangtai() {
        return shenhezhuangtai;
    }

    public void setShenhezhuangtai(String shenhezhuangtai) {
        this.shenhezhuangtai = shenhezhuangtai == null ? "" : shenhezhuangtai.trim();
    }

    public String getYijian() {
        return yijian;
    }

    public void setYijian(String yijian) {
        this.yijian = yijian == null ? "" : yijian.trim();
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }
}
