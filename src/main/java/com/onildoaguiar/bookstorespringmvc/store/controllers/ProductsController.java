package com.onildoaguiar.bookstorespringmvc.store.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.onildoaguiar.bookstorespringmvc.store.daos.ProductDAO;
import com.onildoaguiar.bookstorespringmvc.store.models.PriceType;
import com.onildoaguiar.bookstorespringmvc.store.models.Product;

@Controller
@RequestMapping("/products")
public class ProductsController {

	@Autowired
	private ProductDAO productDAO;

	@RequestMapping("/form")
	public ModelAndView form() {
		ModelAndView modelAndView = new ModelAndView("products/form");
		modelAndView.addObject("types",PriceType.values());
		return modelAndView;
	}

	@RequestMapping(method=RequestMethod.POST)
	public String add(Product product) {
		productDAO.save(product);
		return "products/success";
	}

	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView list(Product product) {
		List<Product> products = productDAO.all();
		ModelAndView modelAndView = new ModelAndView("products/list");
		modelAndView.addObject("products",products);
		return modelAndView;
	}
}
