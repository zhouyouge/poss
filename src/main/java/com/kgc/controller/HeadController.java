package com.kgc.controller;

import com.kgc.service.HeadService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.security.PublicKey;

/**
 * @author GJT
 * @create 2020/4/17 0:58
 */
@Controller
public class HeadController {

    @Resource
    private HeadService headService;
    //本月交易额
    @ResponseBody
    @RequestMapping("monthmoney")
    public Object monthmoney(){
        return headService.jiaoyier();
    }
    //本月机具库存
    @ResponseBody
    @RequestMapping("kuncunjiju")
    public Object kuncunjiju(){
        return headService.jiju();
    }
    //本月激活机具
    @ResponseBody
    @RequestMapping("jihuojiju")
    public Object jihuo(){
        return headService.jihuo();
    }
    //本月新增代理商
    @ResponseBody
    @RequestMapping("xinzengagent")
    public Object xinzeng(){
        return headService.agent();
    }
}
