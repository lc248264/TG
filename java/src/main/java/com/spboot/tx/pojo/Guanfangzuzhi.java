package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("guanfangzuzhi")
public class Guanfangzuzhi implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private String zhanghao;

    private String mima;

    private String xingming;

    private String xingbie;

    private String dianhua;

    private String touxiang;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getZhanghao() {
        return zhanghao;
    }

    public void setZhanghao(String zhanghao) {
        this.zhanghao = zhanghao == null ? "" : zhanghao.trim();
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

    public String getDianhua() {
        return dianhua;
    }

    public void setDianhua(String dianhua) {
        this.dianhua = dianhua == null ? "" : dianhua.trim();
    }

    public String getTouxiang() {
        return touxiang;
    }

    public void setTouxiang(String touxiang) {
        this.touxiang = touxiang == null ? "" : touxiang.trim();
    }
}
