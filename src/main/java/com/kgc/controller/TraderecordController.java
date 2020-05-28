package com.kgc.controller;

import com.kgc.entity.*;
import com.kgc.service.TraderecordService;
import com.kgc.util.FileUpload;
import com.kgc.util.ObjectExcelRead;
import com.kgc.util.ObjectExcelView;
import com.kgc.util.PathUtil;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("traderecord")
public class TraderecordController {
    /**
     * 服务对象
     */
    @Resource
    private TraderecordService traderecordService;
    @RequestMapping("jiaoyiquancha")
    public Page<Traderecord> query(Integer pageon,
                                   Integer gname,
                                   Integer pname,
                                   String sname,
                                   String aname,
                                   String source,
                                   String merchantNo,
                                   String startTime,
                                   String endTime

                                  ){


        return traderecordService.query(pageon,gname,  pname, sname,
                aname,source, merchantNo,startTime,endTime);

    }

    /**
     * 导入导出
     */

    @SuppressWarnings("unchecked")
    @RequestMapping(value="/exportExcel")
    public ModelAndView exportExcel( ){
        //查询数据库数据
        List<Traderecord> recordList = traderecordService.excle();//数据库表中的数据集合
        List<ExportData> dataList = new ArrayList<ExportData>();//用来封装recordList的excel数据集合
        //遍历，传值
        for(Traderecord record:recordList){
            ExportData vpd = new ExportData();
            vpd.put("var0", String.valueOf(record.getId()).toString().trim());//A
            vpd.put("var1", String.valueOf(record.getPid()));//B
            vpd.put("var2", String.valueOf(record.getParentagentid()));//C
            vpd.put("var3",String.valueOf(record.getMid()));
            vpd.put("var4",String.valueOf(record.getTradedate()));
            vpd.put("var5",String.valueOf(record.getBankcard()));
            vpd.put("var6",String.valueOf(record.getTrademoney()));
            vpd.put("var7",String.valueOf(record.getRealamount()));
            vpd.put("var8",String.valueOf(record.getPoundage()));
            vpd.put("var9",String.valueOf(record.getRate()));
            vpd.put("var10",String.valueOf(record.getPosid()));
            vpd.put("var11",String.valueOf(record.getSource()));
            vpd.put("var12",String.valueOf(record.getImportdate()));
            dataList.add(vpd);

        }
        ObjectExcelView erv = new ObjectExcelView();
        Map<String,Object> dataMap = new HashMap<String,Object>();
        List<String> titles = new ArrayList<String>();
        titles.add("编号");
        titles.add("平台编号");
        titles.add("归属代理商编号");
        titles.add("商户编号");
        titles.add("交易日期");
        titles.add("交易卡号");
        titles.add("交易金额");
        titles.add("结算金额");
        titles.add("手续费");
        titles.add("费率");
        titles.add("机具id");
        titles.add("来源");
        titles.add("导入时间");
        dataMap.put("titles",titles);
        dataMap.put("dataList",dataList);
        ModelAndView vi = new ModelAndView(erv,dataMap);
        return vi;
    }

/**
 * 从excel 里给  数据库添加   导入
 */
    @RequestMapping(value="/importExcel",method=RequestMethod.POST)
    public String importExcel(@RequestParam(value="excel",required=false) MultipartFile file)
            throws Exception{
        System.out.println("进入impotExcel");

        List<Traderecord> infos = new ArrayList<Traderecord>();
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
                Traderecord traderecord = new Traderecord();
                traderecord.setId(String.valueOf((String) data.get("var0")));
                traderecord.setPid((Integer.parseInt(String.valueOf(data.get("var1") ))) );
                traderecord.setParentagentid(Integer.parseInt(String.valueOf(data.get("var2"))));
                traderecord.setMid(String.valueOf((String) data.get("var3")));
                traderecord.setTradedate(String.valueOf((String) data.get("var4")));
                traderecord.setBankcard(String.valueOf((String) data.get("var5")).toString().trim());
                traderecord.setTrademoney(Double.parseDouble(String.valueOf(data.get("var6"))));
                traderecord.setRealamount(Double.parseDouble((String.valueOf(data.get("var7"))) ));
                traderecord.setPoundage(Double.valueOf(Double.parseDouble(String.valueOf( data.get("var8")))));
                traderecord.setRate(Double.parseDouble((String.valueOf(data.get("var9"))) ));
                traderecord.setPosid(String.valueOf((String) data.get("var10")).trim().toString());
                traderecord.setSource(Integer.parseInt((String.valueOf( data.get("var11")))));
                traderecord.setImportdate(String.valueOf((String) data.get("var12")).toString().trim());
                //调用添加方法
                ResponseResult flag =  traderecordService.insert(traderecord);


            }
        }
        return "success";
    }

    /**
     * 添加交易管理  手动录入
     * @param traderecord
     * @return
     */
    @RequestMapping("addCode")
    @ResponseBody
    public Object addCode(Traderecord traderecord, HttpSession session){
        UserInfo userInfo = (UserInfo) session.getAttribute("user");
        ResponseResult rs = null;
        if(!StringUtils.isEmpty(userInfo)){
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            traderecord.setImportdate(df.format(new Date()));
            traderecord.setSource(0);
            String id= UUID.randomUUID().toString();
            traderecord.setId(id);
            rs= traderecordService.insert(traderecord);
        }else{
            rs=new ResponseResult();
            rs.setFlag(12);
            rs.setData("请重新登录");
        }
        return rs;
    }

    /**
     * 根据id删除
     * @param id
     * @return
     */
    @RequestMapping("delId")
