package com.kgc.util.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * 代理商实体类
 */
public class Agent implements Serializable {
    /**
     * 平台代理商编号
     */
   private String id;
    /**
     * 代理商名称
     */
    private String name;
    /**
     *平台编号 （关联平台id）
     */
    private   Integer  pId;
    /**
     *归属代理商名称（关联代理商编号）
     */
    private   String parentAgentId;
    /**
     * 代理商级别
     */
    private Integer  level;
    /**
     * 代理商登录账户
     */
    private String userName;
    /**
     * 代理商登记日期
     */
    private Date registerTime;
    /**
     *代理商手机号
     */
    private String phone;
    /**
     * 代理商身份证号
     */

    private  String IDcard;
    /**
     *代理商银行卡号
     */
    private  String  bankCard;
    /**
     *数据来源  0：手动导入，1.批量导入，
     */
    private  Integer  source;
    /**
     *注册日期 导入到平台的日期
     */
    private  Date   importDate;

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

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getParentAgentId() {
        return parentAgentId;
    }

    public void setParentAgentId(String parentAgentId) {
        this.parentAgentId = parentAgentId;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIDcard() {
        return IDcard;
    }

    public void setIDcard(String IDcard) {
        this.IDcard = IDcard;
    }

    public String getBankCard() {
        return bankCard;
    }

    public void setBankCard(String bankCard) {
        this.bankCard = bankCard;
    }

    public Integer getSource() {
        return source;
    }

    public void setSource(Integer source) {
        this.source = source;
    }

    public Date getImportDate() {
        return importDate;
    }

    public void setImportDate(Date importDate) {
        this.importDate = importDate;
    }
}
