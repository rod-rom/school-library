package library.dao;

import library.model.Cart;
import library.model.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDao {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public BookDao(Connection con) {
        this.con = con;
    }

    public List<Book> getAllBooks() {
        List<Book> Books = new ArrayList<Book>();
        try {
            query = "select * from Products";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                Book row = new Book();
                row.setId(rs.getInt("id"));
                row.setAuthor(rs.getString("author"));
                row.setTitle(rs.getString("title"));
                row.setIsbn13(rs.getString("isbn13"));
                row.setPages(rs.getInt("pages"));
                row.setPublisher(rs.getString("publisher"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
                Books.add(row);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Books;
    }

    public List<Cart> getCartBooks(ArrayList<Cart> cartList) {
        List<Cart> books = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select * from Products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setId(rs.getInt("id"));
                        row.setAuthor(rs.getString("author"));
                        row.setTitle(rs.getString("title"));
                        row.setPrice(rs.getDouble("price") * item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        books.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return books;
    }

    public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select price from Products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        sum += rs.getDouble("price") * item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }

    public Book getSingleBook(int id) {
        Book row = null;
        try {
            query = "select * from Products where id=? ";

            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                row = new Book();
                row.setId(rs.getInt("id"));
                row.setAuthor(rs.getString("author"));
                row.setTitle(rs.getString("title"));
                row.setIsbn13(rs.getString("isbn13"));
                row.setPages(rs.getInt("pages"));
                row.setPublisher(rs.getString("publisher"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return row;
    }
}
