package com.jacaranda.model;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@IdClass(PurchaseId.class)
public class Purchase {
	
	@Id
	@ManyToOne
	@JoinColumn(
			name="username",
			insertable=false, updatable = false
			)
	private User user;
	@Id
	@ManyToOne
	@JoinColumn(
			name="flower_code",
			insertable=false, updatable = false
			)
	private Flower flower;
	private int quantity;
	private float price;
	@Id
	@ManyToOne
	@JoinColumn(
			name="date",
			insertable=false, updatable = false
			)
	private LocalDateTime date;
	

	public Purchase() {
		
	}

	public Purchase(User user, Flower flower, LocalDateTime date, int quantity, float price) {
		this.user = user;
		this.flower = flower;
		this.date = date;
		this.quantity = quantity;
		this.price = price;
	}

	public User getUsername() {
		return user;
	}

	public void setUsername(User user) {
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
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
		Purchase other = (Purchase) obj;
		return Objects.equals(date, other.date) && Objects.equals(flower, other.flower)
				&& Objects.equals(user, other.user);
	}

	@Override
	public String toString() {
		return "Purchase [username=" + user + ", flower=" + flower + ", date=" + date + ", quantity=" + quantity
				+ ", price=" + price + "]";
	}
	

}
