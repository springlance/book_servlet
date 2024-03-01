package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.User;

public class UserDAOImpl implements UserDAO{
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean userRegister(User us) {
		boolean  f = false;
		try {
			String sql = "INSERT INTO user(name, email, phone, password) VALUES(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone());
			ps.setString(4, us.getPassword());
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}

	@Override
	public User login(String email, String password) {
		User us = null;
		try {
			String sql="SELECT * FROM user WHERE email=? AND password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhone(rs.getString(4));
				us.setPassword(rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
	}

	@Override
	public User getUserByID(int id) {
		User user = null;
	    try {
	        String query = "SELECT * FROM user WHERE id = ?";
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            user = new User();
	            user.setId(rs.getInt("id"));
	            user.setName(rs.getString("name"));
	            user.setEmail(rs.getString("email"));
	            user.setPassword(rs.getString("password"));
	        }
	        rs.close();
	        ps.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return user;
	}

	@Override
	public boolean checkUserExists(String name) {
		try {
        	String sql = "SELECT COUNT(*) FROM user WHERE name=?";
        	PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
	}
	
	
}
