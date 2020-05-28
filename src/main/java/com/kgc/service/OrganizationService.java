package com.kgc.service;

import com.kgc.entity.Organization;

import java.util.List;

public interface OrganizationService {
    /**
     * 机构表全查
     * @return
     */
    List<Organization> queryOrg();
}
