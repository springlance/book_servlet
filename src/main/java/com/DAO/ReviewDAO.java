package com.DAO;

import java.util.List;

import com.entity.Review;

public interface ReviewDAO {
	
	public boolean addReview(Review r);
	
	public List<Review> getReviewsByBookID(int bid);
}
