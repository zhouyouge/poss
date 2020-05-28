package com.kgc.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 代理商实体类
 */
public class Agent implements Serializable {
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
    private   String  pId;
    /**
     *归属代理商名称（关联代理商编号）
     */
    private   String parentAgentId;
    /**
     * 代理商级别
     */
    private Integer  level;
    private String levelName;
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
    //激活数量
    private Integer jiju1;
    //激活总数量
    private Integer jiju2;
    //交易总金额
    private Double money;
    //排序方式
    private String orderType;
    //开始时间
    private String startTime;
    //结束时间
    private String endTime;
    //交易金额
    private Double tmoney;
    //代理级别
    private String lname;

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public Double getTmoney() {
        return tmoney;
    }

    public void setTmoney(Double tmoney) {
        this.tmoney = tmoney;
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

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

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
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

    public String getLevelName() {
        return levelName;
    }

    public void setLevelName(String levelName) {
        this.levelName = levelName;
    }
}
