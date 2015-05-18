package com.wsin.security.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;

import com.wsin.security.bean.Authority;
import com.wsin.security.bean.Role;
import com.wsin.security.bean.User;
import com.wsin.security.dao.AuthorityDao;
import com.wsin.security.dao.ResourceDao;
import com.wsin.security.service.SecurityService;
import com.wsin.security.service.UserService;

@Service("securityServiceImpl")
public class SecurityServiceImpl implements SecurityService {

	   UserService userServiceImpl;
	   private AuthorityDao authorityDaoImpl;
       private ResourceDao resourceDaoImpl;
       
       

		 
	
		public ResourceDao getResourceDaoImpl() {
		return resourceDaoImpl;
	}
		@Resource(name="resourceDaoImpl")
	public void setResourceDaoImpl(ResourceDao resourceDaoImpl) {
		this.resourceDaoImpl = resourceDaoImpl;
	}
		public AuthorityDao getAuthorityDaoImpl() {
			return authorityDaoImpl;
		}
		@Resource(name="authorityDaoImpl")
		public void setAuthorityDaoImpl(AuthorityDao authorityDaoImpl) {
			this.authorityDaoImpl = authorityDaoImpl;
		}
	   
	public UserService getUserServiceImpl() {
		return userServiceImpl;
	}
    @Resource(name="userServiceImpl")
	public void setUserServiceImpl(UserService userServiceImpl) {
		this.userServiceImpl = userServiceImpl;
	}

	public List<GrantedAuthority> findGrantedAuthorityByUser(User user) {
		// TODO Auto-generated method stub
		     List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		    for(Role role:userServiceImpl.getUserById(userServiceImpl.getUserByUsername(user.getUsername()).getId()).getRoles()){
		    	      for(Authority authority:role.getAnthorities()){
		    	    	   authorities.add(new SimpleGrantedAuthority(authority.getCode())) ;
		    	      }
		    }
		return authorities;
	}
	public com.wsin.security.bean.User getUserByUsername(String username) {
		// TODO Auto-generated method stub
		return userServiceImpl.getUserByUsername(username);
	}
	public List<Authority> findAll() {
		// TODO Auto-generated method stub
		return authorityDaoImpl.findAll();
	}
	public List<com.wsin.security.bean.Resource> findObjectByMap(
			Map<String, Object> map) {
		// TODO Auto-generated method stub
		return resourceDaoImpl.findObjectByMap(map);
	}
	
	
	

}
