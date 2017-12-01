package com.musala.recruits.entities;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="reviews")
public class Review {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="approach")
	private int approach;
	
	@Column(name="approach_text")
	private String approachText;
	
	@Column(name="style")
	private int style;
	
	@Column(name="style_text")
	private String styleText;
	
	@Column(name="algorithms")
	private int algorithms;
	
	@Column(name="algo_text")
	private String algoText;
	
	@Column(name="notable_solutions")
	private String notableSolutions;
	
	@Column(name="overall_impression")
	private String overallImpression;
	
	@Column(name="appraisal")
	private int appraisal;
	
	@Column(name="evaluator_id")
	private int evaluatorId;
	
	@Column(name="current_score_id")
	private int currentScoreId;	

	@OneToOne(fetch=FetchType.EAGER, cascade=CascadeType.ALL)
	@JoinColumn(name="evaluator_id", insertable = false, updatable = false)
	private Evaluator evaluator;
	
	public Review () {
		
	}
	
	public Review(int approach, int style, int algorithms, String notableSolutions, String overallSolution,
			int appraisal, int evaluatorId, int currentScoreId) {
		this.approach = approach;
		this.style = style;
		this.algorithms = algorithms;
		this.notableSolutions = notableSolutions;
		this.overallImpression = overallSolution;
		this.appraisal = appraisal;
		this.evaluatorId = evaluatorId;
		this.currentScoreId = currentScoreId;
	}

	public int getCurrentScoreId() {
		return currentScoreId;
	}

	public void setCurrentScoreId(int currentScoreId) {
		this.currentScoreId = currentScoreId;
	}

	public Evaluator getEvaluator() {
		return evaluator;
	}

	public void setEvaluator(Evaluator evaluator) {
		this.evaluator = evaluator;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getApproach() {
		return approach;
	}

	public void setApproach(int approach) {
		this.approach = approach;
	}

	public int getStyle() {
		return style;
	}

	public void setStyle(int style) {
		this.style = style;
	}

	public int getAlgorithms() {
		return algorithms;
	}

	public void setAlgorithms(int algorithms) {
		this.algorithms = algorithms;
	}

	public String getNotableSolutions() {
		return notableSolutions;
	}

	public void setNotableSolution(String notableSolutions) {
		this.notableSolutions = notableSolutions;
	}

	public String getOverallImpression() {
		return overallImpression;
	}

	public void setOverallSolution(String overallImpression) {
		this.overallImpression = overallImpression;
	}

	public int getAppraisal() {
		return appraisal;
	}

	public void setAppraisal(int appraisal) {
		this.appraisal = appraisal;
	}

	public int getEvaluatorId() {
		return evaluatorId;
	}

	public void setEvaluatorId(int evaluatorId) {
		this.evaluatorId = evaluatorId;
	}	
	
	public String getApproachText() {
		return approachText;
	}

	public void setApproachText(String approachText) {
		this.approachText = approachText;
	}

	public String getStyleText() {
		return styleText;
	}

	public void setStyleText(String styleText) {
		this.styleText = styleText;
	}

	public String getAlgoText() {
		return algoText;
	}

	public void setAlgoText(String algoText) {
		this.algoText = algoText;
	}

	public void setNotableSolutions(String notableSolutions) {
		this.notableSolutions = notableSolutions;
	}

	public void setOverallImpression(String overallImpression) {
		this.overallImpression = overallImpression;
	}

	@Override
	public String toString() {
		return "Review [id=" + id + ", approach=" + approach + ", style=" + style + ", algorithms=" + algorithms
				+ ", notableSolutions=" + notableSolutions + ", overallImpression=" + overallImpression + ", appraisal="
				+ appraisal + "]";
	}
	
	
	
}
