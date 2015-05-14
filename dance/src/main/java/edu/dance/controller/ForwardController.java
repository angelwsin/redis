package edu.dance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class ForwardController {
	
	@RequestMapping(value="/page/{forward}",method=RequestMethod.GET)
	public String forword(@PathVariable String forward){
		   System.out.println(forward);
		   return forward;
	}
}
