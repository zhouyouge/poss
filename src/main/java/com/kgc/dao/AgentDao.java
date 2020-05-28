package com.kgc.dao;

import com.kgc.entity.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author GJT
 * @create 2020/3/26 23:40
 */
@Repository("agentDao")
public interface AgentDao {
    //查询代理商表有多少数据
    int count(AgentPage agentPage);
    //分页查询代理商表
    List<Agent> fenye(AgentPage agentPage);
    //添加代理商
    int add(Agent agent);
    //修改代理商
    int update(Agent agent);
    //删除代理商
    int del(@Param("id") String id);
    //根据id查询代理商表
    Agent getById(@Param("id") String id);

    /**
     * 导出Excel需要的全查
     * @return
     */
    List<Agent> excel();

    // <!--查询机具总激活数量-->
    int jiju2();
    //  <!--查询总交易金额-->
    Double money();
    //报表查询
    List<Agent> tb(AgentPage agentPage);
    //条件查询每一个代理商的激活量
    int bcount(@Param("name") String name);
    //chanxun交易记录多少条
    int tbcount(AgentPage agentPage);
    //chanxun每个代理商的总交易额
   List <AgentMoney> amoney();
   //查询每一个代理商激活的总机具数
    List<AgentJiju> acount();
}
