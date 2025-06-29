package Controller;

import DAO.JobDAO;
import Model.Job;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/add-job")
public class AddJobController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            // recruiterId (nullable)
            String recruiterParam = request.getParameter("recruiterId");
            int recruiterId = -1;
            if (recruiterParam != null && !recruiterParam.isEmpty()) {
                recruiterId = Integer.parseInt(recruiterParam);
            }

            // categoryId (nullable)
            String categoryParam = request.getParameter("categoryId");
            int categoryId = -1;
            if (categoryParam != null && !categoryParam.isEmpty()) {
                categoryId = Integer.parseInt(categoryParam);
            }

            String jobTitle = request.getParameter("jobTitle");
            String jobDescription = request.getParameter("jobDescription");
            String requirements = request.getParameter("requirements");
            String location = request.getParameter("location");
            String position = request.getParameter("position");
            String experience = request.getParameter("experience");
            String skills = request.getParameter("skills");
            String gender = request.getParameter("gender");
            String profession = request.getParameter("profession");
            String jobType = request.getParameter("jobType");
            int numberOfSeeker = Integer.parseInt(request.getParameter("numberOfSeeker"));
            String salary = request.getParameter("salary");
            String workingTime = request.getParameter("workingTime");

            LocalDate parsedEndDate = LocalDate.parse(request.getParameter("endDate"));
            String endDate = parsedEndDate.format(DateTimeFormatter.ofPattern("yyyyMMdd"));

            String createDate = request.getParameter("createDate");
            int status = 1;

            Job job = new Job(0, recruiterId, categoryId, jobTitle, jobDescription, requirements,
                    location, position, experience, skills, gender, profession, jobType,
                    numberOfSeeker, salary, workingTime, createDate, endDate, status);

            JobDAO jobDAO = new JobDAO();
            jobDAO.addJob(job);
            request.getRequestDispatcher("success.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
