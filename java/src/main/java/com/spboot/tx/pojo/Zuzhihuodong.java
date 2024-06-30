package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("zuzhihuodong")
public class Zuzhihuodong implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer zuzhixinxiid;

    private String bianhao;

    private String mingcheng;

    private Integer diqu;

    private String chuangjianren;

    private String huodongzhuti;

    private String tupian;

    private String kaishishijian;

    private String jieshushijian;

    private Integer huodongshizhang;

    private Integer huodongrenshu;

    private String huodongdizhi;

    private String shenhezhuangtai;

    private String huodongjieshao;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getHuodongshenheCount() {
        return DB.name("huodongshenhe").where("zuzhihuodongid", id).count();
    }

    public Long getHuodongshenqingCount() {
        return DB.name("huodongshenqing").where("zuzhihuodongid", id).count();
    }

    public Integer getZuzhixinxiid() {
        return zuzhixinxiid;
    }

    public void setZuzhixinxiid(Integer zuzhixinxiid) {
        this.zuzhixinxiid = zuzhixinxiid == null ? 0 : zuzhixinxiid;
    }

    public String getBianhao() {
        return bianhao;
    }

    public void setBianhao(String bianhao) {
        this.bianhao = bianhao == null ? "" : bianhao.trim();
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

    public String getTupian() {
        return tupian;
    }

    public void setTupian(String tupian) {
        this.tupian = tupian == null ? "" : tupian.trim();
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

    public Integer getHuodongrenshu() {
        return huodongrenshu;
    }

    public void setHuodongrenshu(Integer huodongrenshu) {
        this.huodongrenshu = huodongrenshu == null ? 0 : huodongrenshu;
    }

    public String getHuodongdizhi() {
        return huodongdizhi;
    }

    public void setHuodongdizhi(String huodongdizhi) {
        this.huodongdizhi = huodongdizhi == null ? "" : huodongdizhi.trim();
    }

    public String getShenhezhuangtai() {
        return shenhezhuangtai;
    }

    public void setShenhezhuangtai(String shenhezhuangtai) {
        this.shenhezhuangtai = shenhezhuangtai == null ? "" : shenhezhuangtai.trim();
    }

    public String getHuodongjieshao() {
        return huodongjieshao;
    }

    public void setHuodongjieshao(String huodongjieshao) {
        this.huodongjieshao = huodongjieshao == null ? "" : huodongjieshao.trim();
    }
}
