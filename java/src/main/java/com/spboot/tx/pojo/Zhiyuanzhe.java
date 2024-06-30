package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("zhiyuanzhe")
public class Zhiyuanzhe implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private String xuehao;

    private String mima;

    private String xingming;

    private String xingbie;

    private String shouji;

    private String youxiang;

    private String yuanxi;

    private String xuexiao;

    private Integer gongyishizhang;

    private String touxiang;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getXuehao() {
        return xuehao;
    }

    public void setXuehao(String xuehao) {
        this.xuehao = xuehao == null ? "" : xuehao.trim();
    }

    public String getMima() {
        return mima;
    }

    public void setMima(String mima) {
        this.mima = mima == null ? "" : mima.trim();
    }

    public String getXingming() {
        return xingming;
    }

    public void setXingming(String xingming) {
        this.xingming = xingming == null ? "" : xingming.trim();
    }

    public String getXingbie() {
        return xingbie;
    }

    public void setXingbie(String xingbie) {
        this.xingbie = xingbie == null ? "" : xingbie.trim();
    }

    public String getShouji() {
        return shouji;
    }

    public void setShouji(String shouji) {
        this.shouji = shouji == null ? "" : shouji.trim();
    }

    public String getYouxiang() {
        return youxiang;
    }

    public void setYouxiang(String youxiang) {
        this.youxiang = youxiang == null ? "" : youxiang.trim();
    }

    public String getYuanxi() {
        return yuanxi;
    }

    public void setYuanxi(String yuanxi) {
        this.yuanxi = yuanxi == null ? "" : yuanxi.trim();
    }

    public String getXuexiao() {
        return xuexiao;
    }

    public void setXuexiao(String xuexiao) {
        this.xuexiao = xuexiao == null ? "" : xuexiao.trim();
    }

    public Integer getGongyishizhang() {
        return gongyishizhang;
    }

    public void setGongyishizhang(Integer gongyishizhang) {
        this.gongyishizhang = gongyishizhang == null ? 0 : gongyishizhang;
    }

    public String getTouxiang() {
        return touxiang;
    }

    public void setTouxiang(String touxiang) {
        this.touxiang = touxiang == null ? "" : touxiang.trim();
    }
}
