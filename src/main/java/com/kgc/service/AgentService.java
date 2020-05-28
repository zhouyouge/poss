package com.kgc.service;

import com.kgc.entity.*;

import java.util.List;

/**
 * @author GJT
 * @create 2020/3/26 23:43
 */
public interface AgentService {

    //分页查询代理商表
    AgentPage fenye(AgentPage agentPage);
    //添加代理商
    ResponseResult add(Agent agent);
    //修改代理商
    ResponseResult update(Agent agent);
    //删除代理商
    ResponseResult del(String id);
    //根据id查询代理商表
    Agent getById(String id);
    /**
     * 导出Excel需要的接口
     * @return
     */
    List<Agent> excle();
    //报表查询
    AgentPage tb(AgentPage agentPage);
    //chanxun每个代理商的总交易额
    List <AgentMoney> amoney();
    //查询每一个代理商激活的总机具数
    List<AgentJiju> acount();
}
