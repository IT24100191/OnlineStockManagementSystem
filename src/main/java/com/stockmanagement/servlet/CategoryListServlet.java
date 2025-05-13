//package com.stockmanagement.servlet;
//
//import com.stockmanagement.model.Category;
//import com.stockmanagement.service.CategoryService;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet(name = "CategoryListServlet", value = "/categories")
//public class CategoryListServlet extends HttpServlet {
//    private final CategoryService categoryService = new CategoryService();
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        if (request.getSession().getAttribute("message") != null) {
//            request.setAttribute("message", request.getSession().getAttribute("message"));
//            request.getSession().removeAttribute("message");
//        }
//
//        if (request.getSession().getAttribute("error") != null){
//            request.setAttribute("error", request.getSession().getAttribute("error"));
//            request.getSession().removeAttribute("error");
//        }
//
//        String searchQuery = request.getParameter("search");
//        List<Category> categories;
//
//        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
//            categories = categoryService.searchCategories(searchQuery);
//            request.setAttribute("search", searchQuery);
//        } else {
//            categories = categoryService.getAllCategories();
//        }
//
//        request.setAttribute("categories", categories);
//        request.getRequestDispatcher("/WEB-INF/category/list.jsp").forward(request, response);
//    }
//}
