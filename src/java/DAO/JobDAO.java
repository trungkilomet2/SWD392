package DAO;

import Model.Job;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class JobDAO extends DBContext {

    public void addJob(Job job) {
        String sql = "INSERT INTO Job (recruiterId, categoryId, jobTitle, jobDescription, requirements, location, position, experience, skills, gender, profession, jobType, numberOfSeeker, salary, workingTime, createDate, endDate, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            // recruiterId (nullable)
            if (job.getRecruiterId() == -1) {
                st.setNull(1, Types.INTEGER);
            } else {
                st.setInt(1, job.getRecruiterId());
            }

            if (job.getCategoryId() == -1) {
                st.setNull(2, Types.INTEGER);
            } else {
                st.setInt(2, job.getCategoryId());
            }

            st.setString(3, job.getJobTittle());
            st.setString(4, job.getJobDescription());
            st.setString(5, job.getRequirements());
            st.setString(6, job.getLocation());
            st.setString(7, job.getPosition());
            st.setString(8, job.getExperience());
            st.setString(9, job.getSkills());
            st.setString(10, job.getGender());
            st.setString(11, job.getProfession());
            st.setString(12, job.getJobType());
            st.setInt(13, job.getNumberOfSeeker());
            st.setString(14, job.getSalary());
            st.setString(15, job.getWorkingTime());
            st.setString(16, job.getCreateDate()); // Sử dụng từ controller truyền vào
            st.setString(17, job.getEndDate());
            st.setInt(18, job.getStatus()); // không hard-code 1 nữa

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
