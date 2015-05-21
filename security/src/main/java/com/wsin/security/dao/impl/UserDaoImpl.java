package com.wsin.security.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.wsin.security.bean.Authority;
import com.wsin.security.bean.User;
import com.wsin.security.dao.UserDao;

@Repository("userDaoImpl")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

	@SuppressWarnings("unchecked")
	public List<Authority> findAuthorityByUser(User user) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class).add(Restrictions.eq("id", user.getId()));
		Criteria executableCriteria = criteria.getExecutableCriteria(getSession());
		return  (List<Authority>)executableCriteria.list();
	}


	public User getUserById(Serializable id) {
		// TODO Auto-generated method stub
		return (User) getSession().get(User.class, id);
	}

	public User getUserByUsername(String username) {
		// TODO Auto-generated method stub
		Criteria criteria=getSession().createCriteria(User.class).add(Restrictions.eq("username", username));
		 if(criteria.list()!=null&&criteria.list().size()>0){
			 return (User) criteria.list().get(0);
		 }else {
			return  null;
		}
		
	}


}
