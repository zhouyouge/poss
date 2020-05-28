package com.kgc.dao;

import com.kgc.entity.Organization;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("organization")
public interface OrganizationDao {
    /**
     * 机构表全查
     */
    List<Organization> queryOrg();
}
