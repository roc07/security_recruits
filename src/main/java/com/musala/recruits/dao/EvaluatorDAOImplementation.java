package com.musala.recruits.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.musala.recruits.entities.Evaluator;

@Repository
public class EvaluatorDAOImplementation implements EvaluatorDAO {

	@Autowired
	public SessionFactory sessionFactory;
	
	@Override
	public Evaluator getOneEvaluator(int id) {

		Session session = sessionFactory.getCurrentSession();
		return session.get(Evaluator.class, id);
	}

}
