package com.kgc.entity;

import java.io.Serializable;

/**
 * @author GJT
 * @create 2020/4/7 9:36
 */
public class AgentBaobiao implements Serializable {
    private String xuhao;
    private String aname;
    private String pname;
    private String juishu;
    private Integer level;
    private Double tmoney;
    private Integer jihuo;

    public String getXuhao() {
        return xuhao;
    }

    public void setXuhao(String xuhao) {
        this.xuhao = xuhao;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getJuishu() {
        return juishu;
    }

    public void setJuishu(String juishu) {
        this.juishu = juishu;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Double getTmoney() {
        return tmoney;
    }

    public void setTmoney(Double tmoney) {
        this.tmoney = tmoney;
    }

    public Integer getJihuo() {
        return jihuo;
    }

    public void setJihuo(Integer jihuo) {
        this.jihuo = jihuo;
    }
}
