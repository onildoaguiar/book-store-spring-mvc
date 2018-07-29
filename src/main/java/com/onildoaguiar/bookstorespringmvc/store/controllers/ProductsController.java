package com.onildoaguiar.bookstorespringmvc.store.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onildoaguiar.bookstorespringmvc.store.daos.ProductDAO;
import com.onildoaguiar.bookstorespringmvc.store.models.Product;

@Controller
public class ProductsController {

	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping("/products/form")
	public String form() {
		return "products/form";
	}
	
	@RequestMapping("/products")
	public String add(Product product) {
		System.out.println(product);
		productDAO.save(product);
		return "products/success";
	}
}
