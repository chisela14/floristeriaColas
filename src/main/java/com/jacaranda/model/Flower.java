package com.jacaranda.model;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="FLOWER")
public class Flower {
	@Id
	private int code;
	private String name;
	private String description;
	private float price;
	@ManyToOne 
	@JoinColumn(name="color")
	private Color color;
	
	public Flower() {
		
	}

	public Flower(String name, String description, float price, Color color) {
		this.name = name;
		this.description = description;
		this.price = price;
		this.color = color;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public Color getColor() {
		return color;
	}

	public void setColor(Color color) {
		this.color = color;
	}

	public int getCode() {
		return code;
	}

	@Override
	public int hashCode() {
		return Objects.hash(code);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Flower other = (Flower) obj;
		return code == other.code;
	}

	@Override
	public String toString() {
		return code + "<br>" + name + "<br> Descripción: " + description + "<br> Color: " + color.getCode() + "\n Precio: " + price + " €";
	}

	

}
