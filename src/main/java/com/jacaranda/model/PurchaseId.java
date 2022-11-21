package com.jacaranda.model;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

public class PurchaseId implements Serializable{
	
//	https://thorben-janssen.com/hibernate-tip-many-to-many-association-with-additional-attributes/
	private static final long serialVersionUID = -8675233731749410684L; 
	private User user;
	private Flower flower;
	private LocalDateTime date;

	public PurchaseId() {
		
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Flower getFlower() {
		return flower;
	}

	public void setFlower(Flower flower) {
		this.flower = flower;
	}

	public LocalDateTime getDate() {
		return date;
	}

	public void setDate(LocalDateTime date) {
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
