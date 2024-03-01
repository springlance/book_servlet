package com.entity;

public class BookDtls {
	private int bookId;
	private String bookName;
	private String author;
	private String description;
	private String releaseDate;
	private int pageNumber;
	private String category;
	private String photo;
	private String email;
	private String price;
	
	public BookDtls() {
		super();
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}



	public BookDtls(String bookName, String author, String description, String releaseDate, int pageNumber,
			String category, String photo, String email, String price) {
		this.bookName = bookName;
		this.author = author;
		this.description = description;
		this.releaseDate = releaseDate;
		this.pageNumber = pageNumber;
		this.category = category;
		this.photo = photo;
		this.email = email;
		this.price = price;
	}

	@Override
	public String toString() {
		return "BookDtls [bookId=" + bookId + ", bookName=" + bookName + ", author=" + author + ", description="
				+ description + ", releaseDate=" + releaseDate + ", pageNumber=" + pageNumber + ", category=" + category
				+ ", photo=" + photo + ", email=" + email + ", price=" + price + "]";
	}
}
