package Controller;

import DAO.UserDAO;
import Model.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "Login", urlPatterns = "/Login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        for (Users u : UserDAO.getInstance().getAllUser()) {
            if (u.getUsername().equals(username) && u.getPassword().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("user", u);

                int role = u.getRoleId();

                if (role == 1) {
                    response.sendRedirect("admin.jsp");
                } else if (role == 2) {
                    response.sendRedirect("user.jsp");
                } else {
                    request.setAttribute("error", "Tài khoản không có quyền truy cập!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                return;
            }
        }

        request.setAttribute("error", "Sai tài khoản hoặc mật khẩu!");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}