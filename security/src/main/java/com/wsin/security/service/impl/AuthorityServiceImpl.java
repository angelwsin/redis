package com.wsin.security.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wsin.security.bean.Authority;
import com.wsin.security.dao.AuthorityDao;
import com.wsin.security.service.AuthorityService;

@Service("authorityServiceImpl")
public class AuthorityServiceImpl implements AuthorityService {
	
	  private AuthorityDao authorityDaoImpl;
	  

	public AuthorityDao getAuthorityDaoImpl() {
		return authorityDaoImpl;
	}

    @Resource(name="authorityDaoImpl")
	public void setAuthorityDaoImpl(AuthorityDao authorityDaoImpl) {
		this.authorityDaoImpl = authorityDaoImpl;
	}


	public void save(Authority authority) {
		// TODO Auto-generated method stub
		this.authorityDaoImpl.save(authority);
	}

}
