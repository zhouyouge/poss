package com.kgc.util.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * 日志表实体类
 */
public class Log implements Serializable {
    /**
     * 日志id
     */
    private  String id;
    /**
     * 功能名称		操作功能所属板块名称
     */
    private  String applicationName;
    /**
     * 操作名称
     */
    private  String operateName;
    /**
     * 操作人   用户id（关联用户编号）
     */
    private Integer operatorId;
    /**
     *操作日期
     */
    private Date operateTime;
    /**
     *操作人归属机构id		用户所属机构（关联机构编号）
     */
    private  String orgId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getApplicationName() {
        return applicationName;
    }

    public void setApplicationName(String applicationName) {
        this.applicationName = applicationName;
    }

    public String getOperateName() {
        return operateName;
    }

    public void setOperateName(String operateName) {
        this.operateName = operateName;
    }

    public Integer getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(Integer operatorId) {
        this.operatorId = operatorId;
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }
}
