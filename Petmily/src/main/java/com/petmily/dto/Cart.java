package com.petmily.dto;

public class Cart {
	int cart_amount;
	String user_id;
	int prod_num;

	public Cart() {
	}

	public Cart(int cart_amount, String user_id, int prod_num) {
		this.cart_amount = cart_amount;
		this.user_id = user_id;
		this.prod_num = prod_num;
	}

	public int getCart_amount() {
		return cart_amount;
	}

	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getProd_num() {
		return prod_num;
	}

	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}

}
