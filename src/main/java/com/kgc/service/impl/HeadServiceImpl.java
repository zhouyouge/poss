package com.kgc.service.impl;

import com.kgc.dao.HeadDao;
import com.kgc.service.HeadService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author GJT
 * @create 2020/4/17 0:59
 */
@Service("headService")
public class HeadServiceImpl implements HeadService {
    @Resource
    private HeadDao headDao;
    @Override
    public Double jiaoyier() {
        return headDao.jiaoyier();
    }

    @Override
    public Integer jiju() {
        return headDao.jiju();
    }

    @Override
    public Integer jihuo() {
        return headDao.jihuo();
    }

    @Override
    public Integer agent() {
        return headDao.agent();
    }
}
