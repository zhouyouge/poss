package com.kgc.controller;

import com.kgc.entity.Platform;
import com.kgc.service.PlatformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("platform")
public class PlatformController {
    @Autowired
    private PlatformService platformService;

    @RequestMapping("listPlatform")
    @ResponseBody
    public List<Platform> queryPlat(HttpSession session){
        List<Platform> list=platformService.queryPlat();
        session.setAttribute("plat",list);
    return  list;
    }
}
