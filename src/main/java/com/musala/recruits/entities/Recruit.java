package com.musala.recruits.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="recruits")
public class Recruit {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	@Column(name="email")
	private String email;
	
	@Column(name="phone")
	private String phone;	
	
	@Column(name="check_date")
	private String checkDate;
	
	@ManyToMany(fetch=FetchType.EAGER,
			cascade= {CascadeType.DETACH, CascadeType.MERGE,
					CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinTable(
			name="current_score",
			joinColumns=@JoinColumn(name="recruit_id"),
			inverseJoinColumns=@JoinColumn(name="test_id"))
	private List<Test> tests;
	
	@OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL )	
	@JoinColumn(name="recruit_id")
	private List<CurrentScore> currentScore;	
	
	public Recruit() {
		
	}	
	
	public Recruit(String firstName, String lastName, String email, String phone, String checkDate) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
		this.checkDate = checkDate;
	}

	public List<CurrentScore> getCurrentScore() {
		return currentScore;
	}

	public void setCurrentScore(List<CurrentScore> currentScore) {
		this.currentScore = currentScore;
	}

	public List<Test> getTests() {
		return tests;
	}

	public void setTests(List<Test> tests) {
		this.tests = tests;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}

	@Override
	public String toString() {
		return "Recruit [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", phone=" + phone + ", checkDate=" + checkDate + "]";
	}
	
	
	
}
