package com.petmily.dto;

import java.sql.Date;

public class Admin {
	String user_id;
	String user_name;
	String user_email;
	String user_totaddress;
	String user_phone;
	String mem_grade;
	Date mem_start_date;
	Date mem_last_date;
	Date order_date;
	int order_count;
	String order_status;
	String prod_name;
	int prod_price;
	int order_num;
	
	

	
	public Admin() {
		
	}
	
	
	public Admin(String user_name, String user_email, String user_totaddress, String user_phone, String mem_grade,
			Date mem_start_date, Date order_date, int order_count, String order_status, String prod_name, int order_num,
			int prod_price, String user_id, Date mem_last_date) {
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_totaddress = user_totaddress;
		this.user_phone = user_phone;
		this.mem_grade = mem_grade;
		this.mem_start_date = mem_start_date;
		this.order_date = order_date;
		this.order_count = order_count;
		this.order_status = order_status;
		this.prod_name = prod_name;
		this.prod_price = prod_price;
		this.order_num = order_num;
		this.user_id = user_id;
		this.mem_last_date = mem_last_date;
	}


	public Date getMem_last_date() {
		return mem_last_date;
	}


	public void setMem_last_date(Date mem_last_date) {
		this.mem_last_date = mem_last_date;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public int getOrder_num() {
		return order_num;
	}


	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}


	public Date getOrder_date() {
		return order_date;
	}


	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}


	public int getOrder_count() {
		return order_count;
	}


	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}


	public String getOrder_status() {
		return order_status;
	}


	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}


	public String getProd_name() {
		return prod_name;
	}


	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}


	public int getProd_price() {
		return prod_price;
	}


	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}


	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_totaddress() {
		return user_totaddress;
	}
	public void setUser_totaddress(String user_totaddress) {
		this.user_totaddress = user_totaddress;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getMem_grade() {
		return mem_grade;
	}
	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
	}
	public Date getMem_start_date() {
		return mem_start_date;
	}
	public void setMem_start_date(Date mem_start_date) {
		this.mem_start_date = mem_start_date;
	}
	
	

}
