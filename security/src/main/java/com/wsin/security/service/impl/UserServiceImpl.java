package com.wsin.security.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wsin.security.bean.User;
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

		
        
          
          
}
