package com.kgc.entity;

import java.util.List;

public class PosInfoPage extends Pages{
    private List<PosInfo> saleList;

    public List<PosInfo> getSaleList() {
        return saleList;
    }

    public void setSaleList(List<PosInfo> saleList) {
        this.saleList = saleList;
    }
}
