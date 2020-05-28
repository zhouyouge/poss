package com.kgc.dao;

import com.kgc.entity.PosInfo;
import com.kgc.entity.PosInfoBaoBIAO;
import com.kgc.entity.PosInfoParamter;
import com.kgc.entity.Agent;
import javafx.geometry.Pos;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("posInfoDao")
public interface PosInfoDao {
    List<PosInfo> getProInfoList(PosInfoParamter paramter);
    PosInfo getProInfoById(int id);
    int deleteProInfoById(int id);
    int count(PosInfoParamter paramter);
    List<PosInfo> getProInfo();
    int addPosInfo(PosInfo posInfo);
    int addPosInfo1(PosInfo posInfo);
    int updatePosInfo(PosInfo posInfo);
    int getSources(String name);
    int getSourcess(String name);
    List<PosInfoBaoBIAO> getBaoBiao();
    int getPosInfoNum(String agentName);
    int getPosInfoNum1(String agentName);
    List<Agent> getJIgou();
}
