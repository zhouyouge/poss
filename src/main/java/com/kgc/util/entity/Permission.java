package com.kgc.util.entity;

import java.io.Serializable;

/**
 * 权限表
 */
public class Permission implements Serializable {
    /**
     * 权限id
     */
    private  Integer  id;
    /**
     *  权限名称
     */
    private  String name;
    /**
     * 权限所属模块id
     */
    private  Integer applicationId;

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

    public Integer getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(Integer applicationId) {
        this.applicationId = applicationId;
    }
}
