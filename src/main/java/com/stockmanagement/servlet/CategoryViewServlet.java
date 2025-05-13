package com.stockmanagement.servlet;

import com.stockmanagement.model.Category;
import com.stockmanagement.service.CategoryService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CategoryViewServlet", value = "/categories/view")
public class CategoryViewServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Category category = categoryService.getCategoryById(id);

            if (category == null) {
                response.sendRedirect(request.getContextPath() + "/categories");
                return;
            }

            request.setAttribute("category", category);
            request.getRequestDispatcher("/WEB-INF/category/view.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/categories");
        }
    }
}