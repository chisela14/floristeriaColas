package com.jacaranda.model;

import java.io.Serializable;
import java.util.Objects;

public class PurchaseId implements Serializable{
	

	private static final long serialVersionUID = -8675233731749410684L; //qué es esto????
	private Long user;
	private Long flower;
	private Long date;

	public PurchaseId() {
		
	}

	public Long getUser() {
		return user;
	}

	public void setUser(Long user) {
		this.user = user;
	}

	public Long getFlower() {
		return flower;
	}

	public void setFlower(Long flower) {
		this.flower = flower;
	}

	public Long getDate() {
		return date;
	}

	public void setDate(Long date) {
		this.date = date;
	}

	@Override
	public int hashCode() {
		return Objects.hash(date, flower, user);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PurchaseId other = (PurchaseId) obj;
		return Objects.equals(date, other.date) && Objects.equals(flower, other.flower)
				&& Objects.equals(user, other.user);
	}
	

}
