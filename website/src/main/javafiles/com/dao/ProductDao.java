package com.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.online.Product;

public class ProductDao {
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public int saveProduct(Product p) {

		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();
		int pId = (Integer) session.save(p);
		tx.commit();
		session.close();
		return pId;

	}

	// get all products
	public List<Product> getAllProducts() {
		Session s = this.factory.openSession();
		Query query = s.createQuery("from Product");
		List<Product> list = ((org.hibernate.query.Query) query).list();
		return list;
	}

	// get all products of given category
	public List<Product> getAllProductsById(int cid) {
		Session s = this.factory.openSession();
		Query query = s.createQuery("from Product as p where p.category.categoryId =: id");
		query.setParameter("id", cid);
		List<Product> list = ((org.hibernate.query.Query) query).list();
		return list;
	}

}
