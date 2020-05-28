package com.kgc.controller;

import com.alibaba.fastjson.JSON;
import com.kgc.entity.*;

import com.kgc.entity.Page;
import com.kgc.entity.ResponseResult;
import com.kgc.service.AgentService;

import com.kgc.service.PlatformService;
import com.kgc.service.PosInfoService;
import com.kgc.util.FileUpload;
import com.kgc.util.ObjectExcelRead;
import com.kgc.util.ObjectExcelView;
import com.kgc.util.PathUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * (PosInfoContoller)表 控制器层
 *
 */
@Controller
@RequestMapping("/jiju")
public class PosInfoController {
    @Autowired
    private PosInfoService posInfoService;
    @Autowired
    private PlatformService platformService;
    @Autowired
    private AgentService agentService;
    /*@ResponseBody
    @RequestMapping("/fenye")
    public Object getProInfo(PosInfoParamter paramter){
        PosInfoPage p= posInfoService.query(paramter);
        return p;
    }*/

    @RequestMapping(value = "/fenye",method = RequestMethod.POST)
    @ResponseBody
    public Page<PosInfo> query(PosInfoParamter paramter, HttpSession session){
        Page<PosInfo> p= posInfoService.query(paramter);
        System.out.println(p.getList());
        List<Platform> platformList = platformService.queryPlat();
        session.setAttribute("platfromList",platformList);
        return p;

    }

    @RequestMapping("delId")
    @ResponseBody
    public ResponseResult del(String id){
        Integer id1=Integer.valueOf(id);
        ResponseResult flag=posInfoService.deleteProInfoById(id1);
        return flag;
    }
    /**
     * 导入导出
     */
    @RequestMapping("/daorujiju")
    public ModelAndView getExcel(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("jijuimportExcel.ftl");
        return mv;
    }
    @SuppressWarnings("unchecked")
    @RequestMapping(value="/exportExcel")
    public ModelAndView exportExcel(){
        //查询数据库数据
        List<PosInfo> proList = posInfoService.getProInfo();//数据库表中的数据集合

        List<ExportData> dataList = new ArrayList<ExportData>();//用来封装recordList的excel数据集合
        //遍历，传值
        for(PosInfo pro:proList){
            ExportData vpd = new ExportData();
            vpd.put("var0", String.valueOf(pro.getId()));//A
            vpd.put("var1", String.valueOf(pro.getPosId()));//B
            vpd.put("var2", String.valueOf(pro.getPosSN()));//C
            vpd.put("var3",String.valueOf(pro.getStoreDate()));
            vpd.put("var4",String.valueOf(pro.getTransferAgentId()));
            vpd.put("var5",String.valueOf(pro.getTransferDate()));
            vpd.put("var6",String.valueOf(pro.getActiveStatus()));
            vpd.put("var7",String.valueOf(pro.getActiveDate()));
            vpd.put("var8",String.valueOf(pro.getIsStandard()));
            vpd.put("var9",String.valueOf(pro.getSource()));
            vpd.put("var10",String.valueOf(pro.getImportDate()));
            vpd.put("var11",String.valueOf(pro.getPlatformName()));
            vpd.put("var12",String.valueOf(pro.getAgentName()));
            dataList.add(vpd);

        }
        ObjectExcelView erv = new ObjectExcelView();
        Map<String,Object> dataMap = new HashMap<String,Object>();
        List<String> titles = new ArrayList<String>();
        titles.add("编号");
        titles.add("机具ID");
        titles.add("机具SN");
        titles.add("总公司机具的入库日期");
        titles.add("机具划拨代理商名称");
        titles.add("划拨代理商日期");
        titles.add("激活状态");
        titles.add("激活日期");
        titles.add("达标状态");
        titles.add("来源");
        titles.add("导入平台日期");
        titles.add("平台名称");
        titles.add("代理商名称");
        dataMap.put("titles",titles);
        dataMap.put("dataList",dataList);
        ModelAndView vi = new ModelAndView(erv,dataMap);
        return vi;
    }

