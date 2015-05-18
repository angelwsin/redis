package com.wsin.security.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wsin.security.bean.Role;
import com.wsin.security.dao.RoleDao;
import com.wsin.security.service.RoleService;

@Service("roleServiceImpl")
public class RoleServiceImpl implements RoleService {

	
	 private RoleDao roleDaoImpl;

		public RoleDao getRoleDaoImpl() {
			return roleDaoImpl;
		}
	    @Resource(name="roleDaoImpl")
		public void setRoleDaoImpl(RoleDao roleDaoImpl) {
			this.roleDaoImpl = roleDaoImpl;
		}
		public void save(Role role) {
			// TODO Auto-generated method stub
			this.roleDaoImpl.save(role);
		}
	    
	    
}
