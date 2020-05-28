package com.kgc.entity;

import java.io.Serializable;

/**
 * 平台表实体类
 */
public class Platform implements Serializable {
    /**
     * 平台
     */
    private  Integer  id;
    /**
     * 平台名称
     */
    private  String  name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
