package com.kgc.entity;

import java.io.Serializable;

public class AgentMoney implements Serializable {
    private String aname;
    private Double tmoney;

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public Double getTmoney() {
        return tmoney;
    }

    public void setTmoney(Double tmoney) {
        this.tmoney = tmoney;
    }
}
