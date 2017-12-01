package com.musala.recruits.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.musala.recruits.dao.EvaluatorDAO;
import com.musala.recruits.entities.Evaluator;

@Service
public class EvaluatorServiceImplementation implements EvaluatorService {

	@Autowired
	private EvaluatorDAO evaluatorDao;
	
	@Override
	@Transactional
	public Evaluator getOneEvaluator(int id) {

		return evaluatorDao.getOneEvaluator(id);
	}

}
