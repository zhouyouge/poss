package com.kgc.service;

import com.kgc.entity.LogParam;
import com.kgc.entity.Page;
import com.kgc.entity.SysLog;

import java.util.List;

public interface LogService {
    void save(SysLog sysLog);

    Page<SysLog> queryAllSysLog(Integer pageon, String moduleName,
                                String operate,
                                String username,
                                String startTime,
                                String endTime);

    int delLog(String logId);
}
