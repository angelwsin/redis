package com.redis.test;

import java.io.Serializable;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import com.redis.bean.User;
import com.redis.dao.user.UserDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
@TransactionConfiguration(defaultRollback = false)
public class TestRedis {
	     @Resource
         private RedisTemplate<Serializable,Serializable> redisTemplate;
	     @Resource(name="redisWinTemplate")
	     private RedisTemplate<Serializable, Serializable> redisWinTemplateLoc;
	     @Resource(name="userDao")
	     private UserDao userDao;
	   // @Test
	     public void testRedis(){
	    	  System.out.println(redisTemplate.getClass());
	     }
	   // @Test
	     public void testSave(){
	    	   User u = new User();
	    	   u.setId(19);
	    	   u.setName("hedandan");
	    	  // userDao.saveUser(u);
	    	   userDao.saveMapUser(u);
	     }
	     //@Test
	     public void testGetUser(){
	    	User user=  userDao.findUserByID(1);
	    	System.out.println(user.getName());
	     }
	     //s@Test
	     public void testwin(){
	    	  User user = new User();
	        user.setId(48);
	      user.setName("wangwu");
	    	  userDao.saveWinMapUser(user);
	     }
	     @Test
	     public void testL(){
	    	 System.out.println(redisWinTemplateLoc.getClass());
	    	 ValueOperations<Serializable, Serializable>  op=	 redisWinTemplateLoc.opsForValue();
	    	
	    	 
	     }
	     
}
