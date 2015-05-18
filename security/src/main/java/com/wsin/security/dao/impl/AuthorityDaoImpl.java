package com.wsin.security.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.wsin.security.bean.Authority;
import com.wsin.security.bean.User;
import com.wsin.security.dao.AuthorityDao;

@Repository("authorityDaoImpl")
public class AuthorityDaoImpl extends BaseDaoImpl<Authority> implements AuthorityDao {

	

}
