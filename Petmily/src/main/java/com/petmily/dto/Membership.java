package com.petmily.dto;

import java.sql.Date;

public class Membership {
	String user_id;
	String mem_grade;
	Date mem_start_date;
	Date mem_restart_date;
	Date mem_next_date;


	public Membership() {
	}

	public Membership(String user_id, String mem_grade, Date mem_start_date,Date mem_restart_date
	,Date mem_next_date) {
		this.user_id = user_id;
		this.mem_grade = mem_grade;
		this.mem_start_date = mem_start_date;
		this.mem_restart_date = mem_restart_date;
		this.mem_next_date = mem_next_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	
	public Date getMem_restart_date() {
		return mem_restart_date;
	}

	public void setMem_restart_date(Date mem_restart_date) {
		this.mem_restart_date = mem_restart_date;
	}

	public Date getMem_next_date() {
		return mem_next_date;
	}

	public void setMem_next_date(Date mem_next_date) {
		this.mem_next_date = mem_next_date;
	}
}
