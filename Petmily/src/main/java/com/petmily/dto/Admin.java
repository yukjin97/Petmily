package com.petmily.dto;

import java.sql.Date;

public class Admin {
	String user_name;
	String user_email;
	String user_totaddress;
	String user_phone;
	String mem_grade;
	Date mem_start_date;
	Date order_date;

	
	public Admin() {
		
	}
	
	public Admin(String user_name, String user_email, String user_totaddress, String user_phone, String mem_grade,
			Date mem_start_date) {
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_totaddress = user_totaddress;
		this.user_phone = user_phone;
		this.mem_grade = mem_grade;
		this.mem_start_date = mem_start_date;
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
