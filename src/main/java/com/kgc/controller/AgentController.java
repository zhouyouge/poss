package com.kgc.controller;

import com.alibaba.fastjson.JSON;
import com.kgc.entity.*;
import com.kgc.entity.ResponseResult;
import com.kgc.service.AgentService;
import com.kgc.util.FileUpload;
import com.kgc.util.ObjectExcelRead;
import com.kgc.util.ObjectExcelView;
import com.kgc.util.PathUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
 * @create 2020/3/26 23:56
 */
@Controller
public class AgentController {
    @Resource
    private AgentService agentService;

    /**
     * 分页查询
     *
     */


    @RequestMapping("fenye2")
    @ResponseBody
    public AgentPage fenye(AgentPage agentPage, HttpSession session){

       AgentPage agentPage1=agentService.fenye(agentPage);

        return agentPage1;
    }
    /**
     * 添加
     */


    @ResponseBody
    @RequestMapping("/addag")
    public Object add(Agent agent, HttpSession session){
        String uuid = UUID.randomUUID().toString();
        ResponseResult rs=new ResponseResult();
        if(StringUtils.isEmpty(agent)){
            rs.setResult(false);
        }else {
            agent.setId(uuid);
            rs=agentService.add(agent);
            if(rs.getResult()==true){
                rs.setFlag(1);
            }
        }
        return JSON.toJSONString(rs);
    }
    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping(value = "updateAgent",method = RequestMethod.POST)
    public Object update(Agent agent, HttpSession session){
        ResponseResult rs=new ResponseResult();
        if(StringUtils.isEmpty(agent)){
            rs.setResult(false);
        }else {
            rs=agentService.update(agent);
            if(rs.getResult()==true){
                rs.setFlag(1);
            }
        }
        return JSON.toJSONString(rs);
    }
    //根据id查询代理商表
    @ResponseBody
    @RequestMapping(value = "byId")
    public Object getById(@RequestParam("id") String id){
        if(StringUtils.isEmpty(id)){
            return null;
        }
        System.out.println("单查"+id);
        return agentService.getById(id);

    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping(value = "delAgent",method = RequestMethod.GET)
    public Object del(String id, HttpSession session){
        ResponseResult rs=new ResponseResult();
        if(StringUtils.isEmpty(id)){
            rs.setResult(false);
        }else {
            rs=agentService.del(id);
            if(rs.getResult()==true){
                rs.setFlag(1);
            }
        }
        return JSON.toJSONString(rs);
    }
    //导入
    @RequestMapping(value="/importExcel1",method= RequestMethod.GET)
    public ModelAndView getExcel(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("importExcel1.ftl");
        return mv;
    }
    //导出
    @RequestMapping(value="/exportExcel1")
    public ModelAndView exportExcel( ) throws ParseException {
        //查询数据库数据
        List<Agent> agents = agentService.excle();//数据库表中的数据集合
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        List<ExportData> dataList = new ArrayList<>();//用来封装agents的excel数据集合
        //遍历，传值
        for(Agent agent:agents){
            ExportData vpd = new ExportData();
            vpd.put("var0", String.valueOf(agent.getId()));//A
            vpd.put("var1", String.valueOf(agent.getName()));//B
            vpd.put("var2", String.valueOf(agent.getpId()));//C
            vpd.put("var3",String.valueOf(agent.getParentAgentId()));
            vpd.put("var4",String.valueOf(agent.getLevel()));
            vpd.put("var5",String.valueOf(agent.getUserName()));
            vpd.put("var6",(((agent.getRegisterTime()))));
            vpd.put("var7",String.valueOf(agent.getPhone()));
            vpd.put("var8",String.valueOf(agent.getIDcard()));
            vpd.put("var9",String.valueOf(agent.getBankCard()));
            vpd.put("var10",String.valueOf(agent.getSource()));
            vpd.put("var11",((agent.getImportDate())));

            dataList.add(vpd);

        }
        ObjectExcelView erv = new ObjectExcelView();
        Map<String,Object> dataMap = new HashMap<String,Object>();
        List<String> titles = new ArrayList<String>();
        titles.add("编号");
        titles.add("姓名");
        titles.add("归属平台编号");
        titles.add("归属代理商编号");
        titles.add("级别");
        titles.add("账号");
        titles.add("注册时间");
        titles.add("手机号");
        titles.add("身份证号");
        titles.add("银行卡号");
        titles.add("来源");
        titles.add("导入时间");
        dataMap.put("titles",titles);
        dataMap.put("dataList",dataList);
        ModelAndView vi = new ModelAndView(erv,dataMap);
        return vi;
    }

    /**
     * 从excel给数据库添加   导入
     */
    @RequestMapping(value="/importExcel1",method=RequestMethod.POST)
    public String importExcel(@RequestParam(value="excel",required=false) MultipartFile file)
            throws Exception{
        System.out.println("进入impotExcel");

        List<Agent> infos = new ArrayList<Agent>();
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
                Agent agent=new Agent();
                agent.setId(String.valueOf((String) data.get("var0")));
                agent.setName(String.valueOf((String)data.get("var1")));
                agent.setpId(String.valueOf((String)data.get("var2")));
                agent.setParentAgentId(String.valueOf((String) data.get("var3")));
                agent.setLevel(Integer.parseInt(String.valueOf((String)data.get("var4"))));
                agent.setUserName(String.valueOf((String) data.get("var5")));
                agent.setRegisterTime((String.valueOf((String)data.get("var6"))));
                agent.setPhone((String.valueOf((String)data.get("var7"))));
                agent.setIDcard((String.valueOf((String) data.get("var8"))));
                agent.setBankCard((String.valueOf((String)data.get("var9"))));
                agent.setSource(Integer.parseInt(String.valueOf((String) data.get("var10"))));
                agent.setImportDate((String.valueOf((String)data.get("var11"))));
                //调用添加方法
                ResponseResult flag =  agentService.add(agent);

                if(!flag.getResult()){
                    System.out.println("service层空值");

                }

            }
        }
        return "success";
    }

    //代理商报表查询
    @ResponseBody
    @RequestMapping("Agenttb")
    public Object tb(AgentPage agentPage,HttpSession session){
        UserInfo userInfo= (UserInfo) session.getAttribute("user");
        if(!StringUtils.isEmpty(userInfo)){
           AgentPage agentPage1=agentService.tb(agentPage);
            return JSON.toJSONString(agentPage1);
        }
        return null;
    }

    //chanxun每个代理商的总交易额
    @ResponseBody
    @RequestMapping("Amoney")
   public List <AgentMoney> amoney(){
        return agentService.amoney();
    }
    //查询每一个代理商激活的总机具数
    @ResponseBody
    @RequestMapping("Acount")
   public List<AgentJiju> acount(){
        return agentService.acount();
    }

    //代理商图表
    @ResponseBody
    @RequestMapping("agenttb1")
    public AgentTb tb(){
        AgentTb agentTb=new AgentTb();
        agentTb.setJijuList(agentService.acount());
        agentTb.setMoneyList(agentService.amoney());
        return agentTb;

    }
    //全查代理商表
    @ResponseBody
    @RequestMapping("ag")
    public List<Agent> ag(HttpSession session){
        List<Agent> list=agentService.excle();
        session.setAttribute("ag",list);
        return list;
    }
}
