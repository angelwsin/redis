package com.wsin.security.service;

public interface SMSService {
	
	 public final static String URL="http://218.244.136.70:8888/sms.aspx";
	 public final static String USERID="1538";
	 public final static String ACCOUNT="ZHWL";
	 public final static String PASSWORD="123456";
	 public String  sendSMS(String url,String userID,String account,String password,String mobile, String content );

}
