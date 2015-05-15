package security;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import com.wsin.security.bean.User;
import com.wsin.security.service.UserService;
import com.wsin.security.util.UUIDUtils;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:applicationContext-*.xml")
@TransactionConfiguration(defaultRollback=false)
public class BaseDaoTest {
	
	  private UserService<User> userServiceImpl;
	  
	  
	 
	public UserService<User> getUserServiceImpl() {
		return userServiceImpl;
	}
	@Resource(name="userServiceImpl")
	public void setUserServiceImpl(UserService<User> userServiceImpl) {
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
		  User user = new User();
		  user.setId(UUIDUtils.getUUID());
		  user.setUsername("admin");
		  user.setEmail("angelwsin@163.com");
		  user.setPassword("wq521");
		  user.setRoles(null);
		  user.setStatus(1);
		  userServiceImpl.save(user);
		  
	 }
	
	

}
