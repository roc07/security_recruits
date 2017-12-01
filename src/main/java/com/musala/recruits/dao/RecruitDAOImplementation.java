package com.musala.recruits.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.musala.recruits.entities.Recruit;

@Repository
public class RecruitDAOImplementation implements RecruitDAO {

	@Autowired
	public SessionFactory sessionFactory;
	
	@Override
	public List<Recruit> getAllRecruits() {

		Session session = sessionFactory.getCurrentSession();

		Query<Recruit> currentQuery = 
				session.createQuery("from Recruit", Recruit.class);
		
		List<Recruit> allRecruits = currentQuery.getResultList();

		return allRecruits;
	}
	
	@Override
	public Recruit getOneRecruit(int id) {
		
		Session session = sessionFactory.getCurrentSession();

		return session.get(Recruit.class, id);
	}

}
