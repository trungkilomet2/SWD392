package Controller;

import DAO.JobDAO;
import Model.Job;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class JobController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        JobDAO jobDAO = JobDAO.getInstance();

        try {
            if (action == null || action.equals("list")) {
                // Get all active jobs
                List<Job> jobs = jobDAO.getAllActiveJobs();
                request.setAttribute("jobs", jobs);
                request.getRequestDispatcher("jobList.jsp").forward(request, response);
            } else if (action.equals("changeStatus")) {
                // Change job status
                int jobId = Integer.parseInt(request.getParameter("jobId"));
                int currentStatus = Integer.parseInt(request.getParameter("status"));
                int newStatus = currentStatus == 1 ? 0 : 1;

                boolean success = jobDAO.changeJobStatus(jobId, newStatus);
                if (success) {
                    response.sendRedirect("JobController?action=list");
                } else {
                    request.setAttribute("error", "Failed to change job status");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            }
        } catch (SQLException | NumberFormatException e) {
            request.setAttribute("error", "Error processing request: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Job Controller with basic functionalities";
    }
}