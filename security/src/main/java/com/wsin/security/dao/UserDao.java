package com.wsin.security.dao;

import java.io.Serializable;
import java.util.List;

import com.wsin.security.bean.Authority;
import com.wsin.security.bean.User;

public interface UserDao extends BaseDao<User> {
	  public List<Authority> findAuthorityByUser(User user);
	  public User getUserById(Serializable id);
	  public User getUserByUsername(String username) ;
	  
} 
