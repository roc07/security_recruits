package com.musala.recruits.dao;

import java.util.List;

import com.musala.recruits.entities.Recruit;

public interface RecruitDAO {

	public List<Recruit> getAllRecruits();
	
	public Recruit getOneRecruit(int id);

}
