package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("ruzushenqing")
public class Ruzushenqing implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer zuzhixinxiid;

    private String bianhao;

    private String mingcheng;

    private Integer diqu;

    private String dizhi;

    private String chuangjianren;

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

    public Long getRuzushenheCount() {
        return DB.name("ruzushenhe").where("ruzushenqingid", id).count();
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

    public String getDizhi() {
        return dizhi;
    }

    public void setDizhi(String dizhi) {
        this.dizhi = dizhi == null ? "" : dizhi.trim();
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
