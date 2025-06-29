package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    public void getAllUsers() {
        String sql = "SELECT * FROM Users";  // đổi tên bảng theo database thật của bạn

        try (Connection conn = new DBContext().connection;
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("userId");
                String email = rs.getString("email");
                System.out.println("User ID: " + id + " | Email: " + email);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
