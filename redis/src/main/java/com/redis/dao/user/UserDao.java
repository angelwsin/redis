package com.redis.dao.user;

import java.io.Serializable;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.BoundHashOperations;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.data.redis.core.script.RedisScript;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.stereotype.Repository;

import com.redis.bean.User;

@Repository("userDao")
public class UserDao implements IUserDao{
	
	
	 private RedisTemplate<Serializable, Serializable> redisTemplate;
	 private RedisTemplate<Serializable, Serializable> redisWinTemplate;
	 @Resource(name="redisTemplate")  
	public void setRedisTemplate(
			RedisTemplate<Serializable, Serializable> redisTemplate) {
		this.redisTemplate = redisTemplate;
		redisSerializer= redisTemplate.getStringSerializer();
	}
    
	 
	
	public RedisTemplate<Serializable, Serializable> getRedisWinTemplate() {
		return redisWinTemplate;
	}
	 @Resource(name="redisWinTemplate")
	public void setRedisWinTemplate(
			RedisTemplate<Serializable, Serializable> redisWinTemplate) {
		this.redisWinTemplate = redisWinTemplate;
		setRedisWinSerializer(redisWinTemplate.getStringSerializer());
	}



	private RedisSerializer<String> redisSerializer;
	
	private RedisSerializer<String> redisWinSerializer;
	
	public void saveUser(final User user){
	      
		    redisTemplate.execute(new RedisCallback<Object>() {
 
				public Object doInRedis(RedisConnection connection)
						throws DataAccessException {
					// TODO Auto-generated method stub
					
					connection.set(redisSerializer.serialize("user.id."+user.getId()), redisSerializer.serialize(user.getId()+""));
					connection.set(redisSerializer.serialize("user.name"), redisSerializer.serialize(user.getName()));
					return null;
				}
			});
	}
	
	public void saveMapUser(final User user){
		redisTemplate.execute(new RedisCallback<User>() {

			public User doInRedis(RedisConnection connection)
					throws DataAccessException {
				BoundHashOperations<Serializable, String, String> hashOperations =   redisTemplate.boundHashOps(user.getId());
				hashOperations.put("username", user.getName()); 
				return null;
			}
		});
		
	}

	public User findUserByID(Serializable id) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				BoundHashOperations<Serializable, String, String> hashOperations =   redisTemplate.boundHashOps(id);
				Map<String, String> user =hashOperations.entries();
				
				User  u  =new User();
				u.setId(Integer.valueOf(id+""));
				u.setName(user.get("username"));
				return u;
	}

	public void saveWinMapUser(User user){
		BoundHashOperations<Serializable, String, String> hashOperations =   redisWinTemplate.boundHashOps(user.getId());
		hashOperations.put("username", user.getName()); 
	}



	public RedisSerializer<String> getRedisWinSerializer() {
		return redisWinSerializer;
	}



	public void setRedisWinSerializer(RedisSerializer<String> redisWinSerializer) {
		this.redisWinSerializer = redisWinSerializer;
	}
	
	
	

}
