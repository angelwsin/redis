package com.wsin.security.securityintercepter;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.util.AntPathMatcher;

import com.wsin.security.bean.Authority;
import com.wsin.security.service.SecurityService;

public class MyInvocationSecurityMetadataSourceService implements
		FilterInvocationSecurityMetadataSource {
	
	   private SecurityService securityServiceImpl;
	   private AntPathMatcher  urlMatcher = new AntPathMatcher();
	   private static Map<String, Collection<ConfigAttribute>> resourceMap = null;
	   
	   

	public SecurityService getSecurityServiceImpl() {
		return securityServiceImpl;
	}
  
	public void setSecurityServiceImpl(SecurityService securityServiceImpl) {
		this.securityServiceImpl = securityServiceImpl;
	}
   
   public MyInvocationSecurityMetadataSourceService(SecurityService securityServiceImpl) {
	    this.securityServiceImpl=securityServiceImpl;
		loadResourceDefine();
	}


	private void loadResourceDefine() {
	// TODO Auto-generated method stub
		 resourceMap = new HashMap<String, Collection<ConfigAttribute>>();
	     for(Authority authority:securityServiceImpl.findAll()){
	    	    ConfigAttribute cAttribute= new SecurityConfig(authority.getCode());
	    	    for(com.wsin.security.bean.Resource resource:authority.getResources()){
	    	    	 if(resourceMap.containsKey(resource.getContent())){
	    	    		resourceMap.get(resource.getContent()).add(cAttribute); 
	    	    	 }else{
	    	    		  Collection<ConfigAttribute> atts = new ArrayList<ConfigAttribute>();
	    	    		    atts.add(cAttribute);
	    	    		    resourceMap.put(resource.getContent(), atts);
	    	    	 }
	    	    }
	     }

	
    }
	

	

	public Collection<ConfigAttribute> getAttributes(Object object)
			throws IllegalArgumentException {
		// guess object is a URL.
					String url = ((FilterInvocation) object).getRequestUrl();
					Iterator<String> ite = resourceMap.keySet().iterator();
					while (ite.hasNext()) {
						String resURL = ite.next();
						if (urlMatcher.match(url, resURL)) {
							return resourceMap.get(resURL);
						}
					}
					return null;
	}

	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return true;
	}

	public Collection<ConfigAttribute> getAllConfigAttributes() {
		// TODO Auto-generated method stub
		return null;
	}

}
