
package DAO;

import Model.CV;
import Model.JobSeeker;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


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
    
    
}
