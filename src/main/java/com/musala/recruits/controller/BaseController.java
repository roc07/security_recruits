package com.musala.recruits.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.musala.recruits.entities.Recruit;
import com.musala.recruits.service.RecruitService;

@Controller
public class BaseController {

	@Autowired
	private RecruitService recruitImpl;
	
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
	public String showHrMain(Model theModel) {
		
		List<Recruit> allRecruits = recruitImpl.getAllRecruits();	
		theModel.addAttribute("allRecruits", allRecruits);
				
		return "hr-main";
	}
	
	@GetMapping("/evaluator-main")
	public String showEvaluatorMain() {
		
		return "evaluator-main";
	}	
	
	
	
}

