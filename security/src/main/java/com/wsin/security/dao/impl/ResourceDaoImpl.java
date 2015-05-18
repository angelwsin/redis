package com.wsin.security.dao.impl;

import org.springframework.stereotype.Repository;

import com.wsin.security.bean.Resource;
import com.wsin.security.dao.ResourceDao;

@Repository("resourceDaoImpl")
public class ResourceDaoImpl extends BaseDaoImpl<Resource> implements ResourceDao {

}
