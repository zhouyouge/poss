package com.kgc.dao;

import org.springframework.stereotype.Repository;

/**
 * @author GJT
 * @create 2020/4/17 0:59
 */
@Repository("headDao")
public interface HeadDao {
    //本月交易额
    Double jiaoyier();
    //本月机具库存数量
    Integer jiju();
    //本月机具激活数量
    Integer jihuo();
    //本月新增代理商数量
    Integer agent();
}
