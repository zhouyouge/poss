package com.kgc.entity;

import java.util.Date;
import java.util.List;

public class AgentPage extends Page1 {
    private List<Agent> agentList;
    private List<AgentBaobiao> baobiaoList;
    //激活数量
    private Integer jiju1;
    //激活总数量
    private Integer jiju2;
    //交易总金额
    private Double money;


    /**
     * 平台代理商编号
     */
    private String id;
    /**
     * 代理商名称
     */
    private String name;
    /**
     *平台编号 （关联平台id）
     */
    private   Integer  pId;
    /**
     *归属代理商名称（关联代理商编号）
     */
    private   String parentAgentId;
    /**
     * 代理商级别
     */
    private Integer  level;
    /**
     * 代理商登录账户
     */
    private String userName;
    /**
     * 代理商登记日期
     */
    private String registerTime;
    /**
     *代理商手机号
     */
    private String phone;
    /**
     * 代理商身份证号
     */

    private  String IDcard;
    /**
     *代理商银行卡号
     */
    private  String  bankCard;
    /**
     *数据来源  0：手动导入，1.批量导入，
     */
    private  Integer  source;
    private String sname;
    /**
     *注册日期 导入到平台的日期
     */
    private  String   importDate;
    /**
     * 平台名字
     */
    private String pname;

    /**
     * 机构名字
     * @return
     */
    private String jigou;

    public Integer getJiju1() {
        return jiju1;
    }

    public void setJiju1(Integer jiju1) {
        this.jiju1 = jiju1;
    }

    public Integer getJiju2() {
        return jiju2;
    }

    public void setJiju2(Integer jiju2) {
        this.jiju2 = jiju2;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public List<Agent> getAgentList() {
        return agentList;
    }

    public void setAgentList(List<Agent> agentList) {
        this.agentList = agentList;
    }

    public String getJigou() {
        return jigou;
    }

    public void setJigou(String jigou) {
        this.jigou = jigou;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getParentAgentId() {
        return parentAgentId;
    }

    public void setParentAgentId(String parentAgentId) {
        this.parentAgentId = parentAgentId;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(String registerTime) {
        this.registerTime = registerTime;
    }

    public String getImportDate() {
        return importDate;
    }

    public void setImportDate(String importDate) {
        this.importDate = importDate;
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

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public List<AgentBaobiao> getBaobiaoList() {
        return baobiaoList;
    }

    public void setBaobiaoList(List<AgentBaobiao> baobiaoList) {
        this.baobiaoList = baobiaoList;
    }
}
