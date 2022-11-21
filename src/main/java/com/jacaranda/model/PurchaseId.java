package com.jacaranda.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class PurchaseId implements Serializable{
	
//https://vladmihalcea.com/the-best-way-to-map-a-many-to-many-association-with-extra-columns-when-using-jpa-and-hibernate/

	private static final long serialVersionUID = 3556125921316204632L;
	
	@Column(name="username")
	private String userId;
	@Column(name="flower_code")
	private int flowerId;
	@Column(name="date")
	private LocalDate dateId;

	public PurchaseId() {
		
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getFlowerId() {
		return flowerId;
	}

	public void setFlowerId(int flowerId) {
		this.flowerId = flowerId;
	}

	public LocalDate getDateId() {
		return dateId;
	}

	public void setDateId(LocalDate dateId) {
		this.dateId = dateId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(dateId, flowerId, userId);
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
		return Objects.equals(dateId, other.dateId) && flowerId == other.flowerId && Objects.equals(userId, other.userId);
	}
	

	

	



	
	

}
