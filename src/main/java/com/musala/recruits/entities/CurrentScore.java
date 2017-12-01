package com.musala.recruits.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="current_score")
public class CurrentScore {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Column(name="recruit_id")
	private int recruitId;
	
	@Column(name="test_id")
	private int testId;
	
	@Column(name="test_score")
	private int testScore;
	
	@OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL)	
	@JoinColumn(name="current_score_id")
	private List<Review> review;	
	
	@OneToOne(fetch=FetchType.EAGER,
			cascade= {CascadeType.DETACH, CascadeType.MERGE,
					CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinColumn(name="recruit_id", insertable = false, updatable = false)
	private Recruit recruits;	
	
	@ManyToOne(fetch=FetchType.EAGER,
			cascade= {CascadeType.DETACH, CascadeType.MERGE,
					CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinColumn(name="evaluators_id")
	private Evaluator evaluator;	
	
	public CurrentScore() {
		
	}

	public CurrentScore(int recruitId, int testId, int testScore) {
		this.recruitId = recruitId;
		this.testId = testId;
		this.testScore = testScore;
	}

	public Evaluator getEvaluator() {
		return evaluator;
	}

	public void setEvaluator(Evaluator evaluator) {
		this.evaluator = evaluator;
	}

	public Recruit getRecruits() {
		return recruits;
	}

	public void setRecruits(Recruit recruits) {
		this.recruits = recruits;
	}

	public List<Review> getReview() {
		return review;
	}

	public void setReview(List<Review> review) {
		this.review = review;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRecruitId() {
		return recruitId;
	}

	public void setRecruitId(int recruitId) {
		this.recruitId = recruitId;
	}

	public int getTestId() {
		return testId;
	}

	public void setTestId(int testId) {
		this.testId = testId;
	}

	public int getTestScore() {
		return testScore;
	}

	public void setTestScore(int testScore) {
		this.testScore = testScore;
	}

	@Override
	public String toString() {
		return "CurrentScore [id=" + id + ", recruitId=" + recruitId + ", testId=" + testId + ", testScore=" + testScore
				+ "]";
	}
	
	
}
