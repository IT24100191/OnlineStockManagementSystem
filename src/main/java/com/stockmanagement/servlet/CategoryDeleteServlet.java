package com.stockmanagement.servlet;

import com.stockmanagement.service.CategoryService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CategoryDeleteServlet", value = "/categories/delete")
public class CategoryDeleteServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            categoryService.deleteCategory(id);
            request.getSession().setAttribute("message", "Category deleted successfully");
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid category ID");
        } catch (IOException e) {
            request.getSession().setAttribute("error", "Error deleting category: " + e.getMessage());
        }
        response.sendRedirect(request.getContextPath() + "/categories");
    }
}