package com.jacaranda.ddbb;

import com.jacaranda.model.User;
import org.hibernate.Session;

public class UserControl {
	
	public static boolean addUser(User u) throws ControlException {
		boolean result = false;
		Session session = ConnectionDDBB.getSession();
		try {
			session.getTransaction().begin();
			session.save(u);
			session.getTransaction().commit();
			result = true;
		}catch (Exception e) {
			session.getTransaction().rollback();
			throw new ControlException("Ese usuario ya existe en la base da datos, elige otro nombre de usuario");
		}
		
		return result;
	}
	
	public static User getUser(String username) throws ControlException {
		Session session = ConnectionDDBB.getSession();
		User result = (User)session.get(User.class, username);
//		Query query = session.createQuery("FROM com.jacaranda.model.User WHERE username= :username"); //mirar sintaxis
//		query.setParameter("username", username);
//		User result = (User) query.getSingleResult();
		if(result == null) {
			throw new ControlException("No se ha encontrado el usuario en la base de datos");
		}
		return result;
	} 
	
	public static boolean checkUser(String name, String passwd) { //contraseña ya encriptada
		boolean result = false;
		try {
			User u = getUser(name);
			if(u.getPassword().equals(passwd)) {
				result = true;
			}
		}catch(ControlException e) {//si no se encuentra el usuario por el código pasado por parámetro recoge la exception de getUser
			
		}
		return result;
	}

}
