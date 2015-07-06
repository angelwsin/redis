package com.mysql.dao;

import java.util.List;

import com.datasource.annotation.DataSource;
import com.mysql.bean.User;


public interface UserDao {
	
	@DataSource("dataSourceMaster")
	  public void save(User user);
	 @DataSource("dataSourceSlave")
	  public  List<User>  findUsers();
}
