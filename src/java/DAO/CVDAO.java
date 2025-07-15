
package DAO;

import Model.CV;
import Model.JobSeeker;
import java.io.InputStream;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


public class CVDAO extends DBContext{
    
    private static CVDAO instance;

    public static CVDAO getInstance() {
        if (instance == null) {
            instance = new CVDAO();
        }
        return instance;
    }
    
   public List<CV> getAllCV() {

        List<CV> list = new ArrayList<>();
        String sql = "Select * From CV";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                  CV civi = new CV(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getBytes(4));
                list.add(civi);
            }
        } catch (Exception e) {
        }
        return list;
    }
   
   public List<CV> getJobSeekerBySeekerId(int id) {

        List<CV> list = new ArrayList<>();
        String sql = "Select * From CV Where seekerId = " + id + "and status = 0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                  CV civi = new CV(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getBytes(4));
                list.add(civi);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
       public List<CV> getAllCVsByUserId(int  userId) {
        List<CV> cvList = new ArrayList<>();
        String query = "select c.cvId,c.cvLink,c.cvStatus, c.seekerId\n" +
                "from JobSeeker j\n" +
                "join Users u on u.userId = j.userId\n" +
                "join CV c on c.seekerId = j.seekerId\n" +
                "where u.userId = ?";

        try {
            Connection con = new DBContext().connection;
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CV cv = new CV();
                cv.setCvId(rs.getInt("cvId"));
                cv.setSeekerId(rs.getInt("seekerId"));
                cv.setCvStatus(rs.getInt("cvStatus"));
                cv.setCvLink(rs.getBytes("cvLink"));
                cvList.add(cv);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
//            try {
//                if (rs != null) rs.close();
//                if (ps != null) ps.close();
//                if (con != null) con.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
        }
        return cvList;
    }

    public boolean saveCV(int userId, String cvName, InputStream inputStream) {
        String query = "INSERT INTO CV (cvStatus, cvLink, seekerId) " +
                "SELECT ?, ?, j.seekerId " +
                "FROM JobSeeker j " +
                "JOIN Users u ON u.userId = j.userId " +
                "WHERE u.userId = ?";
        boolean isSaved = false;

        try (Connection con = new DBContext().connection;
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, cvName);
            ps.setBlob(2, inputStream);
            ps.setInt(3, userId);

            // Execute the query
            int row = ps.executeUpdate();
            if (row > 0) {
                isSaved = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isSaved;
    }
    public boolean isCVStatusExists(int userId, String cvStatus) {
        String query = "SELECT COUNT(*) FROM CV c " +
                "JOIN JobSeeker j ON c.seekerId = j.seekerId " +
                "JOIN Users u ON j.userId = u.userId " +
                "WHERE u.userId = ? AND c.cvStatus = ?";
        boolean exists = false;

        try (Connection con = new DBContext().connection;
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, userId);
            ps.setString(2, cvStatus);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    exists = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return exists;
    }
    
}
