package com.entity;

public class Review {
	private int reviewID;
	private int bookID;
	private int userID;
	private String comment;
	private int rating;
	
	public int getReviewID() {
		return reviewID;
	}
	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
	}
	public int getBookID() {
		return bookID;
	}
	public void setBookID(int bookID) {
		this.bookID = bookID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	
	public Review(int bookID, int userID, String comment, int rating) {
		this.bookID = bookID;
		this.userID = userID;
		this.comment = comment;
		this.rating = rating;
	}
	
	public Review() {
		
	}
}
