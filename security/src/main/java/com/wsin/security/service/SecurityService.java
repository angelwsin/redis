package com.wsin.security.service;

import java.util.List;
import java.util.Map;

import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.core.GrantedAuthority;

import com.wsin.security.bean.Authority;
import com.wsin.security.bean.Resource;
import com.wsin.security.bean.User;




public interface SecurityService {
	
	 public List<GrantedAuthority> findGrantedAuthorityByUser(User user);
	 public User getUserByUsername(String username);
	 public List<Authority> findAll();
	 public List<Resource> findObjectByMap(Map<String,Object> map);
	 public List<ConfigAttribute> getAllAttributes();
}
