package com.kgc.controller;

import com.alibaba.fastjson.JSON;
import com.kgc.entity.*;
import com.kgc.service.MerchantService;
import com.kgc.util.FileUpload;
import com.kgc.util.ObjectExcelRead;
import com.kgc.util.ObjectExcelView;
import com.kgc.util.PathUtil;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author GJT
 * @create 2020/4/8 22:57
 */
@Controller
public class MerchantControl {
    @Resource
    private MerchantService merchantService;

    //分页
    @ResponseBody
    @RequestMapping("mfenye")
    public Object fy(MerchantPage merchantPage, HttpSession session){
        UserInfo userInfo= (UserInfo) session.getAttribute("user");
        if(StringUtils.isEmpty(userInfo)){
            return null;
        }
        MerchantPage merchantPage1=merchantService.fy(merchantPage);
        return JSON.toJSONString(merchantPage1);
    }
    //添加
    @ResponseBody
    @RequestMapping(value = "madd",method = RequestMethod.POST)
    public Object add(Merchant merchant,HttpSession session){
        UserInfo userInfo= (UserInfo) session.getAttribute("user");
        if(StringUtils.isEmpty(userInfo)){
            return null;
        }
        String uuid = UUID.randomUUID().toString();
        ResponseResult rs=new ResponseResult();
        if(StringUtils.isEmpty(merchant)){
            rs.setFlag(0);
            rs.setResult(false);
        }else {
            merchant.setId(uuid);
            rs=merchantService.add(merchant);
            if(rs.getResult()==true){
                rs.setFlag(1);
                rs.setResult(true);
            }
        }
        return JSON.toJSONString(rs);
    }
    //修改
    @ResponseBody
    @RequestMapping(value = "mupdate",method = RequestMethod.POST)
    public Object update(Merchant merchant,HttpSession session){
        UserInfo userInfo= (UserInfo) session.getAttribute("user");
        if(StringUtils.isEmpty(userInfo)){
            return null;
        }
        ResponseResult rs=new ResponseResult();
        if(StringUtils.isEmpty(merchant)){
            rs.setFlag(0);
            rs.setResult(false);
        }else {
            rs=merchantService.update(merchant);
            if(rs.getResult()==true){
                rs.setFlag(1);
                rs.setResult(true);
            }
        }
        return JSON.toJSONString(rs);
    }

    //删除
    @ResponseBody
    @RequestMapping("mdel")
    public Object del(String id,HttpSession session){
        UserInfo userInfo= (UserInfo) session.getAttribute("user");
        if(StringUtils.isEmpty(userInfo)){
            return null;
        }
        ResponseResult rs=new ResponseResult();
        if(StringUtils.isEmpty(id)){
            rs.setFlag(0);
            rs.setResult(false);
        }else {
            rs=merchantService.del(id);
            if(rs.getResult()==true){
                rs.setFlag(1);
                rs.setResult(true);
            }
        }
        return JSON.toJSONString(rs);
    }

    //导入
    @RequestMapping(value="/importExcel3",method= RequestMethod.GET)
    public ModelAndView getExcel(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("importExcel3.ftl");
        return mv;
    }
    //导出
    @RequestMapping(value="/exportExcel3")
    public ModelAndView exportExcel( ) throws ParseException {
        //查询数据库数据
        List<Merchant> merchants = merchantService.excel();//数据库表中的数据集合
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        List<ExportData> dataList = new ArrayList<>();//用来封装agents的excel数据集合
        //遍历，传值
        for(Merchant merchant:merchants){
            ExportData vpd = new ExportData();
            vpd.put("var0", String.valueOf(merchant.getId()));//A
            vpd.put("var1", String.valueOf(merchant.getMerchantNo()));//B
            vpd.put("var2", String.valueOf(merchant.getName()));//C
            vpd.put("var3",String.valueOf(merchant.getNickName()));
            vpd.put("var4",String.valueOf(merchant.getPhone()));
            vpd.put("var5",String.valueOf(merchant.getIDcard()));
            vpd.put("var6",String.valueOf(merchant.getParentAgentId()));
            vpd.put("var7",String.valueOf(merchant.getBankCard()));
            vpd.put("var8",String.valueOf(merchant.getSource()));
            vpd.put("var9",String.valueOf(merchant.getRegisterTime()));
            vpd.put("var10",String.valueOf(merchant.getImportDate()));
            dataList.add(vpd);

        }
        ObjectExcelView erv = new ObjectExcelView();
        Map<String,Object> dataMap = new HashMap<String,Object>();
        List<String> titles = new ArrayList<String>();
        titles.add("编号");
        titles.add("商户编号");
        titles.add("商户名称");
        titles.add("商户简称");
        titles.add("商户手机号");
        titles.add("商户身份证号");
        titles.add("归属代理商");
        titles.add("商户到账卡号");
        titles.add("数据来源");
        titles.add("登记日期");
        titles.add("导入时间");
        dataMap.put("titles",titles);
        dataMap.put("dataList",dataList);
        ModelAndView vi = new ModelAndView(erv,dataMap);
        return vi;
    }

    /**
     * 从excel给数据库添加   导入
     */
    @RequestMapping(value="/importExcel3",method=RequestMethod.POST)
    public String importExcel(@RequestParam(value="excel",required=false) MultipartFile file)
            throws Exception{
        System.out.println("进入impotExcel");

       // List<Agent> infos = new ArrayList<Agent>();
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
                Merchant merchant=new Merchant();
                merchant.setId(String.valueOf((String) data.get("var0")));
                merchant.setMerchantNo(String.valueOf((String)data.get("var1")));
                merchant.setName(String.valueOf((String)data.get("var2")));
                merchant.setNickName(String.valueOf((String) data.get("var3")));
                merchant.setPhone((String.valueOf((String)data.get("var4"))));
                merchant.setIDcard(String.valueOf((String) data.get("var5")));
                merchant.setParentAgentId((String.valueOf((String)data.get("var6"))));
                merchant.setBankCard((String.valueOf((String)data.get("var7"))));
                merchant.setSource(Integer.parseInt(String.valueOf((String) data.get("var8"))));
                merchant.setRegisterTime((String.valueOf((String)data.get("var9"))));
                merchant.setImportDate((String.valueOf((String)data.get("var10"))));
                //调用添加方法
                ResponseResult flag =  merchantService.add(merchant);

                if(!flag.getResult()){
                    System.out.println("service层空值");

                }

            }
        }
        return "success";
    }
    //根据id查询商户
    @ResponseBody
    @RequestMapping("byid")
    public Merchant byid(String id,HttpSession session){
        UserInfo userInfo= (UserInfo) session.getAttribute("user");
        if(StringUtils.isEmpty(userInfo)){
            return null;
        }
        if(StringUtils.isEmpty(id)){
            return null;
        }
        return merchantService.byId(id);
    }
}
