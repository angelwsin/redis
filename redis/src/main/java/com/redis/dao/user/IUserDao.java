package com.redis.dao.user;

import java.io.Serializable;

import com.redis.bean.User;

public interface IUserDao {
	public void saveUser(final User user);
	public void saveMapUser(User user);
	public User findUserByID(Serializable id);
}
