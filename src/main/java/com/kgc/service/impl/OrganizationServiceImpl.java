package com.kgc.service.impl;

import com.kgc.dao.OrganizationDao;
import com.kgc.entity.Organization;
import com.kgc.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class OrganizationServiceImpl implements OrganizationService {
    @Autowired
 private    OrganizationDao organizationDao;

    /**
     * 机构表全查
     * @return
     */
    @Override
    public List<Organization> queryOrg() {
        return organizationDao.queryOrg();
    }


}
