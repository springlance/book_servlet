package com.DAO;

import java.util.List;

import com.entity.Cart;

public interface CartDAO {
	
	public boolean addCart(Cart c);
	
	public List<Cart> getBookByUser(int userId);
	
	public boolean deleteBook(int bid, int uid);
	
	public Cart getCartByBookAndUser(int bid, int uid);
	
	public boolean updateCart(Cart c);
	
	public boolean addCartWithQuantity(Cart c);
	
	public boolean cancelOrderByUser(int uid);
}
