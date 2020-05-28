package com.kgc.service;

import com.kgc.entity.Merchant;
import com.kgc.entity.MerchantPage;
import com.kgc.entity.ResponseResult;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author GJT
 * @create 2020/4/8 22:36
 */
public interface MerchantService {
    //分页
    MerchantPage fy(MerchantPage merchantPage);
    //添加
    ResponseResult add(Merchant merchant);
    //修改
    ResponseResult update(Merchant merchant);
    //删除
    ResponseResult del(String id);
    //导出excel
    List<Merchant> excel();
    //根据ID查询
    Merchant byId(String id);
}
