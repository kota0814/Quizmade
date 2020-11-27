package com.example.quizmade.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.quizmade.dao.QuizDao;
import com.example.quizmade.domain.Quiz;

@Controller
public class QuizController {

	//1ページあたりの表示件数
	private static final int NUM_PER_PAGE = 5;

	@Autowired
	private QuizDao quizDao;

	@RequestMapping(value = "/listQuiz")
	public String list(@RequestParam(name="p",defaultValue="1") Integer page,Model model) throws Exception {
		List<Quiz> quizList = quizDao.findByPage(page,NUM_PER_PAGE);
		model.addAttribute("quizList", quizList);
		//pagenation用
		int totalPages = quizDao.totalPages(NUM_PER_PAGE);
		model.addAttribute("totalPages",totalPages);
		model.addAttribute("currentPage",page);
		return "listQuiz";
	}

	@RequestMapping(value = "/addQuiz", method = RequestMethod.GET)
	public String addGet(Model model) throws Exception {
		Quiz quiz = new Quiz();
		model.addAttribute("quiz",quiz);
		return "addQuiz";
	}

	@RequestMapping(value = "/addQuiz", method = RequestMethod.POST)
	public String addPost(
			@Valid Quiz quiz,
			Errors errors,
			Model model) throws Exception {

		//エラーがなければデータの追加
		//エラーがあればフォームの再表示
		if (!errors.hasErrors()) {
			//データの追加
			quizDao.insert(quiz);
			return "addQuizDone";
		} else {
			//フォームの再表示
			return "addQuiz";
		}

	}
	@RequestMapping(value = "/delQuiz/{id}")
	public String delete(
			@PathVariable Integer id,
			Model model) throws Exception {
		Quiz quiz = quizDao.findById(id);
		quizDao.delete(quiz);
		return "delQuizDone";
	}

	@RequestMapping(value = "/editQuiz/{id}",method = RequestMethod.GET)
	public String editGet(@PathVariable Integer id,Model model)
	throws Exception{
		Quiz quiz = quizDao.findById(id);
		model.addAttribute("quiz",quiz);
		return "editQuiz";

	}

	@RequestMapping(value = "/editQuiz/{id}",method = RequestMethod.POST)
	public String editPost(@Valid Quiz quiz,Errors errors,Model model)
	throws Exception {
		if (!errors.hasErrors()) {
			//データ追加
			quizDao.update(quiz);
			//完了ページを表示
			return "editQuizDone";
		} else {
			//フォームの再表示
			return "editQuiz";
		}
	}

}
