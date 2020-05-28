package com.kgc.controller;

import com.alibaba.fastjson.JSON;
import com.kgc.entity.*;
import com.kgc.service.UserinfoService;
import com.kgc.util.FileUpload;
import com.kgc.util.ObjectExcelRead;
import com.kgc.util.ObjectExcelView;
import com.kgc.util.PathUtil;
import com.kgc.entity.Role;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * (Userinfo)表控制层
 *
 * @author makejava
 * @since 2020-03-25 11:57:57
 */
@RestController
public class UserinfoController {
    /**
     * 服务对象
     */
    @Resource
    private UserinfoService userinfoService;

    @ResponseBody
    @RequestMapping(value = "login",method = RequestMethod.POST)
    public Object loginUser(UserInfo userinfo, HttpSession session){
        ResponseResult rs=userinfoService.loginUser (userinfo);
        if(rs.getResult ()==true){
            UserInfo user=(UserInfo)rs.getData ();
            if(!StringUtils.isEmpty (user)){
                session.setAttribute ("user",user);
            }
        }
        return JSON.toJSONString (rs);
    }


    /**
     * 退出登录
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/loginout",method = RequestMethod.GET)
    public Object loginOut(HttpSession session){
        UserInfo userInfo= (UserInfo) session.getAttribute("user");
        if (!StringUtils.isEmpty(userInfo)){
            session.removeAttribute("user");
        }
        ResponseResult rs=new ResponseResult();
        rs.setFlag(1);
        rs.setResult(true);
        return JSON.toJSONString(rs);
    }

//分页查询
    @ResponseBody
    @RequestMapping("ufenye")
    public Object fenye(UserPage userPage,HttpSession session){
        UserInfo userInfo1= (UserInfo) session.getAttribute("user");
        if(StringUtils.isEmpty(userInfo1)){
            return null;
        }
        UserPage userPage1=userinfoService.fenye(userPage);
        return JSON.toJSONString(userPage1);
    }
    //修改
    @ResponseBody
    @RequestMapping("uupdate")
    public Object update(UserInfo userInfo){
        ResponseResult rs=new ResponseResult();
        if(StringUtils.isEmpty(userInfo)){
            rs.setFlag(0);
            rs.setResult(false);
        }else {
            rs=userinfoService.update(userInfo);
            if(rs.getResult()==true){
                rs.setFlag(1);
            }
        }
        return JSON.toJSONString(rs);
    }
    //添加
    @ResponseBody
    @RequestMapping("uadd")
    public Object add(UserInfo userInfo){
        ResponseResult rs=new ResponseResult();
        String uuid = UUID.randomUUID().toString();
        if(StringUtils.isEmpty(userInfo)){
            rs.setFlag(0);
            rs.setResult(false);
        }else {
            userInfo.setId(uuid);
            rs=userinfoService.add(userInfo);
            if(rs.getResult()==true){
                rs.setFlag(1);
            }
        }
        return JSON.toJSONString(rs);
    }
    //导入
    @RequestMapping(value="/importExcel2",method= RequestMethod.GET)
    public ModelAndView getExcel(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("importExcel2.ftl");
        return mv;
    }
    //导出
    @RequestMapping(value="/exportExcel11")
    public ModelAndView exportExcel( ) throws ParseException {
        //查询数据库数据
        List<UserInfo> userInfos = userinfoService.excle();//数据库表中的数据集合
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        List<ExportData> dataList = new ArrayList<>();//用来封装agents的excel数据集合
        //遍历，传值
        for(UserInfo userInfo:userInfos){
            ExportData vpd = new ExportData();
            vpd.put("var0", String.valueOf(userInfo.getId()));//A
            vpd.put("var1", String.valueOf(userInfo.getUsername()));//B
            vpd.put("var2", String.valueOf(userInfo.getOname()));//C
            vpd.put("var3",String.valueOf(userInfo.getLevel()));
            vpd.put("var4",String.valueOf(userInfo.getRname()));
            vpd.put("var5",String.valueOf(userInfo.getRegisterTime()));
            vpd.put("var6",String.valueOf(userInfo.getPhone()));
            dataList.add(vpd);
        }
        ObjectExcelView erv = new ObjectExcelView();
        Map<String,Object> dataMap = new HashMap<String,Object>();
        List<String> titles = new ArrayList<String>();
        titles.add("编号");
        titles.add("姓名");
        titles.add("归属机构");
        titles.add("机构级别");
        titles.add("角色名称");
        titles.add("创建 时间");
        titles.add("联系电话");
        dataMap.put("titles",titles);
        dataMap.put("dataList",dataList);
        ModelAndView vi = new ModelAndView(erv,dataMap);
        return vi;
    }

    /**
     * 从excel给数据库添加   导入
     */
    @RequestMapping(value="/importExcel2",method=RequestMethod.POST)
    public String importExcel(@RequestParam(value="excel",required=false) MultipartFile file)
            throws Exception{
        System.out.println("进入impotExcel");

        List<UserInfo> infos = new ArrayList<UserInfo>();
        if(null!=file&&!file.isEmpty()){
            String filePath = PathUtil.getClasspath()+"uploadFiles/file/";//文件上传路径
            System.out.println(filePath+"--------------");
            String fileName = FileUpload.fileUp(file, filePath, "userexcel");//执行上传
            //执行读excel操作,读出的数据导入LIST 1：从第2行开始， 0：从第A列开始 1：从第1个sheet开始
            List<ExportData> listPd =
                    (List) ObjectExcelRead.readExcel(filePath,fileName,1,0,0);

            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            for(int i=0;i<listPd.size();i++){
                ExportData data = new ExportData();
                data=listPd.get(i);
               UserInfo userInfo=new UserInfo();
                userInfo.setId(String.valueOf((String) data.get("var0")));
                userInfo.setUsername(String.valueOf((String) data.get("var1")));
                userInfo.setOrgId(Integer.parseInt(String.valueOf((String) data.get("var2"))));
                userInfo.setLevel(Integer.parseInt(String.valueOf((String)data.get("var3"))));
                userInfo.setRoleId(Integer.parseInt(String.valueOf((String) data.get("var4"))));
                userInfo.setPassword(String.valueOf((String) data.get("var5")));
                userInfo.setPhone(String.valueOf((String) data.get("var6")));
                userInfo.setRegisterTime(String.valueOf((String) data.get("var7")));
                userInfo.setUpdateTime(String.valueOf((String) data.get("var8")));
                //调用添加方法
                ResponseResult flag =  userinfoService.add(userInfo);

                if(!flag.getResult()){
                    System.out.println("service层空值");

                }

            }
        }
        return "success";
    }

    //机构表全查
    @ResponseBody
    @RequestMapping("organ")
    public List<Organization> organ(HttpSession session){
        List<Organization> organizationList=userinfoService.organ();
        session.setAttribute("organ",organizationList);
        return organizationList;
    }
    //角色表全查
    @ResponseBody
    @RequestMapping("role")
    public List<Role> roles(HttpSession session){
        List<Role> roleList=userinfoService.role();
        session.setAttribute("role",roleList);
        return roleList;
    }
}