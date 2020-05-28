package com.kgc.controller;

import com.kgc.entity.LogParam;
import com.kgc.entity.Page;
import com.kgc.entity.SysLog;
import com.kgc.service.LogService;
import com.sun.org.apache.xpath.internal.SourceTree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class SysLogController {
    @Autowired
    private LogService service;



    /**
     * 获取日志列表数据
     * @return
     */
    @RequestMapping(value="queryAllSysLogData",method=RequestMethod.POST)
    @ResponseBody
    public Page<SysLog> queryAllSysLogData(Integer pageon, String moduleName,
                                           String operate,
                                           String username,
                                           String startTime,
                                           String endTime){
        return service.queryAllSysLog(pageon, moduleName,
                operate,
                username,
                startTime,
                 endTime);
    }

    /**
     * 删除日志
     * @param data
     * @return
     */
    /**
     * 删除日志
     * @param
     * @return
     */
    @RequestMapping(value="deleteSysLogData",method=RequestMethod.POST)
    @ResponseBody
    public int deleteSysLogData(String logId){
        return service.delLog(logId);
    }


}
