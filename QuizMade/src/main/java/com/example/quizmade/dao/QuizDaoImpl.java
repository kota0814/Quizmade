package com.example.quizmade.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.quizmade.domain.Quiz;

@Transactional
@Repository
public class QuizDaoImpl extends BaseDao implements QuizDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Quiz> findAll() throws Exception {
		return getSession().createCriteria(Quiz.class)
				.list();
	}

	@Override
	public Quiz findById(Integer id) throws Exception {
		return (Quiz) getSession().createCriteria(Quiz.class)
				.add(Restrictions.eq("id", id))
				.uniqueResult();
	}

	@Override
	public void insert(Quiz quiz) throws Exception {
		getSession().save(quiz);
	}

	@Override
	public void update(Quiz quiz) throws Exception {
		getSession().update(quiz);

	}

	@Override
	public void delete(Quiz quiz) throws Exception {
		getSession().delete(quiz);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Quiz> findByPage(int page, int numPerPage) throws Exception {
		int offset = numPerPage * (page - 1);
		return getSession().createCriteria(Quiz.class)
				.setFirstResult(offset)
				.setMaxResults(numPerPage)
				.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public int totalPages(int numPerPage) throws Exception {
		Long count = (Long) getSession().createCriteria(Quiz.class)
				.setProjection(Projections.rowCount())
				.uniqueResult();
		return (int) Math.ceil((double) count / numPerPage);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Quiz> findRandomQuestion() throws Exception {

		Criteria criteria = getSession().createCriteria(Quiz.class);
				criteria.add(Restrictions.sqlRestriction("1=1 order by rand()"));
				criteria.setMaxResults(1);
		return criteria.list();

	}

	@Override
	public int totalQuestions(int numOfQuestion) throws Exception {
		Long count = (Long) getSession().createCriteria(Quiz.class)
				.setProjection(Projections.rowCount())
				.uniqueResult();
		return (int) Math.ceil((double) count / numOfQuestion);
	}

}
