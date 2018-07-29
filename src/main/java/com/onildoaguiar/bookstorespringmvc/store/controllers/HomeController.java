package com.onildoaguiar.bookstorespringmvc.store.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String index() {
		System.out.println("Book Store Home Page");
		return "home";
	}
}
