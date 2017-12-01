package com.musala.recruits.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.musala.recruits.entities.Review;

@Repository
public class ReviewDAOImplementation implements ReviewDAO {

	@Autowired
	public SessionFactory sessionFactory;
	
	@Override
	public Review getOneReview(int id) {

		Session session = sessionFactory.getCurrentSession();
		return session.get(Review.class, id);
	}

}
