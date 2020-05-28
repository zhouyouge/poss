package com.kgc.util.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * 角色权限关联表
 */
public class AccessRole implements Serializable {
    /**
     * Id
     */
    private  Integer id;
    /**
     * 角色id  （关联角色编号）
     */
    private Integer rId;
    /**
     * 权限id （关联权限编号）
     */
    private Integer permissionid;
    /**
     * 创建日期
     */
    private Date registerTime;
    /**
     * 修改日期
     */
    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }

    public Integer getPermissionid() {
        return permissionid;
    }

    public void setPermissionid(Integer permissionid) {
        this.permissionid = permissionid;
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
}
