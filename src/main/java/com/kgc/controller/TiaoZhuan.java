package com.kgc.controller;

import com.kgc.entity.Agent;
import com.kgc.service.*;
import org.junit.jupiter.api.AfterEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TiaoZhuan {

    @Autowired
    private AgentService agentService;
    private OrganizationService organizationService;
    private PlatformService platformService;
    private PosInfoService posInfoService;
    private TraderecordService traderecordService;
    private UserinfoService userinfoService;
    //首页
    @RequestMapping("head")
    public String head(){return "first";}

    //跳转login页面
    @RequestMapping("login")
    public String login(){
        return "login";
    }
    //跳转交易管理
    @RequestMapping("jiaoyi")
    public String jiaoyi(){
        return "jiaoyi/jiaoyi";
    }
    @RequestMapping("jiju")
    public String jiju(){
        return "jiju/jiju";
    }
    //代理商分页
    @RequestMapping("agent")
    public String fen(){
        return "agent/agent1";
    }
    //代理商修改
    @RequestMapping("upAgent")
    public String upAgent(){
        return "agent/updateAgent";
    }
    //代理商添加
    @RequestMapping(value="addAgent",method= RequestMethod.GET)
    public String addAgent(){
        return "agent/addAgent1";
    }
    //代理商报表
    @RequestMapping("agentbaobiao")
    public String Agentbaobiao(){
        return "agent/baobiao";
    }
    //代理商图表
    @RequestMapping("agenttubiao")
    public String Agenttubiao(){
        return "agent/tubiao";
    }
    //用户分页
    @RequestMapping("user")
    public String ufenye(){return "user/userinfo";}
    //用户添加
    @RequestMapping("uadd1")
    public String uadd(){return "user/addUser";}
    //用户修改
    @RequestMapping("uup1")
    public String uup(){return "user/updateUser";}
    //用户重置密码
    @RequestMapping("mima")
    public String mm(){return "user/mima1";}
    //商户主页
    @RequestMapping("mfenye1")
    public String mfenye(){return "merchant/merchant";}
    //商户添加
    @RequestMapping("madd1")
    public String madd(){return "merchant/addmerchant";}
    //商户修改
    @RequestMapping("mupdate1")
    public String mupdate(){return "merchant/updatemerchant";}
    //商户删除

//导入
    @RequestMapping("daoru")
    public ModelAndView getExcel(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("importExcel.ftl");
        return mv;
    }
    //手动录入交易信息
     @RequestMapping("addCode")
    public String addCode(){
        return "jiaoyi/addcode";
    }
     //编辑交易信息
    @RequestMapping("updcode")
    public String updcode(){
        return "jiaoyi/updcode";
    }

    //交易报表
    @RequestMapping("ttt")
    public String ttt(){
        return "jiaoyi/jiaoyi";
    }
    //交易管理跳转页面结束   交易图表跳转页面开始

    //交易报表
    @RequestMapping("baobiao")
    public String baobiao(){
         return "jiaoYiTuBiao/jiaoyibaobiao";
    }

    //交易报表
    @RequestMapping("tubiao")
    public String tubiao(){
        return "jiaoYiTuBiao/tubiaoList";
    }

    @RequestMapping("addPosInfo")
    public String addPosInfo(HttpSession session){
        List<Agent> agentList = agentService.excle();
        session.setAttribute("agentList",agentList);
        return "jiju/addPosInfo";
    }

    @RequestMapping("main")
    public String main(){
        return "first";
    }

    @RequestMapping("rizhi")
    public String rizhiList(HttpSession session){
        return "rizhi/rizhiList";
    }

}
