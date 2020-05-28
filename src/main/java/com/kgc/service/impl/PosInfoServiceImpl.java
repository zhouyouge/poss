package com.kgc.service.impl;

import com.kgc.LogUtil.LogAnnotation;
import com.kgc.dao.PlatformDao;
import com.kgc.dao.PosInfoDao;
import com.kgc.entity.*;
import com.kgc.entity.Page;
import com.kgc.entity.ResponseResult;
import com.kgc.service.PosInfoService;
import com.kgc.util.BuildTree;
import com.sun.org.apache.xerces.internal.xs.LSInputList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("posInfoService")
public class PosInfoServiceImpl implements PosInfoService {

    @Autowired
    private PosInfoDao posInfoDao;
    @Autowired
    private PlatformDao platformDao;

    @Override
    public Page<PosInfo> query(PosInfoParamter paramter) {
      /*  if (StringUtils.isEmpty(paramter)){
            paramter = new PosInfoParamter();
        }
        paramter.setPageIndex((paramter.getCurPage()-1)*paramter.getPageSize());

        int count = posInfoDao.count();
        List<PosInfo> list = posInfoDao.getProInfoList(paramter);
        PosInfoPage page= new PosInfoPage();
        page.setTotalCount(count);
        page.setSaleList(list);
        page.setCurPage(paramter.getCurPage());
        page.setPageSize(paramter.getPageSize());
        page.setTotalPageCount((count/page.getPageSize())+((count%page.getPageSize())==0?0:1));*/
        Page<PosInfo> p= new Page<PosInfo>();
        p.setPageon(paramter.getPageon());//设置当前页
        int i=posInfoDao.count(paramter);//获得总记录数
        p.setCount(i);//设置总记录数
        if(i%10==0){ //写死了每页显示5条     可以用三目运算 就 0；0?1这个
            p.setPages(i/10);
        }else{
            p.setPages((i/10)+1);
        }
        paramter.setPageIndex((paramter.getPageon()-1)*10);

        p.setList(posInfoDao.getProInfoList(paramter));//每个条数里面的内容

        return p;

    }
    @LogAnnotation(moduleName="机具信息",operate = "机具信息根据id查询")
    @Override
    public PosInfo getProInfoById(int id) {
        return posInfoDao.getProInfoById(id);
    }
    @LogAnnotation(moduleName="机具信息",operate = "删除机具信息")
    @Override
    public ResponseResult deleteProInfoById(int id) {
        ResponseResult rs= new ResponseResult();
        if(posInfoDao.deleteProInfoById(id)>0){
            rs.setFlag(1);
            rs.setResult(true);
            rs.setData("删除成功！");
        }else {
            rs.setFlag(2);
            rs.setResult(false);
            rs.setData("删除失败！");
        }
        return rs;
    }

    @Override
    public List<PosInfo> getProInfo() {
        return posInfoDao.getProInfo();
    }

