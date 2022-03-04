package com.petmily.dto;

public class User {
	String user_id;
	String user_pwd;
	String user_name;
	String user_nickname;
	String user_email;
	String user_address1;
	String user_address2;
	String user_zipcode;
	String user_totaddress;
	String user_birth;
	String user_phone;
	String user_type;

	
	public User() {}

	
	
	
	public User(String user_id, String user_pwd, String user_name, String user_nickname, String user_email,
			String user_address1, String user_address2, String user_zipcode, String user_totaddress, String user_birth,
			String user_phone, String user_type) {
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_nickname = user_nickname;
		this.user_email = user_email;
		this.user_address1 = user_address1;
		this.user_address2 = user_address2;
		this.user_zipcode = user_zipcode;
		this.user_totaddress = user_totaddress;
		this.user_birth = user_birth;
		this.user_phone = user_phone;
		this.user_type = user_type;

	}



	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_address1() {
		return user_address1;
	}

	public void setUser_address1(String user_address1) {
		this.user_address1 = user_address1;
	}

	public String getUser_address2() {
		return user_address2;
	}

	public void setUser_address2(String user_address2) {
		this.user_address2 = user_address2;
	}

	public String getUser_zipcode() {
		return user_zipcode;
	}

	public void setUser_zipcode(String user_zipcode) {
		this.user_zipcode = user_zipcode;
	}

	public String getUser_totaddress() {
		return user_totaddress;
	}

	public void setUser_totaddress(String user_totaddress) {
		this.user_totaddress = user_totaddress;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

}
