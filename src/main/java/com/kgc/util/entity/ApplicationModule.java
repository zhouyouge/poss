package com.kgc.util.entity;

import java.io.Serializable;

/**
 * 模块表实体类
 */
public class ApplicationModule implements Serializable {
    /**
     * 模块id
     */
    private  Integer id;
    /**
     *模块名称
     */
    private  String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
