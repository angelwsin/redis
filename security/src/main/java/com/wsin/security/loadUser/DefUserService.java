package com.wsin.security.loadUser;

import javax.annotation.Resource;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.wsin.security.bean.User;
import com.wsin.security.service.SecurityService;
import com.wsin.security.service.impl.UserServiceImpl;

public class DefUserService implements UserDetailsService {
	
        private SecurityService securityServiceImpl;
        

	public SecurityService getSecurityServiceImpl() {
			return securityServiceImpl;
		}
       
        @Resource(name="securityServiceImpl")
		public void setSecurityServiceImpl(SecurityService securityServiceImpl) {
			this.securityServiceImpl = securityServiceImpl;
		}


	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		 User user =securityServiceImpl.getUserByUsername(username);
		UserDetails userDetails =(UserDetails) new org.springframework.security.core.userdetails.User(username, user.getPassword(), 
				true, true, true, true, securityServiceImpl.findGrantedAuthorityByUser(user));
		return userDetails;
	}
	

}
