package com.example.quizmade.dao;

import java.util.List;

import com.example.quizmade.domain.Quiz;

public interface QuizDao {

	public List<Quiz> findAll() throws Exception;

	public Quiz findById(Integer id) throws Exception;

	public void insert(Quiz quiz) throws Exception;

	public void update(Quiz quiz) throws Exception;

	public void delete(Quiz quiz) throws Exception;

	public List<Quiz> findByPage(int page, int numPerPage) throws Exception;

	public int totalPages(int numPerPage) throws Exception;

	public List<Quiz> findRandomQuestion() throws Exception;

	public int totalQuestions(int numOfQuestion) throws Exception;

}
