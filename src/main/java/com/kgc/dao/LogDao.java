package com.kgc.dao;

import com.kgc.entity.LogParam;
import com.kgc.entity.SysLog;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("log")
public interface LogDao {
    int add(SysLog log);

    /**
     * 全查日志列表
     * @return
     */
    List<SysLog> queryAllSysLog(@Param("start") Integer start,
                                @Param("moduleName")String moduleName,
                                @Param("operate")String operate,
                                @Param("username")String username,
                                @Param("startTime")String startTime,
                                @Param("endTime") String endTime);
    int count( @Param("moduleName")String moduleName,
               @Param("operate")String operate,
               @Param("username")String username,
               @Param("startTime")String startTime,
               @Param("endTime") String endTime);

    int delLog(@Param("id") String logId);
}
