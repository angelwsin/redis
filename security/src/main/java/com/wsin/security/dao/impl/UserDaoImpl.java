package com.wsin.security.dao.impl;

import org.springframework.stereotype.Repository;

import com.wsin.security.bean.User;
import com.wsin.security.dao.UserDao;

@Repository("userDaoImpl")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {


}
