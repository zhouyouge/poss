package com.kgc.util.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;

/**
 * 交易表实体类
 */
public class TradeRecord implements Serializable {
    /**
     * 编号			流水号
     */
    private String id;
    /**
     *平台编号		归属的平台id，（关联平台id）
     */
    private  Integer pId;
    /**
     *归属代理商编号			归属代理商Id（关联代理商编号）
     */
    private  Integer parentAgentId;
    /**
     * 商户编号	商户编号（关联商户编号）
     */
    private String mId;
    /**
     * 交易日期			交易时间，
     */
    private Date tradeDate;
    /**
     *交易卡号			交易银行卡号，
     */
    private String bankCard;
    /**
     *交易金额		交易金额
     */
    private BigDecimal tradeMoney;
    /**
     *结算金额	实际到账金额，
     */
    private BigDecimal realAmount;
    /**
     *手续费		交易手续费，
     */
    private BigDecimal poundage;
    /**
     *费率		银行卡费率，
     */
    private BigDecimal rate;
    /**
     *机具id  		机具SN，（关联机具编号）
     */
    private String posID;
    /**
     *来源		Int	0：手动导入，1.批量导入，3.对接
     */
    private  Integer source;
    /**
     *导入时间		Date	录入系统时间，
     */
    private Date importDate;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public Integer getParentAgentId() {
        return parentAgentId;
    }

    public void setParentAgentId(Integer parentAgentId) {
        this.parentAgentId = parentAgentId;
    }

    public String getmId() {
        return mId;
    }

    public void setmId(String mId) {
        this.mId = mId;
    }

    public Date getTradeDate() {
        return tradeDate;
    }

    public void setTradeDate(Date tradeDate) {
        this.tradeDate = tradeDate;
    }

    public String getBankCard() {
        return bankCard;
    }

    public void setBankCard(String bankCard) {
        this.bankCard = bankCard;
    }

    public BigDecimal getTradeMoney() {
        return tradeMoney;
    }

    public void setTradeMoney(BigDecimal tradeMoney) {
        this.tradeMoney = tradeMoney;
    }

    public BigDecimal getRealAmount() {
        return realAmount;
    }

    public void setRealAmount(BigDecimal realAmount) {
        this.realAmount = realAmount;
    }

    public BigDecimal getPoundage() {
        return poundage;
    }

    public void setPoundage(BigDecimal poundage) {
        this.poundage = poundage;
    }

    public BigDecimal getRate() {
        return rate;
    }

    public void setRate(BigDecimal rate) {
        this.rate = rate;
    }

    public String getPosID() {
        return posID;
    }

    public void setPosID(String posID) {
        this.posID = posID;
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
