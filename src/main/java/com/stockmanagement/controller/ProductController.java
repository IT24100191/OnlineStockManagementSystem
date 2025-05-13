package com.stockmanagement.controller;

import com.stockmanagement.model.Product;
import com.stockmanagement.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductController extends HttpServlet {
    private final ProductService service = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        String sortBy = request.getParameter("sortBy");
        if (sortBy == null || sortBy.isEmpty()) sortBy = "id";


        switch (action) {
            case "list":
                List<Product> products = service.getSortedProducts(sortBy);
                request.setAttribute("products", products);
                request.setAttribute("sortBy", sortBy);
                request.getRequestDispatcher("list-products.jsp").forward(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add-product":
                Product product = new Product(
                        request.getParameter("product-id"),
                        request.getParameter("name"),
                        request.getParameter("category"),
                        Double.parseDouble(request.getParameter("price")),
                        Integer.parseInt(request.getParameter("quantity")),
                        Integer.parseInt(request.getParameter("stock-alert-limit"))
                );
                service.addProduct(product);
                break;
            default:
                response.sendRedirect("products");
                break;
        }
        response.sendRedirect("products");

    }
}
