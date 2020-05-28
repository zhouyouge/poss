package com.kgc.dao;

import com.kgc.entity.Merchant;
import com.kgc.entity.MerchantPage;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author GJT
 * @create 2020/4/8 21:40
 */
@Repository("mderchantDao")
public interface MerchantDao {
    //分页
    List<Merchant> mfenye(MerchantPage merchantPage);
    //商户有多少条数据
    int count(MerchantPage merchantPage);
    //添加
    int add(Merchant merchant);
    //修改
    int update(Merchant merchant);
    //删除
    int del(@Param("id") String id);
    //导出excel
    List<Merchant> excel();
    //根据ID查询
    Merchant byId(@Param("id") String id);
}