@ResponseBody
    public  Object del(String id,HttpSession session){
        UserInfo userInfo= (UserInfo) session.getAttribute("user");
        ResponseResult rs= new ResponseResult();
        if(!StringUtils.isEmpty(userInfo)){
            rs= traderecordService.deletCord(id);
        }else {
            rs.setFlag(12);
            rs.setData("请重新登录");
        }

        return rs;
    }

    /**
     * 修改  编辑
     * @param traderecord
     * @return
     */
    @RequestMapping("updRecord")
    @ResponseBody
public Object updrecord(Traderecord traderecord, HttpSession session){
         UserInfo userInfo = (UserInfo) session.getAttribute("user");
        ResponseResult rs = null;
        if(!StringUtils.isEmpty(userInfo)){
            rs= traderecordService.updeateCord(traderecord);
        }else{
            rs.setFlag(12);
            rs.setData("请重新登录");
        }
        return rs;

}
/**
     * 根据id获取全部信息
     * @param id
     * @return
     */
@ResponseBody
@RequestMapping("byId")
public Object getById(String id){
        System.out.println("单查前台传的"+id);
      return traderecordService.getById(id);
}

    /**
     * 交易图形统计
     * @return
     */
    @ResponseBody
    @RequestMapping("tubaio")
   public List<Traderecord> tubiao(TraderecordParam param){
        System.out.println( param.getAname());
        System.out.println( param.getEndTime());

    return traderecordService.tubiao(param);
   }

    /**
     * 代理商全查
     * @return
     */
    @ResponseBody
    @RequestMapping("agentList")
    List<Agent> agentList(){
      return  traderecordService.agentList();
    }

    /**
     * 商户表全查
     * @return
     */
    @ResponseBody
    @RequestMapping("merchantsList")
    List<Merchant> merchantsList(){
        return traderecordService.merchantsList();
    }

    /**
     * 交易echarts报表
     */
    @ResponseBody
    @RequestMapping(value = "echarsBaobiao",method = RequestMethod.GET)
    public Page<Traderecord> getTubiao(Integer pageon,
                                       Integer gname,
                                       Integer pname,
                                       String aname,
                                       String startTime,
                                       String endTime,
                                       String orderBy){



        return traderecordService.echarsBaobiao(pageon,gname,pname,aname,startTime,endTime,orderBy);


}

}