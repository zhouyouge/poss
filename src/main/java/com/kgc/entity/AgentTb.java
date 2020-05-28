package com.kgc.entity;

import java.io.Serializable;
import java.util.List;
public class AgentTb implements Serializable {
    private List<AgentJiju> jijuList;
    private List<AgentMoney> moneyList;

    public List<AgentJiju> getJijuList() {
        return jijuList;
    }

    public void setJijuList(List<AgentJiju> jijuList) {
        this.jijuList = jijuList;
    }

    public List<AgentMoney> getMoneyList() {
        return moneyList;
    }

    public void setMoneyList(List<AgentMoney> moneyList) {
        this.moneyList = moneyList;
    }
}
