package com.stockmanagement.servlet;

import com.stockmanagement.model.Category;
import com.stockmanagement.service.CategoryService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CategoryAddServlet", value = "/categories/add")
public class CategoryAddServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/category/add.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");

        if (name == null || name.trim().isEmpty()){
            request.setAttribute("error", "Category name is required");
            request.getRequestDispatcher("/WEB-INF/category/add.jsp").forward(request, response);
            return;
        }

        try {
            Category category = new Category();
            category.setName(name.trim());
            category.setDescription(description != null ? description.trim() : null);
            categoryService.addCategory(category);

            request.getSession().setAttribute("message", "Category added successfully!");
            response.sendRedirect(request.getContextPath() + "/categories");
        } catch (IOException e) {
            request.setAttribute("error", "Error saving category: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/category/add.jsp").forward(request, response);
        }
    }
}