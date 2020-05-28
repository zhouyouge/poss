package com.kgc.service.impl;

import com.kgc.dao.PlatformDao;
import com.kgc.entity.Platform;
import com.kgc.service.PlatformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlatformServiceImpl implements PlatformService {
    @Autowired
 private    PlatformDao platformDao;

    /**
     * 平台表全查
     * @return
     */
    @Override
    public List<Platform> queryPlat() {
        return platformDao.queryPlat();
    }
}
