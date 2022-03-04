package com.petmily.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Product {
	int prod_num;
	String prod_img;
	String prod_title;
	String prod_category;
	String prod_name;
	int prod_price;
	int prod_solo;
	int prod_silver;
	int prod_gold;
	Date prod_create_date;
	Date prod_update_date;
	Date prod_modified_date;
	int prod_view_cnt;
	String prod_content;
	int remain_amount;
	MultipartFile file;

	public Product() {
	}

	public Product(int prod_num, String prod_img, String prod_title, String prod_category, String prod_name,
			int prod_price, int prod_solo, int prod_silver, int prod_gold, Date prod_create_date, Date prod_update_date,
			Date prod_modified_date, int prod_view_cnt, String prod_content, int remain_amount) {
		this.prod_num = prod_num;
		this.prod_img = prod_img;
		this.prod_title = prod_title;
		this.prod_category = prod_category;
		this.prod_name = prod_name;
		this.prod_price = prod_price;
		this.prod_solo = prod_solo;
		this.prod_silver = prod_silver;
		this.prod_gold = prod_gold;
		this.prod_create_date = prod_create_date;
		this.prod_update_date = prod_update_date;
		this.prod_modified_date = prod_modified_date;
		this.prod_view_cnt = prod_view_cnt;
		this.prod_content = prod_content;
		this.remain_amount = remain_amount;
	}

	public int getProd_num() {
		return prod_num;
	}

	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}

	public String getProd_img() {
		return prod_img;
	}

	public void setProd_img(String prod_img) {
		this.prod_img = prod_img;
	}

	public String getProd_title() {
		return prod_title;
	}

	public void setProd_title(String prod_title) {
		this.prod_title = prod_title;
	}

	public String getProd_category() {
		return prod_category;
	}

	public void setProd_category(String prod_category) {
		this.prod_category = prod_category;
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

	public int getProd_solo() {
		return prod_solo;
	}

	public void setProd_solo(int prod_solo) {
		this.prod_solo = prod_solo;
	}

	public int getProd_silver() {
		return prod_silver;
	}

	public void setProd_silver(int prod_silver) {
		this.prod_silver = prod_silver;
	}

	public int getProd_gold() {
		return prod_gold;
	}

	public void setProd_gold(int prod_gold) {
		this.prod_gold = prod_gold;
	}

	public Date getProd_create_date() {
		return prod_create_date;
	}

	public void setProd_create_date(Date prod_create_date) {
		this.prod_create_date = prod_create_date;
	}

	public Date getProd_update_date() {
		return prod_update_date;
	}

	public void setProd_update_date(Date prod_update_date) {
		this.prod_update_date = prod_update_date;
	}

	public Date getProd_modified_date() {
		return prod_modified_date;
	}

	public void setProd_modified_date(Date prod_modified_date) {
		this.prod_modified_date = prod_modified_date;
	}

	public int getProd_view_cnt() {
		return prod_view_cnt;
	}

	public void setProd_view_cnt(int prod_view_cnt) {
		this.prod_view_cnt = prod_view_cnt;
	}

	public String getProd_content() {
		return prod_content;
	}

	public void setProd_content(String prod_content) {
		this.prod_content = prod_content;
	}

	public int getRemain_amount() {
		return remain_amount;
	}

	public void setRemain_amount(int remain_amount) {
		this.remain_amount = remain_amount;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

}