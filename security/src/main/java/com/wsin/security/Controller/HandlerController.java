package com.wsin.security.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HandlerController {
	
	@RequestMapping(value="/{index}",method=RequestMethod.GET)
	  public String index(@PathVariable("index")String index){
		 System.out.println("index");
		 return "page/"+index;  
	  }
	

}
