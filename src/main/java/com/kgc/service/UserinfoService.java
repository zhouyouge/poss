package com.kgc.service;


import com.kgc.entity.*;
import com.kgc.entity.Role;

import java.util.List;

/**
 * (Userinfo)表服务接口
 *
 * @author makejava
 * @since 2020-03-25 11:57:55
 */
public interface UserinfoService {
//登录验证
    ResponseResult loginUser(UserInfo userinfo);
    //分页
    UserPage fenye(UserPage userPage);
    //修改
    ResponseResult update(UserInfo userinfo);
    /**
     * 导出Excel需要的接口
     * @return
     */
    List<UserInfo> excle();
    //添加
    ResponseResult add(UserInfo userinfo);
    List<UserInfo> excel();
    //全查机构表
    List<Organization> organ();
    //全查角色表
    List<Role> role();
}