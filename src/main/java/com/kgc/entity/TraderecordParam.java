package com.kgc.entity;


public class TraderecordParam extends Page {
  private   Integer gname;//公司机构
    private Integer  pname;//平台名称
    private  String sname;//商户名字
    private String aname;//归属代理商
    private Integer source;//数据来源
    private String merchantNo;//商户编号
    private String importdate;


    private  String startTime;//开始时间
    private  String  endTime;//结束时间

    private String orderBy;//排序类型
    private String orderType="desc";//排序方式

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

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public String getImportdate() {
        return importdate;
    }


    public void setImportdate(String importdate) {
        this.importdate = importdate;
    }



    public String getMerchantNo() {
        return merchantNo;
    }

    public void setMerchantNo(String merchantNo) {
        this.merchantNo = merchantNo;
    }

    public Integer getGname() {
        return gname;
    }

    public void setGname(Integer gname) {
        this.gname = gname;
    }

    public Integer getPname() {
        return pname;
    }

    public void setPname(Integer pname) {
        this.pname = pname;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }


    public Integer getSource() {
        return source;
    }


    public void setSource(Integer source) {
        this.source = source;
    }


}
