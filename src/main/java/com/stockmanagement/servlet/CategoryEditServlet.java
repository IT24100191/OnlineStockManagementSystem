package com.stockmanagement.servlet;

import com.stockmanagement.model.Category;
import com.stockmanagement.service.CategoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CategoryEditServlet", value = "/categories/edit")
public class CategoryEditServlet extends HttpServlet{
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Category category = categoryService.getCategoryById(id);

            if (category != null) {
                request.setAttribute("category", category);
                request.getRequestDispatcher("/WEB-INF/category/edit.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/categories?error=Category+not+found");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/categories?error=Invalid+category+ID");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");

            if (name == null || name.trim().isEmpty()) {
                request.setAttribute("error", "Category name is required");
                request.setAttribute("category", new Category(id, name, description));
                request.getRequestDispatcher("/WEB-INF/category/edit.jsp").forward(request, response);
                return;
            }

            Category category = new Category(id, name.trim(), description != null ? description.trim() : null);
            categoryService.updateCategory(category);
            response.sendRedirect(request.getContextPath() + "/categories/view?id=" + id);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/categories");
        } catch (IOException e) {
            request.setAttribute("error", "Error updating category: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/category/edit.jsp").forward(request, response);
        }
    }
}