    @Override
    public boolean addPosInfos(PosInfo posInfo) {
        return posInfoDao.addPosInfo(posInfo)>0;
    }
    @LogAnnotation(moduleName="机具信息",operate = "添加机具信息")
    @Override
    public ResponseResult addPosInfo(PosInfo posInfo) {
        ResponseResult rs= new ResponseResult();
        if (StringUtils.isEmpty(posInfo)){
            rs.setFlag(1);
            rs.setData("传参为空");
        }
        if (StringUtils.isEmpty(posInfo.getPosSN())){
            rs.setFlag(2);
            rs.setData("机具SN为空");
        }
        if(StringUtils.isEmpty(posInfo.getStoreDate())){
            rs.setFlag(3);
            rs.setData("入库时间不能为空");
        }
        if(StringUtils.isEmpty(posInfo.getActiveStatus())){
            rs.setFlag(4);
            rs.setData("激活状态不能为空");
        }else {
            if(posInfo.getActiveStatus()==0){
               if (!StringUtils.isEmpty(posInfo.getActiveDate())){
                   rs.setFlag(5);
                   rs.setData("该机具还未激活");
                   return rs;
               }
            }
        }
        if (StringUtils.isEmpty(posInfo.getIsStandard())){
            rs.setFlag(6);
            rs.setData("达标状态不能为空");
        } else {
            if (posInfoDao.addPosInfo1(posInfo)>0){
                rs.setFlag(7);
                rs.setData("添加成功");
                rs.setResult(true);
            }else {
                rs.setFlag(8);
                rs.setData("添加失败");
            }

        }
        return rs;
    }
    @LogAnnotation(moduleName="机具信息",operate = "修改机具信息")
    @Override
    public ResponseResult updatePosInfo(PosInfo posInfo) {
        ResponseResult rs= new ResponseResult();
        if (StringUtils.isEmpty(posInfo)){
            rs.setFlag(1);
            rs.setData("传参为空");
        }
        if (StringUtils.isEmpty(posInfo.getPosSN())){
            rs.setFlag(2);
            rs.setData("机具SN为空");
        }
        if(StringUtils.isEmpty(posInfo.getStoreDate())){
            rs.setFlag(3);
            rs.setData("入库时间不能为空");
        }
        if(StringUtils.isEmpty(posInfo.getActiveStatus())){
            rs.setFlag(4);
            rs.setData("激活状态不能为空");
        }else {
            if(posInfo.getActiveStatus()==0){
                if (!StringUtils.isEmpty(posInfo.getActiveDate())){
                    rs.setFlag(5);
                    rs.setData("该机具还未激活");
                    return rs;
                }
            }
        }
        if (posInfoDao.updatePosInfo(posInfo)>0){
            rs.setFlag(6);
            rs.setData("添加成功");
            rs.setResult(true);
        }else {
            rs.setFlag(7);
            rs.setData("添加失败");
        }


        return rs;
    }

    @Override
    public PTsourcess ptSources() {
        List<Platform> platforms= platformDao.queryPlat();
        PTsourcess pTsourcess = new PTsourcess();
        List<PTsources> jihuo=new ArrayList<PTsources>();
        List<PTsources> yongyou=new ArrayList<PTsources>();
        for (Platform p:platforms){
            PTsources pt=new PTsources();
            pt.setName(p.getName());
            pt.setNum(posInfoDao.getSources(p.getName()));
            jihuo.add(pt);
        }
        for (Platform p:platforms){
            PTsources pt=new PTsources();
            pt.setName(p.getName());
            pt.setNum(posInfoDao.getSourcess(p.getName()));
            yongyou.add(pt);
        }
        pTsourcess.setList1(yongyou);
        pTsourcess.setList2(jihuo);
        return pTsourcess;
    }

    @Override
    public List<PosInfoBaoBIAO> getBaoBiao() {
        List<PosInfoBaoBIAO> posInfoBaoBIAOS = posInfoDao.getBaoBiao();
        List<PosInfoBaoBIAO> baobiao=new ArrayList<PosInfoBaoBIAO>();
        for (PosInfoBaoBIAO pi:posInfoBaoBIAOS){
            if (posInfoDao.getPosInfoNum(pi.getAgentName())==0 && posInfoDao.getPosInfoNum1(pi.getAgentName())==0){
                continue;
            }
            PosInfoBaoBIAO p=new PosInfoBaoBIAO();
            p.setAgentName(pi.getAgentName());
            p.setPlatformName(pi.getPlatformName());
            p.setName(pi.getName());
            p.setLevelName(pi.getLevelName());
            p.setJijushuliang(posInfoDao.getPosInfoNum(pi.getAgentName()));
            p.setJijujihuo(posInfoDao.getPosInfoNum1(pi.getAgentName()));
            baobiao.add(p);
        }
        return baobiao;
    }

    @Override
    public Tree<Agent> agentTree() {
        List<Tree<Agent>> trees=new ArrayList<Tree<Agent>>();
        List<Agent> agents = posInfoDao.getJIgou();

        for (Agent test : agents) {
            Tree<Agent> tree = new Tree<Agent>();
            tree.setId(test.getId());
            tree.setParent_itemtypeid(test.getParentAgentId());
            tree.setLevelName(test.getLevelName());
            tree.setName(test.getName());
            trees.add(tree);
        }
        Tree<Agent> tree= BuildTree.build(trees);
        return tree;
    }


}
