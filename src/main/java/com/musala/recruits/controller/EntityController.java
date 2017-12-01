package com.musala.recruits.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.musala.recruits.entities.Evaluator;
import com.musala.recruits.entities.Recruit;
import com.musala.recruits.entities.Review;
import com.musala.recruits.entities.Test;
import com.musala.recruits.service.EvaluatorService;
import com.musala.recruits.service.RecruitService;
import com.musala.recruits.service.ReviewService;
import com.musala.recruits.service.TestService;


@Controller
public class EntityController {
	
	@Autowired
	public RecruitService recruitService;
	@Autowired
	public EvaluatorService evaluatorService;
	@Autowired
	public TestService testService;
	@Autowired
	public ReviewService reviewService;	
	
	@GetMapping("/recruitPage")
	public String showRecruitPage(@ModelAttribute("recruitId") int theId, Model theModel) {

		Recruit recruit = recruitService.getOneRecruit(theId);
		theModel.addAttribute("theRecruit", recruit);
		return "recruit-page";
	}
	
	@GetMapping("/evaluatorPage")
	public String showSingleEvaluatorPage(@ModelAttribute("evaluatorId") int theId, Model theModel) {

		Evaluator evaluator = evaluatorService.getOneEvaluator(theId);
		theModel.addAttribute("theEvaluator", evaluator);
		return "evaluator";
	}
	
	@GetMapping("/testPage")
	public String showSingleTestPage(@ModelAttribute("testId") int theId, Model theModel) {

		Test test = testService.getOneTest(theId);
		theModel.addAttribute("theTest", test);
		return "test";
	}
	
	@GetMapping("/fullReview")
	public String showFullReview(@ModelAttribute("recruitId") int recruitId, 
			@ModelAttribute("reviewId") int reviewId, Model theModel) {

		Recruit recruit = recruitService.getOneRecruit(recruitId);
		theModel.addAttribute("theRecruit", recruit);
		
		Review review = reviewService.getOneReview(reviewId);
		theModel.addAttribute("theReview", review);
		
		return "recruit-page";
	}
	
}
