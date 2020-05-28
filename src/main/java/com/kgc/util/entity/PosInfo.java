package com.kgc.util.entity;

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
    private  Date storeDate;
    /**
     * 机具的划拨归属代理商	代理商编号（关联代理商编号）
     */
    private  String transferAgentId;
    /**
     *划拨代理商日期		划拨给代理商的日期
     */
    private  Date transferDate;
    /**
     *激活状态		Int	0，未激活，1.已激活
     */
    private  Integer activeStatus;
    /**
     *激活日期		机具激活日期
     */
    private  Date activeDate;
    /**
     * 达标状态	0未达标，1.已达标
     */
    private  Integer isStandard;
    /**
     *来源		0：手动导入，1.批量导入，3.对接
     */
    private  Integer source;
    /**
     *导入平台日期	导入系统时间
     */
    private  Date importDate;

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

    public Date getStoreDate() {
        return storeDate;
    }

    public void setStoreDate(Date storeDate) {
        this.storeDate = storeDate;
    }

    public String getTransferAgentId() {
        return transferAgentId;
    }

    public void setTransferAgentId(String transferAgentId) {
        this.transferAgentId = transferAgentId;
    }

    public Date getTransferDate() {
        return transferDate;
    }

    public void setTransferDate(Date transferDate) {
        this.transferDate = transferDate;
    }

    public Integer getActiveStatus() {
        return activeStatus;
    }

    public void setActiveStatus(Integer activeStatus) {
        this.activeStatus = activeStatus;
    }

    public Date getActiveDate() {
        return activeDate;
    }

    public void setActiveDate(Date activeDate) {
        this.activeDate = activeDate;
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

    public Date getImportDate() {
        return importDate;
    }

    public void setImportDate(Date importDate) {
        this.importDate = importDate;
    }
}
