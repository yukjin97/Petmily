package com.petmily.dto;

import java.sql.Date;

public class Order {
	int prod_num;
	int order_count;
	int order_num;
	String user_id;
	String order_status;
	Date order_date;
	String order_address;
	
	public Order() {
	}

	public Order(int prod_num, int order_count, int order_num, String user_id, String order_status,
			Date order_date, String order_address) {	
		this.prod_num = prod_num;
		this.order_count = order_count;
		this.order_num = order_num;
		this.user_id = user_id;
		this.order_status = order_status;
		this.order_date = order_date;
		this.order_address = order_address;
	}

	
	public String getOrder_address() {
		return order_address;
	}

	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}

	public int getProd_num() {
		return prod_num;
	}

	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}

	public int getOrder_count() {
		return order_count;
	}

	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

}
