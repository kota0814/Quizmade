package com.example.quizmade.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "quiz")
public class Quiz {
	@Id
	@GeneratedValue
	private Integer id;
	@NotBlank(message = "入力してください")
	@Size(max = 500, message = "500文字以内で入力してください")
	private String question;
	@NotBlank(message = "入力してください")
	@Size(max = 45, message = "45文字以内で入力してください")
	private String answer;
	@NotBlank(message = "入力してください")
	@Size(max = 45, message = "45文字以内で入力してください")
	private String choices1;
	@NotBlank(message = "入力してください")
	@Size(max = 45, message = "45文字以内で入力してください")
	private String choices2;
	@NotBlank(message = "入力してください")
	@Size(max = 45, message = "45文字以内で入力してください")
	private String choices3;

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getChoices1() {
		return choices1;
	}

	public void setChoices1(String choices1) {
		this.choices1 = choices1;
	}

	public String getChoices2() {
		return choices2;
	}

	public void setChoices2(String choices2) {
		this.choices2 = choices2;
	}

	public String getChoices3() {
		return choices3;
	}

	public void setChoices3(String choices3) {
		this.choices3 = choices3;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

}
