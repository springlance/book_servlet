package com.DAO;

import com.entity.User;

public interface UserDAO {
	public boolean userRegister(User us);
	
	public User login(String email, String password);
	
	public User getUserByID(int id);
	
	public boolean checkUserExists(String name);
}
