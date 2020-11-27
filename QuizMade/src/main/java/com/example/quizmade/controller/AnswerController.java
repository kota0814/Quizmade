package com.example.quizmade.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AnswerController {

	static int count = 0;
	static int correct = 0;

	@RequestMapping(value = { "/correct" })
	public String correct() throws Exception {

		return "correct";

	}

	@RequestMapping(value = { "/incorrect" })
	public String incorrect() throws Exception {
		return "incorrect";
	}

}
