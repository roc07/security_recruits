package com.musala.recruits.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.musala.recruits.dao.RecruitDAO;
import com.musala.recruits.entities.Recruit;

@Service
public class RecruitServiceImplementation implements RecruitService {

	@Autowired
	private RecruitDAO recruitDao;
	
	@Override
	@Transactional
	public List<Recruit> getAllRecruits() {
		
		return recruitDao.getAllRecruits();
	}

	@Override
	@Transactional
	public Recruit getOneRecruit(int id) {
		System.out.println("done");
		return recruitDao.getOneRecruit(id);
	}

}
