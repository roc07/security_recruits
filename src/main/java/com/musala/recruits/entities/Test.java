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
import javax.persistence.Table;

@Entity
@Table(name="tests")
public class Test {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="max_score")
	private int maxScore;
	
	@Column(name="test_type")
	private String testType;
	
	@ManyToMany(fetch=FetchType.EAGER,
			cascade= {CascadeType.DETACH, CascadeType.MERGE,
					CascadeType.PERSIST, CascadeType.REFRESH},
			mappedBy="tests")
	private List<Recruit> recruits;
	
	public Test() {

	}
	
	public Test(int id, int maxScore, String testType) {
		this.id = id;
		this.maxScore = maxScore;
		this.testType = testType;
	}

	public List<Recruit> getRecruits() {
		return recruits;
	}

	public void setRecruits(List<Recruit> recruits) {
		this.recruits = recruits;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMaxScore() {
		return maxScore;
	}

	public void setMaxScore(int maxScore) {
		this.maxScore = maxScore;
	}

	public String getTestType() {
		return testType;
	}

	public void setTestType(String testType) {
		this.testType = testType;
	}

	@Override
	public String toString() {
		return "Test [id=" + id + ", maxScore=" + maxScore + ", testType=" + testType + "]";
	}
	
	
}
