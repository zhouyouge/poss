package com.kgc.service.impl;

import com.kgc.LogUtil.LogAnnotation;
import com.kgc.dao.AgentDao;
import com.kgc.entity.*;

import com.kgc.service.AgentService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author GJT
 * @create 2020/3/26 23:44
 */
@Service("agentService")
public class AgentServiceImpl implements AgentService {

    @Resource
    private AgentDao agentDao;


    @Override
    public AgentPage fenye(AgentPage agentPage) {
        if(StringUtils.isEmpty(agentPage)){
            agentPage=new AgentPage();
        }
        agentPage.setPageIndex((agentPage.getCurPage()-1)*agentPage.getPageSize());
        int count=agentDao.count(agentPage);
        List<Agent> list=agentDao.fenye(agentPage);
        AgentPage agentPage1=new AgentPage();
        agentPage1.setTotalCount(count);
        agentPage1.setAgentList(list);
        agentPage1.setCurPage(agentPage.getCurPage());
        agentPage1.setPageSize(agentPage.getPageSize());
        agentPage1.setPageIndex((agentPage.getCurPage()-1)*agentPage.getPageSize());
        agentPage1.setTotalPageCount(count/agentPage.getPageSize()+(count%agentPage.getPageSize()==0?0:1));
        agentPage1.setStartTime(agentPage.getStartTime());
        agentPage1.setEndTime(agentPage.getEndTime());
        return agentPage1;
    }
    @LogAnnotation(moduleName="代理商信息",operate = "添加代理商信息")
    @Override
    public ResponseResult add(Agent agent) {
        ResponseResult rs=new ResponseResult();
        if(StringUtils.isEmpty(agent)){
            rs.setResult(false);
        }else {
            if(agentDao.add(agent)>0){
                rs.setResult(true);
                rs.setFlag(1);
            }
        }
        return rs;
    }
    @LogAnnotation(moduleName="代理商信息",operate = "修改代理商信息")
    @Override
    public ResponseResult update(Agent agent) {
        ResponseResult rs1=new ResponseResult();
        if(StringUtils.isEmpty(agent)){
            rs1.setResult(false);
        }else {
            if(agentDao.update(agent)>0){
                rs1.setResult(true);
                rs1.setFlag(1);
            }
        }
        return rs1;
    }
    @LogAnnotation(moduleName="代理商信息",operate = "根据id删除代理商信息")
    @Override
    public ResponseResult del(String id) {
        ResponseResult rs=new ResponseResult();
        if(StringUtils.isEmpty(id)){
            rs.setResult(false);
        }else {
            if(agentDao.del(id)>0){
                rs.setResult(true);
                rs.setFlag(1);
            }
        }
        return rs;
    }

    @Override
    public Agent getById(String id) {
        return agentDao.getById(id);
    }

    @Override
    public List<Agent> excle() {
        return agentDao.excel();
    }

    @Override
    public AgentPage tb(AgentPage agentPage) {
        int count=agentDao.tbcount(agentPage);
        int jiju2=agentDao.jiju2();
        double money=agentDao.money();
        List<AgentBaobiao> baobiaoList=new ArrayList<>();
        agentPage.setPageIndex((agentPage.getCurPage()-1)*agentPage.getPageSize());
        List<Agent> agentList=agentDao.tb(agentPage);
        if(StringUtils.isEmpty(agentPage.getName())){
            for(Agent agent:agentList){
                AgentBaobiao agentBaobiao=new AgentBaobiao();
                agentBaobiao.setAname(agent.getName());
                agentBaobiao.setJihuo(agentDao.bcount(agent.getName()));
                agentBaobiao.setJuishu(agent.getJigou());
                agentBaobiao.setLevel(agent.getLevel());
                agentBaobiao.setPname(agent.getPname());
                agentBaobiao.setXuhao(agent.getId());
                agentBaobiao.setTmoney(agent.getTmoney());
                baobiaoList.add(agentBaobiao);
            }
        }else{
            for(Agent agent1:agentList){
                AgentBaobiao agentBaobiao=new AgentBaobiao();
                agentBaobiao.setAname(agentPage.getName());
                agentBaobiao.setJihuo(agentDao.bcount(agentPage.getName()));
                agentBaobiao.setJuishu(agent1.getJigou());
                agentBaobiao.setLevel(agent1.getLevel());
                agentBaobiao.setPname(agent1.getPname());
                agentBaobiao.setXuhao(agent1.getId());
                agentBaobiao.setTmoney(agent1.getTmoney());
                baobiaoList.add(agentBaobiao);
            }
        }

            AgentPage agentPage1=new AgentPage();
            agentPage1.setStartTime(agentPage.getStartTime());
            agentPage1.setEndTime(agentPage.getEndTime());
            agentPage1.setOrderType(agentPage.getOrderType());
            agentPage1.setAgentList(agentList);
            agentPage1.setBaobiaoList(baobiaoList);
            agentPage1.setMoney(money);
            agentPage1.setTotalCount(count);
            agentPage1.setCurPage(agentPage.getCurPage());
            agentPage1.setPageSize(agentPage.getPageSize());
            agentPage1.setPageIndex((agentPage.getCurPage()-1)*agentPage.getPageSize());
            agentPage1.setTotalPageCount(count/agentPage.getPageSize()+(count%agentPage.getPageSize()==0?0:1));
            agentPage1.setJiju2(jiju2);
            return agentPage1;



    }

    @Override
    public List<AgentMoney> amoney() {
        return agentDao.amoney();
    }

    @Override
    public List<AgentJiju> acount() {
        return agentDao.acount();
    }

}
