package com.kgc.service.impl;

import com.kgc.LogUtil.LogAnnotation;
import com.kgc.dao.UserinfoDao;
import com.kgc.entity.Organization;
import com.kgc.entity.UserInfo;
import com.kgc.entity.ResponseResult;
import com.kgc.entity.UserPage;
import com.kgc.service.UserinfoService;
import com.kgc.entity.Role;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.List;


/**
 * (Userinfo)表服务实现类
 *
 * @author makejava
 * @since 2020-03-25 11:57:55
 */
@Service("userinfoService")
public class UserinfoServiceImpl implements UserinfoService {
    @Resource
    private UserinfoDao userinfoDao;

    @LogAnnotation(moduleName="登录",operate = "用户登录")
    @Override
    public ResponseResult loginUser(UserInfo userinfo) {
       ResponseResult rs=new ResponseResult();
       if(StringUtils.isEmpty (userinfo)){
           rs.setFlag (0);
           rs.setData ("传参为空");
       }
       if(StringUtils.isEmpty (userinfo.getPassword ())){
           rs.setFlag (1);
           rs.setData ("传参密码为空");
       }
       if(StringUtils.isEmpty (userinfo.getPassword ())){
           rs.setFlag (2);
           rs.setData ("传参密码为空");
       }else {
          /* userinfo.setPassword (SecurityUtils.md5Hex (userinfo.getPassword ()));*/
       }
       UserInfo user=userinfoDao.getUserinfo (userinfo);
       if(StringUtils.isEmpty (user)){
           rs.setFlag (2);
           rs.setData ("用户名或密码不对");
       }else {
           rs.setResult (true);
           rs.setFlag (3);
           rs.setData (user);
       }
        return rs;
    }

    @Override
    public UserPage fenye(UserPage userPage) {
        userPage.setPageIndex((userPage.getCurPage()-1)*userPage.getPageSize());
        int count=userinfoDao.count(userPage);
        List<UserInfo> userInfoList=userinfoDao.ufenye(userPage);
        UserPage userPage1=new UserPage();
        userPage1.setPageIndex((userPage.getCurPage()-1)*userPage.getPageSize());
        userPage1.setCurPage(userPage.getCurPage());
        userPage1.setPageSize(userPage.getPageSize());
        userPage1.setUserInfoList(userInfoList);
        userPage1.setTotalCount(count);
        userPage1.setTotalPageCount(count/userPage.getPageSize()+(count%userPage.getPageSize()==0?0:1));
        return userPage1;
    }
    @LogAnnotation(moduleName="用户模块",operate = "修改用户信息")
    @Override
    public ResponseResult update(UserInfo userinfo) {
        ResponseResult rs=new ResponseResult();
        if(StringUtils.isEmpty(userinfo)){
            rs.setFlag(0);
            rs.setResult(false);
        }else{
            if(userinfoDao.update(userinfo)>0){
                rs.setResult(true);
                rs.setFlag(1);
            }
        }
        return rs;
    }
    @LogAnnotation(moduleName="登录",operate = "导出Excel")
    @Override
    public List<UserInfo> excle() {
        return userinfoDao.excel();
    }

    @Override
    public ResponseResult add(UserInfo userinfo) {
        ResponseResult rs=new ResponseResult();
        if(StringUtils.isEmpty(userinfo)){
            rs.setFlag(0);
            rs.setResult(false);
        }else{
            if(userinfoDao.add(userinfo)>0){
                rs.setResult(true);
                rs.setFlag(1);
            }
        }
        return rs;
    }

    @Override
    public List<UserInfo> excel() {
        return userinfoDao.excel();
    }

    @Override
    public List<Organization> organ() {
        return userinfoDao.organ();
    }

    @Override
    public List<Role> role() {
        return userinfoDao.role();
    }
}