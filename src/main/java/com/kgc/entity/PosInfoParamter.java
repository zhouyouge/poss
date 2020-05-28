package com.kgc.entity;


public class PosInfoParamter extends Page {
    private Integer pt;
    private String dls;
    private Integer source;
    private Integer isStand;
    private String posId;
    private String posSN;
    private Integer active;
    private Integer pageIndex;

    public Integer getPt() {
        return pt;
    }

    public void setPt(Integer pt) {
        this.pt = pt;
    }

    public String getDls() {
        return dls;
    }

    public void setDls(String dls) {
        this.dls = dls;
    }

    public Integer getSource() {
        return source;
    }

    public void setSource(Integer source) {
        this.source = source;
    }

    public Integer getIsStand() {
        return isStand;
    }

    public void setIsStand(Integer isStand) {
        this.isStand = isStand;
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

    public Integer getActive() {
        return active;
    }

    public void setActive(Integer active) {
        this.active = active;
    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }
}
