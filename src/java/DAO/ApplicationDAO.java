/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Application;
import Model.CV;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lawliez57
 */
public class ApplicationDAO extends DBContext{
    
     private static ApplicationDAO instance;

    public static ApplicationDAO getInstance() {
        if (instance == null) {
            instance = new ApplicationDAO();
        }
        return instance;
    }
    
    
    public List<Application> getAllApplication() {

        List<Application> list = new ArrayList<>();
        String sql = "Select * From Application";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                  Application ap = new Application(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5));
                list.add(ap);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    
    
    
}
