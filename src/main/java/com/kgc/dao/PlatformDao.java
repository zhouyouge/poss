package com.kgc.dao;

import com.kgc.entity.Platform;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("platformDao")
public interface PlatformDao {
    /**
     * 平台表全查
     * @return
     */
    List<Platform> queryPlat();
}
