package com.kgc.dao;


import com.kgc.entity.Organization;
import com.kgc.entity.UserInfo;
import com.kgc.entity.UserPage;
import com.kgc.entity.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * (Userinfo)表数据库访问层
 *
 * @author makejava
 * @since 2020-03-25 11:57:54
 */
@Repository("userinfoDao")
public interface UserinfoDao {
//登录验证
    UserInfo getUserinfo(UserInfo userinfo);
//分页查询
    List<UserInfo> ufenye(UserPage userPage);
    //修改
    int update(UserInfo userinfo);
//查询用户数据
int count(UserPage userPage);
//添加
    int add(UserInfo userinfo);
    /**
     * 导出Excel需要的接口
     * @return
     */
    List<UserInfo> excel();
    //全查机构表
    List<Organization> organ();
    //全查角色表
    List<Role> role();
}