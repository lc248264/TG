package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("fankui")
public class Fankui implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private String xingming;

    private String lianxidianhua;

    private String fankuineirong;

    private String fankuiren;

    private String zhuangtai;

    private String huifuneirong;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getXingming() {
        return xingming;
    }

    public void setXingming(String xingming) {
        this.xingming = xingming == null ? "" : xingming.trim();
    }

    public String getLianxidianhua() {
        return lianxidianhua;
    }

    public void setLianxidianhua(String lianxidianhua) {
        this.lianxidianhua = lianxidianhua == null ? "" : lianxidianhua.trim();
    }

    public String getFankuineirong() {
        return fankuineirong;
    }

    public void setFankuineirong(String fankuineirong) {
        this.fankuineirong = fankuineirong == null ? "" : fankuineirong.trim();
    }

    public String getFankuiren() {
        return fankuiren;
    }

    public void setFankuiren(String fankuiren) {
        this.fankuiren = fankuiren == null ? "" : fankuiren.trim();
    }

    public String getZhuangtai() {
        return zhuangtai;
    }

    public void setZhuangtai(String zhuangtai) {
        this.zhuangtai = zhuangtai == null ? "" : zhuangtai.trim();
    }

    public String getHuifuneirong() {
        return huifuneirong;
    }

    public void setHuifuneirong(String huifuneirong) {
        this.huifuneirong = huifuneirong == null ? "" : huifuneirong.trim();
    }
}
