package com.example.quizmade.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.quizmade.dao.QuizDao;
import com.example.quizmade.domain.Quiz;

@Controller
public class GameController {

	//最大問題数
	//public static final int MAX_QUESTION = 5;

	static int count = 0;
	static int correct = 0;

	@Autowired
	private QuizDao quizDao;

	@RequestMapping(value = "/game", method = RequestMethod.GET)
	public String gameGet(HttpSession session,Model model) throws Exception {

		List<Quiz> randomQuestion = quizDao.findRandomQuestion();
		model.addAttribute("randomQuestion", randomQuestion);

			count++;
			System.out.println("実行回数" + count + "回目");
			model.addAttribute("count",count);



		if (count <= 5) {
			return "game";
		} else {
			count=0;
			session.getAttribute("correct");
			model.addAttribute("correct",correct);

			if(correct == 5) {
				correct=0;
				return "perfect";
			} else if(correct >= 1) {
				correct=0;
				return "result";
			} else {
				correct=0;
				return "bad";
			}

			//correct=0;


			//return "result";
		}

	}


	@RequestMapping(value = "/game", method = RequestMethod.POST)
	public String gamePost(HttpSession session,@RequestParam Map<String, String> reqParam) throws Exception {

		//選択肢パラメータの習得
		String answer = reqParam.get("answer");
		String choices1 = reqParam.get("choices1");
		String choices2 = reqParam.get("choices2");
		String choices3 = reqParam.get("choices3");

		if (reqParam.get("answer") != null) {

			correct++;
			System.out.println("正解数" + correct + "です");



			return "correct";


		} else {
			return "incorrect";
		}
	}


	@RequestMapping(value = "/result", method = RequestMethod.GET)
	public String resultGet(Model model)throws Exception{
		model.addAttribute("correct",correct);

		return "result";

	}

	@RequestMapping(value = "/bad", method = RequestMethod.GET)
	public String badGet(Model model)throws Exception{
		model.addAttribute("correct",correct);

		return "bad";

	}
	@RequestMapping(value = "/perfect", method = RequestMethod.GET)
	public String perfectGet(Model model)throws Exception{
		model.addAttribute("correct",correct);

		return "perfect";

	}

}
