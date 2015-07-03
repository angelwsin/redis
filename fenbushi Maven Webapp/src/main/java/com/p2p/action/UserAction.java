package com.p2p.action;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import me.ready.annotation.Ready;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.p2p.bean.user.User;
import com.p2p.service.UserService;

/**
 * 用户对象action
 * 
 * @package com.p2p.action
 * @author Ready
 * @date 2014年12月26日
 * @since
 * 
 */
@SuppressWarnings({ "serial" })
@Controller
@Scope("prototype")
public class UserAction  extends ActionSupport implements ServletRequestAware {
	    @Resource
	    UserService userService;
	    private HttpServletRequest request;
	    
	    private User user;
	     @Ready
	     public String  list(){
	    	 request.setAttribute("userList", userService.findUsers());
	    	 return "user_info";
	     }
	     
	     @Ready
	     public String  add(){
	    	 return "user_add";
	     }
	     @Ready
	     public void edit(){
	    	  userService.save(user);
	    	  try {
				ServletActionContext.getResponse().sendRedirect("/fenbushi/user/list");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	 
	     }
		public void setServletRequest(HttpServletRequest request) {
			// TODO Auto-generated method stub
		       this.request = request;	
		}

		
		public User getUser() {
			return user;
		}

		
		public void setUser(User user) {
			this.user = user;
		}
		
		
		
}