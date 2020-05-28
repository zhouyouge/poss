package com.kgc.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * 机具表实体类
 */
public class PosInfo implements Serializable {
    /**
     * 编号	机具id，
     */
    private  Integer id;
    /**
     *机具编号
     */
    private  String posId;
    /**
     * 机具SN		机具SN唯一标识
     */
    private  String posSN;
    /**
     *总公司机具的入库日期	录入总公司仓库时间，
     */
    private  String storeDate;
    /**
     * 机具的划拨归属代理商	代理商编号（关联代理商编号）
     */
    private  String transferAgentId;
    /**
     *划拨代理商日期		划拨给代理商的日期
     */
    private  String transferDate;
    /**
     *激活状态		Int	0，未激活，1.已激活
     */
    private  Integer activeStatus;
    private  String activeName;
    /**
     *激活日期		机具激活日期
     */
    private  String activeDate;
    /**
     * 达标状态	0未达标，1.已达标
     */
    private  Integer isStandard;
    private String isStandardName;
    /**
     *来源		0：手动导入，1.批量导入，3.对接
     */
    private  Integer source;

    private  String sourceName;
    /**
     *导入平台日期	导入系统时间
     */
    private  String importDate;

    private String platformName;

    private String agentName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPosId() {
        return posId;
    }

    public void setPosId(String posId) {
        this.posId = posId;
    }

    public String getPosSN() {
        return posSN;
    }

    public void setPosSN(String posSN) {
        this.posSN = posSN;
    }

    public String getTransferAgentId() {
        return transferAgentId;
    }

    public void setTransferAgentId(String transferAgentId) {
        this.transferAgentId = transferAgentId;
    }

    public Integer getActiveStatus() {
        return activeStatus;
    }

    public void setActiveStatus(Integer activeStatus) {
        this.activeStatus = activeStatus;
    }


    public Integer getIsStandard() {
        return isStandard;
    }

    public void setIsStandard(Integer isStandard) {
        this.isStandard = isStandard;
    }

    public Integer getSource() {
        return source;
    }

    public void setSource(Integer source) {
        this.source = source;
    }


    public String getPlatformName() {
        return platformName;
    }

    public void setPlatformName(String platformName) {
        this.platformName = platformName;
    }

    public String getAgentName() {
        return agentName;
    }

    public void setAgentName(String agentName) {
        this.agentName = agentName;
    }

    public String getActiveDate() {
        return activeDate;
    }

    public void setActiveDate(String activeDate) {
        this.activeDate = activeDate;
    }

    public String getTransferDate() {
        return transferDate;
    }

    public void setTransferDate(String transferDate) {
        this.transferDate = transferDate;
    }

    public String getStoreDate() {
        return storeDate;
    }

    public void setStoreDate(String storeDate) {
        this.storeDate = storeDate;
    }

    public String getImportDate() {
        return importDate;
    }

    public void setImportDate(String importDate) {
        this.importDate = importDate;
    }

    public String getSourceName() {
        return sourceName;
    }

    public void setSourceName(String sourceName) {
        this.sourceName = sourceName;
    }

    public String getIsStandardName() {
        return isStandardName;
    }

    public void setIsStandardName(String isStandardName) {
        this.isStandardName = isStandardName;
    }

    public String getActiveName() {
        return activeName;
    }

    public void setActiveName(String activeName) {
        this.activeName = activeName;
    }
}
