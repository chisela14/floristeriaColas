package com.jacaranda.ddbb;

import java.util.ArrayList;

import org.hibernate.Session;

import com.jacaranda.model.Color;

public class ColorControl {

	public static ArrayList<Color> getColors() {
		Session session = ConnectionDDBB.getSession();
		ArrayList<Color> colors = (ArrayList<Color>) session.createQuery("SELECT c FROM com.jacaranda.model.Color c ", Color.class).getResultList();
		return colors;
	}

}
