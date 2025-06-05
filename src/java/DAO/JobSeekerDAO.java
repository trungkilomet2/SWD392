/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.JobSeeker;
import Model.Users;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class JobSeekerDAO extends DBContext {

    private static JobSeekerDAO instance;

    public static JobSeekerDAO getInstance() {
        if (instance == null) {
            instance = new JobSeekerDAO();
        }
        return instance;
    }

    public List<JobSeeker> getAllJobSeeker() {

        List<JobSeeker> list = new ArrayList<>();
        String sql = "Select * From JobSeeker";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                JobSeeker jobseek = new JobSeeker(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getString(9));
                list.add(jobseek);
            }
        } catch (Exception e) {
        }
        return list;
    }

}
