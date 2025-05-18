package com.stockmanagement.servlet;

import com.stockmanagement.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

// Map the servlet to a URL
@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Get the username parameter from the request
        String username = req.getParameter("username");

        if (username != null && !username.trim().isEmpty()) {
            try {
                // Delete the user using DAO
                UserDAO.deleteUser(username);
            } catch (IOException e) {
                // Handle file I/O errors
                req.setAttribute("error", "Error deleting user: " + e.getMessage());
                req.getRequestDispatcher("error.jsp").forward(req, resp);
                return;
            }
        } else {
            // Handle missing or invalid username
            req.setAttribute("error", "Invalid or missing username.");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
            return;
        }

        // Redirect to the user view page on successful deletion
        resp.sendRedirect("viewUsers.jsp");
    }
}
