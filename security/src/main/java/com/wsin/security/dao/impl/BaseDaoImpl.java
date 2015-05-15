package com.wsin.security.dao.impl;

import javax.annotation.Resource;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.wsin.security.dao.BaseDao;
@Repository
public abstract class BaseDaoImpl<T> implements BaseDao<T> {
	
	    private SessionFactory sessionFactory;
	    
	    
      public SessionFactory getSessionFactory() {
			return sessionFactory;
		}

        @Resource(name="sessionFactory")
		public void setSessionFactory(SessionFactory sessionFactory) {
			this.sessionFactory = sessionFactory;
		}
        
        public Session getSession(){
        	return    this.sessionFactory.getCurrentSession();
        }


	public void save(T entiry) {
    	// TODO Auto-generated method stub
    	  getSession().save(entiry);
    }
}
