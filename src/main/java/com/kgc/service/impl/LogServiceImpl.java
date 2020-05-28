package com.kgc.service.impl;

import com.kgc.dao.LogDao;
import com.kgc.entity.LogParam;
import com.kgc.entity.Page;
import com.kgc.entity.SysLog;
import com.kgc.entity.Traderecord;
import com.kgc.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class LogServiceImpl implements LogService {
    @Autowired
  private   LogDao dao;
    @Override
    public void save(SysLog sysLog) {
        dao.add(sysLog);

    }

    @Override
    public Page<SysLog> queryAllSysLog(Integer pageon,
                                       String moduleName,
                                       String operate,
                                       String username,
                                       String startTime,
                                       String endTime) {

        Page<SysLog> p = new Page<SysLog>();
        p.setPageon(pageon);//设置当前页
        int i = dao.count(moduleName,
                 operate,
                username,
                startTime,
               endTime);

        p.setCount(i);//设置总记录数
        if (i % 10 == 0) { //写死了每页显示5条     可以用三目运算 就 0；0?1这个
            p.setPages(i / 10);
        } else {
            p.setPages((i / 10) + 1);
        }
        int start = (pageon - 1) * 10; //设置起始页下标 和每页显示的条数
      p.setList(dao.queryAllSysLog(start,moduleName,
              operate,
              username,
              startTime,
              endTime));//每个条数里面的内容
        return p;
    }

    @Override
    public int delLog(String logId) {
        return dao. delLog(logId);
    }
}
