package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("huodongshenqing")
public class Huodongshenqing implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer zuzhihuodongid;

    private Integer zuzhixinxiid;

    private String bianhao;

    private String mingcheng;

    private Integer diqu;

    private String chuangjianren;

    private String huodongzhuti;

    private String kaishishijian;

    private String jieshushijian;

    private Integer huodongshizhang;

    private String huodongdizhi;

    private String xingming;

    private String dianhua;

    private String shenqingyuanyin;

    private String shenqingzhuangtai;

    private String shenqingren;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getShenheshenqingCount() {
        return DB.name("shenheshenqing").where("huodongshenqingid", id).count();
    }

    public Long getJiesuanzhiyuanCount() {
        return DB.name("jiesuanzhiyuan").where("huodongshenqingid", id).count();
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

    public String getHuodongdizhi() {
        return huodongdizhi;
    }

    public void setHuodongdizhi(String huodongdizhi) {
        this.huodongdizhi = huodongdizhi == null ? "" : huodongdizhi.trim();
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

    public String getShenqingyuanyin() {
        return shenqingyuanyin;
    }

    public void setShenqingyuanyin(String shenqingyuanyin) {
        this.shenqingyuanyin = shenqingyuanyin == null ? "" : shenqingyuanyin.trim();
    }

    public String getShenqingzhuangtai() {
        return shenqingzhuangtai;
    }

    public void setShenqingzhuangtai(String shenqingzhuangtai) {
        this.shenqingzhuangtai = shenqingzhuangtai == null ? "" : shenqingzhuangtai.trim();
    }

    public String getShenqingren() {
        return shenqingren;
    }

    public void setShenqingren(String shenqingren) {
        this.shenqingren = shenqingren == null ? "" : shenqingren.trim();
    }
}
