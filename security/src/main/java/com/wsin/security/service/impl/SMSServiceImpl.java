package com.wsin.security.service.impl;

import org.springframework.stereotype.Service;

import com.ruanwei.interfacej.SmsClientSend;
import com.wsin.security.service.SMSService;

@Service("smsServiceImpl")
public class SMSServiceImpl implements SMSService {

	public String sendSMS(String url, String userID, String account,
			String password, String mobile, String content) {
		// TODO Auto-generated method stub
		return	SmsClientSend.sendSms(url, userID, account, password, mobile, content);
		
	}

}
