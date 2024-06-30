package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("zhiyuanqiang")
public class Zhiyuanqiang implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private String biaoti;

    private String tupian;

    private String wenti;

    private String faburen;

    private String addtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBiaoti() {
        return biaoti;
    }

    public void setBiaoti(String biaoti) {
        this.biaoti = biaoti == null ? "" : biaoti.trim();
    }

    public String getTupian() {
        return tupian;
    }

    public void setTupian(String tupian) {
        this.tupian = tupian == null ? "" : tupian.trim();
    }

    public String getWenti() {
        return wenti;
    }

    public void setWenti(String wenti) {
        this.wenti = wenti == null ? "" : wenti.trim();
    }

    public String getFaburen() {
        return faburen;
    }

    public void setFaburen(String faburen) {
        this.faburen = faburen == null ? "" : faburen.trim();
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }
}
