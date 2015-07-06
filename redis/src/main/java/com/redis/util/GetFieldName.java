package com.redis.util;

import java.lang.reflect.Field;
import java.util.Map;

public class GetFieldName {
	
	public static String getFieldName(){
		return "";
	}
	
	public Object getObject(Object obj,Map<String, String> map){
		         Class<?> clazz =   obj.getClass();
		      try {
				for(String str:map.keySet()){
					Field field = clazz.getField(str);
					if(field!=null){
						
					}
					  
				  }
				return null;
			} catch (NoSuchFieldException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		      return null;
	}
	
	


}
