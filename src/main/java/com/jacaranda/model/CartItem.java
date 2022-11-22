package com.jacaranda.model;

public class CartItem {
	
	private int itemCode;
	private int quantity;

	public CartItem() {
		
	}

	public CartItem(int itemCode) {
		this.itemCode = itemCode;
		this.quantity = 1;
	}

	public int getItemCode() {
		return itemCode;
	}

	public void setItemCode(int itemCode) {
		this.itemCode = itemCode;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Cart Item [itemCode=" + itemCode + ", quantity=" + quantity + "]";
	}
	
	

}
