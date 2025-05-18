package com.stockmanagement.servlet;

import com.stockmanagement.dao.UserDAO;
import com.stockmanagement.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

// Map servlet to URL pattern /addUser
@WebServlet("/addUser")
public class AddUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        // Retrieve form parameters
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        // Validate input
        if (username != null && password != null && role != null &&
                !username.isEmpty() && !password.isEmpty() && !role.isEmpty()) {

            User user = new User(username, password, role);

            try {
                UserDAO.saveUser(user);
                resp.sendRedirect("viewUsers.jsp");
            } catch (IOException e) {
                // Error while saving user
                req.setAttribute("error", "Error saving user: " + e.getMessage());
                req.getRequestDispatcher("error.jsp").forward(req, resp);
            }

        } else {
            // Missing form fields
            req.setAttribute("error", "All fields are required to add a user.");
            req.getRequestDispatcher("addUser.jsp").forward(req, resp);
        }
    }
}
