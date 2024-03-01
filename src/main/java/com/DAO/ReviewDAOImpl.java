package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Review;

public class ReviewDAOImpl implements ReviewDAO{
    private Connection conn;

    public ReviewDAOImpl(Connection conn) {
        this.conn = conn;
    }

	@Override
	public boolean addReview(Review r) {
		boolean f = false;
		try {
			String sql = "INSERT INTO review(bookID, userID, comment, rating) VALUES(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, r.getBookID());
			ps.setInt(2, r.getUserID());
			ps.setString(3, r.getComment());
			ps.setInt(4, r.getRating());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	

	@Override
	public List<Review> getReviewsByBookID(int bid) {

		List<Review> list = new ArrayList<Review>();

		try {
			String sql = "SELECT * FROM review where bookID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bid);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Review r = new Review();
				r.setReviewID(rs.getInt("reviewID"));
				r.setBookID(rs.getInt("bookID"));
				r.setUserID(rs.getInt("userID"));
				r.setComment(rs.getString("comment"));
				r.setRating(rs.getInt("rating"));
				list.add(r);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
    
}
