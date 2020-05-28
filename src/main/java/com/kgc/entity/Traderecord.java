package com.kgc.entity;

import java.io.Serializable;

/**
 * (Traderecord)实体类
 *
 * @author yoyo
 * @since 2020-03-24 17:58:21
 */
public class Traderecord implements Serializable {
    private static final long serialVersionUID = 755846924395658479L;
    /**
    * 交易流水号
    */
    private String id;
    /**
    * 归属的平台id，Notnull（关联平台id）
    */
    private Integer pid;
    /**
    * 归属代理商Id（关联代理商编号）
    */
    private Integer parentagentid;
    /**
    * 商户编号（关联商户编号）
    */
    private String mid;
    /**
     * 交易时间
     */
    private String tradedate;
    /**
    * 交易银行卡号
    */
    private String bankcard;
    /**
    * 交易金额
    */
    private Double trademoney;
    /**
    * 实际到账金额
    */
    private Double realamount;
    /**
    * 手续费
    */
    private Double poundage;
    /**
     * 费率
     */
    
    private Double rate;
    /**
    * 机具id  机具SN，Notnull（关联机具编号）
    */
    private String posid;
    /**
    * 0：手动导入，1.批量导入
    */
    private Integer source;
    /**
    * 导入时间 录入系统时间
    */
    private String importdate;

    //实体类没有的下面为参数


    private Source sourceList;//字典表 0导入  1 批量导入  2 对接
    private Agent agentList;//代理商表
    private Merchant merchantList;//商户表
    private Platform platformList;//平台表
    private PosInfo posInfoList;//机具表
    private Organization organization;//机构表
    private OrganizationAgent organizationAgent;//机构代理商关联表

    public Source getSourceList() {
        return sourceList;
    }

    public void setSourceList(Source sourceList) {
        this.sourceList = sourceList;
    }

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public OrganizationAgent getOrganizationAgent() {
        return organizationAgent;
    }

    public void setOrganizationAgent(OrganizationAgent organizationAgent) {
        this.organizationAgent = organizationAgent;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getParentagentid() {
        return parentagentid;
    }

    public void setParentagentid(Integer parentagentid) {
        this.parentagentid = parentagentid;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getTradedate() {
        return tradedate;
    }

    public void setTradedate(String tradedate) {
        this.tradedate = tradedate;
    }

    public String getBankcard() {
        return bankcard;
    }

    public void setBankcard(String bankcard) {
        this.bankcard = bankcard;
    }

    public Double getTrademoney() {
        return trademoney;
    }

    public void setTrademoney(Double trademoney) {
        this.trademoney = trademoney;
    }

    public Double getRealamount() {
        return realamount;
    }

    public void setRealamount(Double realamount) {
        this.realamount = realamount;
    }

    public Double getPoundage() {
        return poundage;
    }

    public void setPoundage(Double poundage) {
        this.poundage = poundage;
    }

    public Double getRate() {
        return rate;
    }

    public void setRate(Double rate) {
        this.rate = rate;
    }

    public String getPosid() {
        return posid;
    }

    public void setPosid(String posid) {
        this.posid = posid;
    }

    public Integer getSource() {
        return source;
    }

    public void setSource(Integer source) {
        this.source = source;
    }

    public String getImportdate() {
        return importdate;
    }

    public void setImportdate(String importdate) {
        this.importdate = importdate;
    }

    public Agent getAgentList() {
        return agentList;
    }

    public void setAgentList(Agent agentList) {
        this.agentList = agentList;
    }

    public Merchant getMerchantList() {
        return merchantList;
    }

    public void setMerchantList(Merchant merchantList) {
        this.merchantList = merchantList;
    }

    public Platform getPlatformList() {
        return platformList;
    }

    public void setPlatformList(Platform platformList) {
        this.platformList = platformList;
    }

    public PosInfo getPosInfoList() {
        return posInfoList;
    }

    public void setPosInfoList(PosInfo posInfoList) {
        this.posInfoList = posInfoList;
    }
}