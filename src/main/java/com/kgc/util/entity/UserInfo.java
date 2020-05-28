package com.kgc.util.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * 用户表实体类
 */
public class UserInfo implements Serializable {
    /**
     *  用户编号
     */
    private String id;
    /**
     *登陆账户
     */
    private String username;
    /**
     *归属机构id  归属机构的id，Notnull（关联机构编号）
     */
    private String orgId;
    /**
     * 级别			用户归属机构级别
     */
    private Integer level;
    /**
     *角色id  			角色的id（关联角色编号）
     */
    private Integer roleId;
    /**
     *密码		默认手机号后6位
     */
    private String password;
    /**
     *联系电话
     */
    private String phone;
    /**
     *创建时间
     */
    private Date registerTime;

    /**
     *修改时间
     */
    private Date updateTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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
