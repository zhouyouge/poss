package com.kgc.util.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * 商户表实体类
 */
public class Merchant implements Serializable {
    /**
     * 编号	商户id
     */
    private  String id;
    /**
     *商户编号（导入进来的）
     */
    private  String merchantNo;
    /**
     * 商户名称
     */
    private  String name;
    /**
     *商户类型
     */
    private  String nickName;
    /**
     *  手机号
     */
    private  String phone;
    /**
     *商户身份证号
     */
    private  String IDcard;
    /**
     * 商户归属代理商编号		（关联代理商编号）
     */
    private  String parentAgentId;
    /**
     *商户到账卡号
     */
    private  String bankCard;
    /**
     *数据来源		Int	0：手动导入，1.批量导入，3.对接
     */
    private  Integer source;
    /**
     *	登记的日期
     */
    private Date registerTime;
    /**
     *	录入平台的日期
     */
    private Date importDate;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMerchantNo() {
        return merchantNo;
    }

    public void setMerchantNo(String merchantNo) {
        this.merchantNo = merchantNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
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

    public String getParentAgentId() {
        return parentAgentId;
    }

    public void setParentAgentId(String parentAgentId) {
        this.parentAgentId = parentAgentId;
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

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public Date getImportDate() {
        return importDate;
    }

    public void setImportDate(Date importDate) {
        this.importDate = importDate;
    }
}