    @RequestMapping(value="/importExcel",method=RequestMethod.POST)
    public String importExcel(@RequestParam(value="excel",required=false) MultipartFile file)
            throws Exception{
        System.out.println("进入impotExcel");
        if(null!=file&&!file.isEmpty()){
            String filePath = PathUtil.getClasspath()+"uploadFiles/file/";//文件上传路径
            System.out.println(filePath+"--------------");
            String fileName = FileUpload.fileUp(file, filePath, "userexcel");//执行上传
            //执行读excel操作,读出的数据导入LIST 1：从第2行开始， 0：从第A列开始 1：从第1个sheet开始
            List<ExportData> listPd =
                    (List) ObjectExcelRead.readExcel(filePath,fileName,1,0,0);


            for(int i=0;i<listPd.size();i++){
                ExportData data = new ExportData();
                data=listPd.get(i);
                PosInfo posInfo = new PosInfo();
                posInfo.setId(Integer.valueOf((String) data.get("var0")));
                posInfo.setPosId(String.valueOf((String)data.get("var1")));
                posInfo.setPosSN(String.valueOf((String)data.get("var2")));
                posInfo.setStoreDate(String.valueOf((String)data.get("var3")));
                posInfo.setTransferAgentId(String.valueOf((String)data.get("var4")));
                posInfo.setTransferDate(String.valueOf((String)data.get("var5")));
                posInfo.setActiveStatus(Integer.valueOf((String)data.get("var6")));
                posInfo.setActiveDate(String.valueOf((String)data.get("var7")));
                posInfo.setIsStandard(Integer.valueOf((String)data.get("var8")));
                posInfo.setSource(Integer.valueOf((String)data.get("var9")));
                posInfo.setImportDate(String.valueOf((String)data.get("var10")));
                //调用添加方法
                boolean flag =  posInfoService.addPosInfos(posInfo);

                if(!flag){
                    System.out.println("service层空值");

                }

            }
        }
        return "success";
    }
    @ResponseBody
    @RequestMapping(value = "addPosInfo",method = RequestMethod.POST)
    public Object addPosInfo(PosInfo posInfo){
        ResponseResult rs=posInfoService.addPosInfo(posInfo);
        return rs;

    }
    @ResponseBody
    @RequestMapping(value = "updatePosInfo",method = RequestMethod.POST)
    public Object updatePosInfo(PosInfo posInfo){
        ResponseResult rs=posInfoService.updatePosInfo(posInfo);
        return rs;
    }
    @RequestMapping(value = "updatePosInfo")
    public String updatePosInfo(Integer id,HttpSession session){
        PosInfo posInfo=posInfoService.getProInfoById(id);
        List<Agent> agentList = agentService.excle();
        session.setAttribute("agentList",agentList);
        session.setAttribute("posInfo",posInfo);
        return "jiju/updatePosInfo";
    }


    @ResponseBody
    @RequestMapping(value = "dls")
    public Object dls(){
        List<Agent> agents=agentService.excle();
        return agents;
    }
    @ResponseBody
    @RequestMapping(value = "pt")
    public Object pt(){
        List<Platform> platforms=platformService.queryPlat();
        return platforms;
    }
    @RequestMapping(value = "baobiao")
    public String tiaozhuan(){
        return "jiju/jijubaobiao";
    }
    @RequestMapping(value = "tubiao")
    public String tubiao(){
        return "jiju/jijutubiao";
    }
    @ResponseBody
    @RequestMapping(value = "jijubao")
    public Object baobiao(){
     PTsourcess pt= posInfoService.ptSources();
     return pt;
    }
    @ResponseBody
    @RequestMapping(value = "jijubaobiao")
    public Object jijubaobiao(){
        List<PosInfoBaoBIAO> baobiao=posInfoService.getBaoBiao();
        return baobiao;
    }
    @RequestMapping("jgs")
    public String tiaozhuanjigoushu(){
        return "jgs";
    }
    @ResponseBody
    @RequestMapping(value = "jigoushu")
    public Object jigoushu(){
        Tree<Agent> tree= posInfoService.agentTree();

        return tree;
    }

}
