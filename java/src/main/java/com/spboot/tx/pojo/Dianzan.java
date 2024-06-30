package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("dianzan")
public class Dianzan implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private String username;

    private Integer biaoid;

    private String biao;

    private String biaoti;

    private String addtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? "" : username.trim();
    }

    public Integer getBiaoid() {
        return biaoid;
    }

    public void setBiaoid(Integer biaoid) {
        this.biaoid = biaoid == null ? 0 : biaoid;
    }

    public String getBiao() {
        return biao;
    }

    public void setBiao(String biao) {
        this.biao = biao == null ? "" : biao.trim();
    }

    public String getBiaoti() {
        return biaoti;
    }

    public void setBiaoti(String biaoti) {
        this.biaoti = biaoti == null ? "" : biaoti.trim();
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }
}
