/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Users;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Lawliez57
 */
public class UserDAO extends DBContext {

    private static UserDAO instance;

    public static UserDAO getInstance() {
        if (instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }

    public List<Users> getAllUser() {
        List<Users> list = new ArrayList<>();
        String sql = "Select * From Users";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Users u = new Users(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDate(6), rs.getInt(7), rs.getString(8), rs.getString(9),
                        rs.getInt(10));
                list.add(u);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public Users getUserById(int id) {

        String sql = "Select * From Users Where userId = " + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Users u = new Users(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDate(6), rs.getInt(7), rs.getString(8), rs.getString(9),
                        rs.getInt(10));
                return u;
            }

        } catch (Exception e) {
        }

        return null;
    }

    public static void main(String[] args) {

        List<Users> l = UserDAO.getInstance().getAllUser();

        for (Users u : l) {
            System.out.println(u.getUsername());
        }
        
        System.out.println(UserDAO.getInstance().getUserById(1).getUsername());
        
    }

}
