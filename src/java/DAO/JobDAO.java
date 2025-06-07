package DAO;

import Model.Job;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JobDAO extends DBContext {
    private static final Logger logger = Logger.getLogger(JobDAO.class.getName());
    private static JobDAO instance;

    private JobDAO() {
        // Private constructor for singleton
    }

    public static synchronized JobDAO getInstance() {
        if (instance == null) {
            instance = new JobDAO();
        }
        return instance;
    }

    public List<Job> getAllActiveJobs() throws SQLException {
        List<Job> jobs = new ArrayList<>();
        String sql = "SELECT j.jobId, j.recruiterId, j.categoryId, j.jobTitle, "
                + "j.jobDescription, j.requirements, j.location, j.position, "
                + "j.experience, j.skills, j.gender, j.jobType, j.numberOfSeeker, "
                + "j.salary, j.workingTime, j.createDate, j.endDate, j.status, "
                + "c.companyName, c.logoCompany "
                + "FROM Job j "
                + "JOIN Recruiter r ON j.recruiterId = r.recruiterId "
                + "JOIN Company c ON r.companyId = c.companyId "
                + "WHERE c.statusCompany = 1 "
                + "ORDER BY j.createDate DESC";

        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                jobs.add(mapResultSetToJob(rs));
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error retrieving active jobs", e);
            throw e;
        }
        return jobs;
    }

    public boolean changeJobStatus(int jobId, int status) throws SQLException {
        String sql = "UPDATE Job SET status = ? WHERE jobId = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, status);
            stmt.setInt(2, jobId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error updating job status for jobId: " + jobId, e);
            throw e;
        }
    }

    private Job mapResultSetToJob(ResultSet rs) throws SQLException {
        Job job = new Job();
        job.setJobId(rs.getInt("jobId"));
        job.setRecruiterId(rs.getInt("recruiterId"));
        job.setCategoryId(rs.getInt("categoryId"));
        job.setJobTitle(rs.getString("jobTitle"));
        job.setJobDescription(rs.getString("jobDescription"));
        job.setRequirements(rs.getString("requirements"));
        job.setLocation(rs.getString("location"));
        job.setPosition(rs.getString("position"));
        job.setExperience(rs.getString("experience"));
        job.setSkills(rs.getString("skills"));
        job.setGender(rs.getString("gender"));
        job.setJobType(rs.getString("jobType"));
        job.setNumberOfSeeker(rs.getInt("numberOfSeeker"));
        job.setSalary(rs.getString("salary"));
        job.setWorkingTime(rs.getString("workingTime"));
        job.setCreateDate(rs.getString("createDate"));
        job.setEndDate(rs.getString("endDate"));
        job.setStatus(rs.getInt("status"));
        job.setCompanyName(rs.getString("companyName"));
        job.setCompanyLogo(rs.getString("logoCompany"));
        return job;
    }
}