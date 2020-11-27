package com.example.quizmade.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MenuController {

	@RequestMapping(value = {"/","/menu"})
	public String Menu() throws Exception {
		return "menu";

	}

}
