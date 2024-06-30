package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("zuzhixinxi")
public class Zuzhixinxi implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private String bianhao;

    private String mingcheng;

    private Integer diqu;

    private String tupian;

    private String dianhua;

    private String dizhi;

    private String jianjie;

    private String shenhezhuangtai;

    private String chuangjianren;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getZuzhishenheCount() {
        return DB.name("zuzhishenhe").where("zuzhixinxiid", id).count();
    }

    public Long getZuzhihuodongCount() {
        return DB.name("zuzhihuodong").where("zuzhixinxiid", id).count();
    }

    public Long getRuzushenqingCount() {
        return DB.name("ruzushenqing").where("zuzhixinxiid", id).count();
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

    public String getTupian() {
        return tupian;
    }

    public void setTupian(String tupian) {
        this.tupian = tupian == null ? "" : tupian.trim();
    }

    public String getDianhua() {
        return dianhua;
    }

    public void setDianhua(String dianhua) {
        this.dianhua = dianhua == null ? "" : dianhua.trim();
    }

    public String getDizhi() {
        return dizhi;
    }

    public void setDizhi(String dizhi) {
        this.dizhi = dizhi == null ? "" : dizhi.trim();
    }

    public String getJianjie() {
        return jianjie;
    }

    public void setJianjie(String jianjie) {
        this.jianjie = jianjie == null ? "" : jianjie.trim();
    }

    public String getShenhezhuangtai() {
        return shenhezhuangtai;
    }

    public void setShenhezhuangtai(String shenhezhuangtai) {
        this.shenhezhuangtai = shenhezhuangtai == null ? "" : shenhezhuangtai.trim();
    }

    public String getChuangjianren() {
        return chuangjianren;
    }

    public void setChuangjianren(String chuangjianren) {
        this.chuangjianren = chuangjianren == null ? "" : chuangjianren.trim();
    }
}
