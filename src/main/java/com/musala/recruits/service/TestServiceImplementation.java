package com.musala.recruits.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.musala.recruits.dao.TestDAO;
import com.musala.recruits.entities.Test;

@Service
public class TestServiceImplementation implements TestService {

	@Autowired
	private TestDAO TestDao;
	
	@Override
	@Transactional
	public Test getOneTest(int id) {

		return TestDao.getOneTest(id);
	}

}
