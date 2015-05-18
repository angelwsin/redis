package com.wsin.security.service.impl;

import org.springframework.stereotype.Service;

import com.wsin.security.bean.Resource;
import com.wsin.security.dao.ResourceDao;
import com.wsin.security.service.ResourceService;

@Service("resourceServiceImpl")
public class ResourceServiceImpl implements ResourceService {
	
	  private ResourceDao resourceDaoImpl;
	  

	public ResourceDao getResourceDaoImpl() {
		return resourceDaoImpl;
	}

    @javax.annotation.Resource(name="resourceDaoImpl")
	public void setResourceDaoImpl(ResourceDao resourceDaoImpl) {
		this.resourceDaoImpl = resourceDaoImpl;
	}


	public void save(Resource resource) {
		// TODO Auto-generated method stub
		 this.resourceDaoImpl.save(resource);
	}

}
