package com.musala.recruits.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.musala.recruits.entities.Test;

@Repository
public class TestDAOImplementation implements TestDAO {

	@Autowired
	public SessionFactory sessionFactory;
	
	@Override
	public Test getOneTest(int id) {

		Session session = sessionFactory.getCurrentSession();
		return session.get(Test.class, id);
	}

}
