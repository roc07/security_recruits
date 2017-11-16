package com.musala.recruits.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BaseController {

	@GetMapping("/")
	public String showMain() {
		
		return "home";		
	}
	
	@GetMapping("/home")
	public String showHome() {
		
		return "home";		
	}
	
	@GetMapping("/login")
	public String showLogin() {
		
		return "login";		
	}	
	
	@GetMapping("/secret")
	public String showSecret() {
		
		return "secret";
	}
	
	@GetMapping("/hr-main")
	public String showHrMain() {
		
		return "hr-main";
	}
	
	@GetMapping("/evaluator-main")
	public String showEvaluatorMain() {
		
		return "evaluator-main";
	}	
}

