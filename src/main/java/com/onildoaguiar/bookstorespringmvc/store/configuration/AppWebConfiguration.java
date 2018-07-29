package com.onildoaguiar.bookstorespringmvc.store.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.onildoaguiar.bookstorespringmvc.store.controllers.HomeController;
import com.onildoaguiar.bookstorespringmvc.store.daos.ProductDAO;

@EnableWebMvc
@ComponentScan(basePackageClasses={HomeController.class,ProductDAO.class})
public class AppWebConfiguration {

	@Bean
	public InternalResourceViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");

		return resolver;
	}
}