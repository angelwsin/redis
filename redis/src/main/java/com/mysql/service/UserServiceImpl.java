package com.mysql.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mysql.bean.User;
import com.mysql.dao.UserDao;

@Service
public class UserServiceImpl implements UserService {

	 @Resource(name="mysqlUserDao")
	 UserDao mysqlUserDao;
	 
	 
	public void save(User user) {
		// TODO Auto-generated method stub
		mysqlUserDao.save(user);
	}
	public List<User> findUsers() {
		// TODO Auto-generated method stub
		return mysqlUserDao.findUsers();
	}

	
}
