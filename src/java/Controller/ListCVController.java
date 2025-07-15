package com.example.job_seeker_system.controller.seeker_controller;

import DAO.CVDAO;



import Model.CV;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/listcv")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 16177215,
        maxRequestSize = 1024 * 1024 * 50
)
public class ListCVController extends HttpServlet {

    private CVDAO cvDAO = new CVDAO(); // ✅ Đặt ở đây — ngoài tất cả các method

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        List<CV> listCv = cvDAO.getAllCVsByUserId(userId);
        request.setAttribute("ListCV", listCv);
        request.getRequestDispatcher("/views/seeker_views/ListCV.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        String cvName = request.getParameter("cvName");
        Part filePart = request.getPart("file");

        if (filePart != null && filePart.getSize() > 0 && cvName != null && !cvName.isEmpty()) {
            if (cvDAO.isCVStatusExists(userId, cvName)) {
                request.setAttribute("errorMessage", "Tên CV đã tồn tại, vui lòng chọn tên khác.");
                request.getRequestDispatcher("/views/seeker_views/ListCV.jsp").forward(request, response);
            } else {
                try (InputStream inputStream = filePart.getInputStream()) {
                    boolean isSaved = cvDAO.saveCV(userId, cvName, inputStream);
                    if (isSaved) {
                        response.sendRedirect("listcv");
                    } else {
                        request.setAttribute("errorMessage", "Không thể lưu CV.");
                        request.getRequestDispatcher("/views/seeker_views/ListCV.jsp").forward(request, response);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("errorMessage", "Đã xảy ra lỗi khi lưu CV.");
                    request.getRequestDispatcher("/views/seeker_views/ListCV.jsp").forward(request, response);
                }
            }
        } else {
            request.setAttribute("errorMessage", "Vui lòng chọn file và nhập tên CV.");
            request.getRequestDispatcher("/views/seeker_views/ListCV.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "ListCVController handles listing and uploading CVs";
    }
}
