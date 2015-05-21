package com.wsin.security.securityintercepter;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;

import com.wsin.security.bean.Authority;
import com.wsin.security.service.SecurityService;

public class MyInvocationSecurityMetadataSourceService implements
		FilterInvocationSecurityMetadataSource {
	
	   private SecurityService securityServiceImpl;
	   private PathMatcher urlMatcher = new AntPathMatcher();
	   private static Map<String, Collection<ConfigAttribute>> resourceMap = null;
	   private Collection<ConfigAttribute> allAttribute = new ArrayList<ConfigAttribute>();
	   
	   

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
		 allAttribute = (Collection<ConfigAttribute>) securityServiceImpl.getAllAttributes();
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
					  System.out.println("FilterInvocation:"+url);
					Iterator<String> ite = resourceMap.keySet().iterator();
					while (ite.hasNext()) {
						String resURL = ite.next();
						System.out.println("url:"+url+":resURL:"+resURL);
						if (urlMatcher.match(url, resURL)) {
							System.out.println(resourceMap.get(resURL).toString());
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
		return this.allAttribute;
	}

}
