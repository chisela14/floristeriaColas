package com.jacaranda.ddbb;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.jacaranda.model.Purchase;

public class PurchaseControl {

	public static boolean addPurchase(Purchase p) throws ControlException {
		boolean result = false;
		Session session = ConnectionDDBB.getSession();
		try {
			session.getTransaction().begin();
			session.save(p);
			session.getTransaction().commit();
			result = true;
		}catch(HibernateException h) {//no se ha podido conectar a la base de datos
				
		}catch (Exception e) {
			session.getTransaction().rollback();
			throw new ControlException("Se ha realizado la misma compra en el mismo día, no se puede registrar");
		}
		return result;
	}

}
