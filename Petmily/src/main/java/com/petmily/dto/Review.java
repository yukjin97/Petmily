package com.petmily.dto;

public class Review {
	int review_num;
	String review_title;
	int prod_num;
	String review_content;
	String review_rate;
	String review_create_date;
	String review_modified_date;

	public Review() {
	}

	
	
	
	public Review(int review_num, String review_title, int prod_num, String review_content, String review_rate,
			String review_create_date, String review_modified_date) {
		this.review_num = review_num;
		this.review_title = review_title;
		this.prod_num = prod_num;
		this.review_content = review_content;
		this.review_rate = review_rate;
		this.review_create_date = review_create_date;
		this.review_modified_date = review_modified_date;
	}




	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public int getProd_num() {
		return prod_num;
	}

	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_rate() {
		return review_rate;
	}

	public void setReview_rate(String review_rate) {
		this.review_rate = review_rate;
	}

	public String getReview_create_date() {
		return review_create_date;
	}

	public void setReview_create_date(String review_create_date) {
		this.review_create_date = review_create_date;
	}

	public String getReview_modified_date() {
		return review_modified_date;
	}

	public void setReview_modified_date(String review_modified_date) {
		this.review_modified_date = review_modified_date;
	}



}
