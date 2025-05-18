package com.stockmanagement.servlet;

import com.stockmanagement.dao.UserDAO;
import com.stockmanagement.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Set request encoding and response content type
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        // Get form parameters
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        // Validate input
        if (username != null && password != null && role != null &&
                !username.trim().isEmpty() && !password.trim().isEmpty() && !role.trim().isEmpty()) {

            // Create updated user object
            User updatedUser = new User(username.trim(), password.trim(), role.trim());

            try {
                // Update user via DAO
                UserDAO.updateUser(updatedUser);

                // Redirect to user list
                resp.sendRedirect("viewUsers.jsp");
            } catch (IOException e) {
                // Log and forward to error page if update fails
                req.setAttribute("error", "Failed to update user: " + e.getMessage());
                req.getRequestDispatcher("error.jsp").forward(req, resp);
            }
        } else {
            // Input validation failure
            req.setAttribute("error", "All fields are required to update the user.");
            req.getRequestDispatcher("editUser.jsp").forward(req, resp);
        }
    }
}
