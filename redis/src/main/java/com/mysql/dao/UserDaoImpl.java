package com.mysql.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.mysql.bean.User;
//注意使用openSession才能生效
@Repository("mysqlUserDao")
public class UserDaoImpl implements UserDao {

	     @Resource
	     SessionFactory sessionFactory;
	public void save(User user) {
		// TODO Auto-generated method stub
		 sessionFactory.openSession().save(user);
	}
	
	@SuppressWarnings("unchecked")
	public List<User> findUsers() {
		// TODO Auto-generated method stub
		return (List<User>)sessionFactory.openSession().createQuery("from User").list();
	}
}
