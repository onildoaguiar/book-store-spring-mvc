package com.onildoaguiar.bookstorespringmvc.store.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.onildoaguiar.bookstorespringmvc.store.models.Product;

@Repository
@Transactional
public class ProductDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void save(Product product) {
		manager
		.persist(product);
	}

	public List<Product> all() {
		return manager
				.createQuery("select p from Product p", Product.class)
				.getResultList();
	}
}
