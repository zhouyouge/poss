package com.kgc.util.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * 机构表
 */
public class Organization implements Serializable {
    /**
     * 机构编号	id
     */
    private  String id;
    /**
     *机构名称
     */
    private  String name;
    /**
     *归属机构id  	（关联机构编号）
     */
    private  String parentOrgId;
    /**
     *联系电话
     */
    private  String phone;
    /**
     *创建者id 		用户id（关联用户编号）
     */
    private  Integer creatorId;
    /**
     *创建日期
     */
    private Date registerTime;
    /**
     *修改日期
     */
    private Date updateTime;
    /**
     *状态		Int	默认0；0.启用2.禁用
     */
    private  Integer status;
    /**
     * 机构级别
     */
    private  Integer level;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getParentOrgId() {
        return parentOrgId;
    }

    public void setParentOrgId(String parentOrgId) {
        this.parentOrgId = parentOrgId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(Integer creatorId) {
        this.creatorId = creatorId;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }
}
