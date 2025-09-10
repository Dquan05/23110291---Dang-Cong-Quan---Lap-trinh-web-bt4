package vn.iotstar.dao;

import vn.iotstar.entity.User;
import vn.iotstar.utils.JpaUtil;
import jakarta.persistence.*;

public class UserDAO {
	public User findByUserName(String username) {
		EntityManager em = JpaUtil.getEntityManager();
		try {
			String jpql = "SELECT u FROM User u WHERE u.userName = :u";
			return em.createQuery(jpql, User.class).setParameter("u", username).getResultStream().findFirst()
					.orElse(null);
		} finally {
			em.close();
		}
	}

	public void insert(User u) {
		EntityManager em = JpaUtil.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();
			em.persist(u);
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
