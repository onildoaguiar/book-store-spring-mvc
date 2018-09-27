package com.onildoaguiar.bookstorespringmvc.store.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onildoaguiar.bookstorespringmvc.store.daos.ProductDAO;
import com.onildoaguiar.bookstorespringmvc.store.models.PriceType;
import com.onildoaguiar.bookstorespringmvc.store.models.Product;
import com.onildoaguiar.bookstorespringmvc.store.util.FileSaver;
import com.onildoaguiar.bookstorespringmvc.store.validation.ProductValidation;

@Controller
@RequestMapping("/products")
public class ProductsController {

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private FileSaver fileSaver;

	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(new ProductValidation());
	}

	@RequestMapping("/form")
	public ModelAndView form(Product product) {
		ModelAndView modelAndView = new ModelAndView("products/form");
		modelAndView.addObject("types",PriceType.values());
		return modelAndView;
	}

	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView add(MultipartFile summary, @Valid Product product, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors()) {
			return form(product);
		}
		
		String path = fileSaver.write("summary-files", summary);
		product.setSummaryPath(path);
		productDAO.save(product);
		redirectAttributes.addFlashAttribute("success","Product successfully registered!");
		return new ModelAndView("redirect:/products");
	}

	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView list(Product product) {
		List<Product> products = productDAO.all();
		ModelAndView modelAndView = new ModelAndView("products/list");
		modelAndView.addObject("products",products);
		return modelAndView;
	}

	@RequestMapping("/detail/{id}")
	public ModelAndView detail(@PathVariable("id") Integer id){
        ModelAndView modelAndView = new ModelAndView("products/detail");
        Product product = productDAO.find(id);
        modelAndView.addObject("product", product);

        return modelAndView;
	}
}
