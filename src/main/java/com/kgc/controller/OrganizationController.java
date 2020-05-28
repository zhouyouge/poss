package com.kgc.controller;

import com.kgc.entity.Organization;
import com.kgc.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
@Controller
@RequestMapping("org")
public class OrganizationController {
    @Autowired
    private OrganizationService organizationService;
    /**
     *机构表全查
     */
    @ResponseBody
    @RequestMapping("listOrg")
    public List<Organization> queryOrg(){
        return organizationService.queryOrg();


    }
}
