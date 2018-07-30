package com.onildoaguiar.bookstorespringmvc.store.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.onildoaguiar.bookstorespringmvc.store.daos.ProductDAO;
import com.onildoaguiar.bookstorespringmvc.store.models.PriceType;
import com.onildoaguiar.bookstorespringmvc.store.models.Product;

@Controller
public class ProductsController {

	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping("/products/form")
	public ModelAndView form() {
		ModelAndView modelAndView = new ModelAndView("products/form");
		modelAndView.addObject("types",PriceType.values());
		return modelAndView;
	}
	
	@RequestMapping("/products")
	public String add(Product product) {
		productDAO.save(product);
		return "products/success";
	}
}
