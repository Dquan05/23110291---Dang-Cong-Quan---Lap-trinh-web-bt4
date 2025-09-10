package vn.iotstar.dao;

import java.util.List;

import vn.iotstar.entity.Category;
import vn.iotstar.utils.JpaUtil;

import jakarta.persistence.*;

public class CategoryDAO {

	public List<Category> findAll() {
		EntityManager em = JpaUtil.getEntityManager();
		try {
			return em.createQuery("SELECT c FROM Category c ORDER BY c.id DESC", Category.class).getResultList();
		} finally {
			em.close();
		}
	}

	public Category findById(int id) {
		EntityManager em = JpaUtil.getEntityManager();
		try {
			return em.find(Category.class, id);
		} finally {
			em.close();
		}
	}

	public void insert(Category c) {
		EntityManager em = JpaUtil.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();
			em.persist(c);
			tx.commit();
		} catch (Exception e) {
			if (tx.isActive())
				tx.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	public void update(Category c) {
		EntityManager em = JpaUtil.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();
			em.merge(c);
			tx.commit();
		} catch (Exception e) {
			if (tx.isActive())
				tx.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	public void delete(int id) {
		EntityManager em = JpaUtil.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();
			Category c = em.find(Category.class, id);
			if (c != null)
				em.remove(c);
			tx.commit();
		} catch (Exception e) {
			if (tx.isActive())
				tx.rollback();
			throw e;
		} finally {
			em.close();
		}
	}
}
