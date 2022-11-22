package com.jacaranda.model;

import java.util.ArrayList;

public class Cart {
	private ArrayList<CartItem> items;

	public Cart() {
		this.items = new ArrayList<CartItem>();
	}

	public ArrayList<CartItem> getItems() {
		return items;
	}

	public void setItems(ArrayList<CartItem> items) {
		this.items = items;
	}
	

}
