package com.kgc.service;

import com.kgc.entity.*;
import com.kgc.entity.Page;
import com.kgc.entity.ResponseResult;

import java.util.List;

public interface PosInfoService {
    Page<PosInfo> query(PosInfoParamter paramter);
    PosInfo getProInfoById(int id);
    ResponseResult deleteProInfoById(int id);
    List<PosInfo> getProInfo();
    boolean addPosInfos(PosInfo posInfo);
    ResponseResult addPosInfo(PosInfo posInfo);
    ResponseResult updatePosInfo(PosInfo posInfo);
    PTsourcess ptSources();
    List<PosInfoBaoBIAO> getBaoBiao();
    Tree<Agent> agentTree();
}
