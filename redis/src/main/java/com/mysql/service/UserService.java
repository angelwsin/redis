package com.mysql.service;

import java.util.List;

import com.mysql.bean.User;


public interface UserService {
	
	  public void save(User user);
	 
	  public List<User> findUsers();
	
}
