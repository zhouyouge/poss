package com.kgc.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * 机构代理商关联表实体类
 */
public class OrganizationAgent implements Serializable {
    /**
     * Id
     */
    private  Integer id;
    /**
     * 机构id		归属机构id（关联机构编号）
     */
    private Integer orgId;
    /**
     *代理商id		代理商的id（关联代理商编号）
     */
    private Integer agentId;
    /**
     *关联时间
     */
    private Date registerTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrgId() {
        return orgId;
    }

    public void setOrgId(Integer orgId) {
        this.orgId = orgId;
    }

    public Integer getAgentId() {
        return agentId;
    }

    public void setAgentId(Integer agentId) {
        this.agentId = agentId;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }
}
