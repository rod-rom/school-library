package library.dao;

import library.model.Order;
import library.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public UserDao(Connection con) {
        this.con = con;
    }

    public User userLogin(String email, String password) {
        User user = null;
        try {
            query = "select * from users where email=? and password=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return user;
    }

    public boolean insertUser(User model) {
        boolean result = false;
        try {
            query = "insert into users (id, name, email, pasword) values(?,?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, model.getId());
            pst.setString(2, model.getName());
            pst.setString(3, model.getEmail());
            pst.setString(4, model.getPassword());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
}
