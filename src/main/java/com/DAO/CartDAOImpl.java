package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO {

    private Connection conn;

    public CartDAOImpl(Connection conn) {
        this.conn = conn;
    }



    @Override
    public List<Cart> getBookByUser(int userId) {
        List<Cart> list = new ArrayList<Cart>();
        Cart c = null;
        int totalPrice = 0;

        try {
            String sql = "SELECT * FROM cart where uid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                c = new Cart();
                c.setCid(rs.getInt(1));
                c.setBid(rs.getInt(2));
                c.setUserId(rs.getInt(3));
                c.setBookName(rs.getString(4));
                c.setAuthor(rs.getString(5));
                c.setPrice(rs.getInt(6));
                c.setQuantity(rs.getInt(7));
                c.setTotal(rs.getInt(6)*rs.getInt(7));

                totalPrice = totalPrice + rs.getInt(6)*rs.getInt(7);
                c.setTotalPrice(totalPrice);

                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public Cart getCartByBookAndUser(int bid, int uid) {
        Cart cart = null;
        try {
            String sql = "SELECT * FROM cart WHERE bid=? AND uid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bid);
            ps.setInt(2, uid);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                cart = new Cart();
                cart.setCid(rs.getInt("cid"));
                cart.setBid(rs.getInt("bid"));
                cart.setUserId(rs.getInt("uid"));
                cart.setBookName(rs.getString("bookName"));
                cart.setAuthor(rs.getString("author"));
                cart.setPrice(rs.getInt("price"));
                cart.setQuantity(rs.getInt("quantity"));
                cart.setTotal(rs.getInt("total"));
                cart.setTotalPrice(rs.getInt("total_price"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cart;
    }

    public boolean updateCart(Cart c) {
        boolean updated = false;
        try {
            String sql = "UPDATE cart SET quantity=?, total=?, total_price=? WHERE cid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, c.getQuantity());
            ps.setInt(2, c.getTotal());
            ps.setInt(3, c.getTotalPrice());
            ps.setInt(4, c.getCid());

            int i = ps.executeUpdate();
            if (i == 1) {
                updated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return updated;
    }

    @Override
    public boolean deleteBook(int bid, int uid) {
        boolean f = false;

        try {
            String sql = "DELETE FROM cart where bid=? and uid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bid);
            ps.setInt(2, uid);

            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return f;
    }
    
    public boolean addCartWithQuantity(Cart c) {
        boolean f = false;
        try {
            String sql = "INSERT INTO cart(bid, uid, bookName, author, price, quantity, total, total_price) VALUES(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, c.getBid());
            ps.setInt(2, c.getUserId());
            ps.setString(3, c.getBookName());
            ps.setString(4, c.getAuthor());
            ps.setInt(5, c.getPrice());
            ps.setInt(6, c.getQuantity());
            ps.setInt(7, c.getPrice() * c.getQuantity());
            ps.setInt(8, c.getTotalPrice() + c.getPrice() * c.getQuantity());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean addCart(Cart c) {
        c.setTotal(c.getPrice() * c.getQuantity());
        c.setTotalPrice(c.getTotalPrice() + c.getTotal());

        return addCartWithQuantity(c);
    }



    @Override
    public boolean cancelOrderByUser(int uid) {
        boolean success = false;
        String query = "DELETE FROM cart WHERE uid=?";

        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, uid);

            int i = ps.executeUpdate();
            success = (i > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }

    
}
