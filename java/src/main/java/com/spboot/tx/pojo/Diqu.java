package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("diqu")
public class Diqu implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private String diquming;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDiquming() {
        return diquming;
    }

    public void setDiquming(String diquming) {
        this.diquming = diquming == null ? "" : diquming.trim();
    }
}
