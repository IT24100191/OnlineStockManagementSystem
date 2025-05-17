package com.stockmanagement.controller;

import com.stockmanagement.model.Product;
import com.stockmanagement.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;

@WebServlet("/products")
public class ProductController extends HttpServlet {
    private final ProductService service = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        String sortBy = request.getParameter("sortBy");
        if (sortBy == null || sortBy.isEmpty()) sortBy = "desc";

        String id;

        switch (action) {
            case "update-product":
                id = request.getParameter("id");
                Product product = service.getProductById(id);
                if (product == null) {
                    response.sendRedirect("products");
                    return;
                }
                request.setAttribute("product", product);
                request.getRequestDispatcher("update-product.jsp").forward(request, response);
                break;
            case "list":
                List<Product> products = service.getSortedProducts(sortBy);
                int productCount = service.getProductsCount();

                request.setAttribute("products", products);
                request.setAttribute("productCount", productCount);
                request.setAttribute("sortBy", sortBy);

                request.getRequestDispatcher("list-products.jsp").forward(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        Product product = null;

        switch (action) {
            case "add-product":
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate expDate = LocalDate.parse(request.getParameter("exp-date"), formatter);

                product = new Product(
                        request.getParameter("product-id"),
                        request.getParameter("name"),
                        request.getParameter("category"),
                        Double.parseDouble(request.getParameter("price")),
                        expDate
                );
                service.addProduct(product);
                response.sendRedirect("products");
                return;
            case "delete-product":
                String[] selectedIds = request.getParameterValues("product-ids");
                if (selectedIds != null && selectedIds.length > 0) {
                    service.deleteProductsById(Arrays.asList(selectedIds));
                }
                response.sendRedirect("products");
                return;
            case "update-product":
                DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate expDateUpdate = LocalDate.parse(request.getParameter("exp-date"), formatter2);

                product = new Product(
                        request.getParameter("product-id"),
                        request.getParameter("name"),
                        request.getParameter("category"),
                        Double.parseDouble(request.getParameter("price")),
                        expDateUpdate
                );
                service.updateProduct(product);
                response.sendRedirect("products");
                return;
            default:
                response.sendRedirect("products");
                return;

        }
    }
}
