package com.jacaranda.model;

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
	private User username;

	public Purchase() {
		// TODO Auto-generated constructor stub
	}

}
