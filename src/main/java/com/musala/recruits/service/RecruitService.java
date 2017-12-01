package com.musala.recruits.service;

import java.util.List;

import com.musala.recruits.entities.Recruit;

public interface RecruitService {

	public List<Recruit> getAllRecruits();
	
	public Recruit getOneRecruit(int id);

}
