package eshop_manager.entity;

import java.io.Serializable;

public class QuestionInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6643309421333710439L;
	private int question_id;
	private String question_title;
	@Override
	public String toString() {
		return "QuestionInfo [question_id=" + question_id + ", question_title="
				+ question_title + "]";
	}
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public String getQuestion_title() {
		return question_title;
	}
	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}
}
