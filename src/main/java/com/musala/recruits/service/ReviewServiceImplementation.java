package com.musala.recruits.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.musala.recruits.dao.ReviewDAO;
import com.musala.recruits.entities.Review;

@Service
public class ReviewServiceImplementation implements ReviewService {

	@Autowired
	private ReviewDAO reviewDao;
	
	@Override
	@Transactional
	public Review getOneReview(int id) {

		return reviewDao.getOneReview(id);
	}

}
