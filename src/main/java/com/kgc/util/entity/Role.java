package com.kgc.util.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * 角色表实体类
 */
public class Role implements Serializable {
    /**
     * 角色id
     */
    private  Integer id;
    /**
     *角色名称
     */
    private String name;
    /**
     *创建者id
     */
    private  Integer creatorId;
    /**
     *创建时间
     */
    private Date createTime;
    /**
     *修改时间
     */
    private Date updateTime;

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

    public Integer getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(Integer creatorId) {
        this.creatorId = creatorId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
