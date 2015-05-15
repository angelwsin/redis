package com.wsin.security.service.impl;

import org.springframework.stereotype.Service;

import com.wsin.security.bean.User;
import com.wsin.security.dao.impl.BaseDaoImpl;
import com.wsin.security.service.UserService;

@Service("userServiceImpl")
public class UserServiceImpl extends BaseDaoImpl<User> implements UserService<User> {

}
