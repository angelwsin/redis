package com.wsin.security.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wsin.security.bean.Authority;
import com.wsin.security.bean.User;
import com.wsin.security.dao.AuthorityDao;
import com.wsin.security.dao.RoleDao;
import com.wsin.security.dao.UserDao;
import com.wsin.security.service.UserService;

@Service("userServiceImpl")
public class UserServiceImpl  implements UserService {
          private UserDao userDaoImpl;
         
		public UserDao getUserDaoImpl() {
			return userDaoImpl;
		}
        @Resource(name="userDaoImpl")
		public void setUserDaoImpl(UserDao userDaoImpl) {
			this.userDaoImpl = userDaoImpl;
		}

		public void save(User user) {
			// TODO Auto-generated method stub
			this.userDaoImpl.save(user);
		}
		public List<Authority> findAuthorityByUser(User user) {
			// TODO Auto-generated method stub
			return userDaoImpl.findAuthorityByUser(user);
		}
		public User getUserById(Serializable id) {
			// TODO Auto-generated method stub
			return userDaoImpl.getUserById(id);
		}
		public User getUserByUsername(String username) {
			// TODO Auto-generated method stub
			return userDaoImpl.getUserByUsername(username);
		}

		
        
          
          
}
