package com.wsin.security.securityintercepter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.wsin.security.bean.User;
import com.wsin.security.service.SecurityService;

public class DefLonginFilter extends UsernamePasswordAuthenticationFilter {
	
	 private SecurityService securityServiceImpl;
     

		public SecurityService getSecurityServiceImpl() {
				return securityServiceImpl;
			}
	       
	        @Resource(name="securityServiceImpl")
			public void setSecurityServiceImpl(SecurityService securityServiceImpl) {
				this.securityServiceImpl = securityServiceImpl;
			}

	@Override
	public Authentication attemptAuthentication(HttpServletRequest request,
			HttpServletResponse response) throws AuthenticationException {
		// TODO Auto-generated method stub
		String username = obtainUsername(request).toUpperCase().trim();
		 User user = new User();
		  user.setUsername(username);
		String password = obtainPassword(request);
		UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(username, password,securityServiceImpl.findGrantedAuthorityByUser(user));
		setDetails(request, authRequest);
		return this.getAuthenticationManager().authenticate(authRequest);
		
	
	}
	
	  

}
