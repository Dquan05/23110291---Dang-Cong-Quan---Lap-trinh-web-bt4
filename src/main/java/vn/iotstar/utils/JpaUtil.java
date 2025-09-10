package vn.iotstar.utils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JpaUtil {
	private static final EntityManagerFactory emf;

    static {
        try {
            emf = Persistence.createEntityManagerFactory("ShoppingWebPU");
        } catch (Throwable e) {
            System.err.println("Failed to init EMF: " + e);
            throw new ExceptionInInitializerError(e);
        }
    }

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public static void closeFactory() {
        if (emf != null && emf.isOpen()) emf.close();
    }
}
