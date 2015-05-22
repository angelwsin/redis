package security;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import com.wsin.security.bean.Authority;
import com.wsin.security.bean.Role;
import com.wsin.security.bean.User;
import com.wsin.security.service.AuthorityService;
import com.wsin.security.service.ResourceService;
import com.wsin.security.service.RoleService;
import com.wsin.security.service.SecurityService;
import com.wsin.security.service.UserService;
import com.wsin.security.util.UUIDUtils;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:applicationContext-context.xml")
@TransactionConfiguration(defaultRollback=false)
public class BaseDaoTest {
	
	  private UserService userServiceImpl;
	  @Autowired
	  private AuthorityService authorityService;
	  @Autowired
	  private RoleService reRoleService;
	  @Autowired
	  private ResourceService resourceService;
	  @Autowired
	  private SecurityService securityServiceImpl;
	 
	public UserService getUserServiceImpl() {
		return userServiceImpl;
	}
	@Resource(name="userServiceImpl")
	public void setUserServiceImpl(UserService userServiceImpl) {
		this.userServiceImpl = userServiceImpl;
	}
	@Autowired
	 SessionFactory sessionFactory;
	 
	 //@Test
	 public void testSession(){
		  System.out.println(sessionFactory==null);
	 }
	@Test
	 public void testBaseDao(){
		  com.wsin.security.bean.Resource resource = new com.wsin.security.bean.Resource();
		  resource.setId(UUIDUtils.getUUID());
		  resource.setName("退出页");
		  resource.setContent("/logout");
		  resource.setStatus(1);
		  resource.setType("url");
		  Set<com.wsin.security.bean.Resource> resources = new HashSet<com.wsin.security.bean.Resource>();
		  resources.add(resource);
		  Authority authority = new Authority();
		  authority.setAnthorityName("修改");
		  authority.setCode("logout");
		  authority.setId(UUIDUtils.getUUID());
		  authority.setResources(resources);
		  authority.setStatus(1);
		  Set<Authority> authorities = new HashSet<Authority>();
		  authorities.add(authority);
		  resource.setAuthorities(authorities);
		  
		  Role  role = new Role();
		  role.setId(UUIDUtils.getUUID());
		  role.setCode("user");
		  role.setRoleName("普通用户");
		  role.setStatus(1);
		  role.setAnthorities(authorities);
		  Set<Role> roles = new HashSet<Role>();
		  roles.add(role);	
		  authority.setResources(resources);
		  
//		  User user = new User();
//		  user.setId(UUIDUtils.getUUID());
//		  user.setUsername("wsin");
//		  user.setEmail("angelwsin@163.com");
//		  user.setPassword("111111");
//		  user.setRoles(null);
//		  user.setStatus(1);
		  User user=  userServiceImpl.getUserById(userServiceImpl.getUserByUsername("admin").getId());
		 Set<User> users = new HashSet<User>();
		 users.add(user);
		 role.setUsers(users);
		 user.setRoles(roles);
	     userServiceImpl.saveOrUpdate(user);
		 // userServiceImpl.save(user);
		  //authorityService.save(authority);
		 
		  
	 }
	 
	 
	 //@Test 
	public void tesQuery(){
		User user=  userServiceImpl.getUserById(userServiceImpl.getUserByUsername("admin").getId());
	    for(Role role:user.getRoles()){
	      for(Authority authority:role.getAnthorities()){
	    	   for(com.wsin.security.bean.Resource resource:authority.getResources()){
	    		    System.out.println(resource.getContent()+":"+resource.getType());
	    	   }
	      }
	    }
		 
	
		
	}
	//@Test
 public void testQ(){
	 User user=  userServiceImpl.getUserById(userServiceImpl.getUserByUsername("admin").getId());
	}
	

}
