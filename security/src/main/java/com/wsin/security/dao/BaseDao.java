package com.wsin.security.dao;

import java.util.List;
import java.util.Map;

public interface BaseDao<T> {
	 public void save(T entiry);
	 public List<T> findAll();
	 public List<T> findObjectByMap(Map<String,Object> map);

}
