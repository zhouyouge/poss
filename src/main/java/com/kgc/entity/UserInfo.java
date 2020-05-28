package com.kgc.entity;

import org.springframework.util.StringUtils;

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
    private Integer orgId;
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
    private String registerTime;

    /**
     *修改时间
     */
    private String updateTime;
    //机构名字
    private String oname;
    //角色名称
    private String rname;

    public String getOname() {
        return oname;
    }

    public void setOname(String oname) {
        this.oname = oname;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

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

    public Integer getOrgId() {
        return orgId;
    }

    public void setOrgId(Integer orgId) {
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


    public String getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(String registerTime) {
        this.registerTime = registerTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }
}
