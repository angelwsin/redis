package com.wsin.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

public class DefLoginSuccessHandler extends
		SavedRequestAwareAuthenticationSuccessHandler {
         private String loginURL;
         
         
         
	public String getLoginURL() {
			return loginURL;
		}
		public void setLoginURL(String loginURL) {
			this.loginURL = loginURL;
		}



	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println(((User)authentication.getPrincipal()).getUsername()+":登陆成功!");
		 System.out.println(((User)authentication.getPrincipal()).getAuthorities().toString());
		request.getSession().setAttribute("currentUser",(User)authentication.getPrincipal());
		response.sendRedirect(loginURL);
		
	}
	
	
	

}
