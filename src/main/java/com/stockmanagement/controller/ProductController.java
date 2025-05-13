package com.stockmanagement.controller;

import com.stockmanagement.model.Product;
import com.stockmanagement.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet("/products")
public class ProductController extends HttpServlet {
    private final ProductService service = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        String sortBy = request.getParameter("sortBy");
        if (sortBy == null || sortBy.isEmpty()) sortBy = "id";

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
                request.setAttribute("products", products);
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
                product = new Product(
                        request.getParameter("product-id"),
                        request.getParameter("name"),
                        request.getParameter("category"),
                        Double.parseDouble(request.getParameter("price")),
                        Integer.parseInt(request.getParameter("quantity")),
                        Integer.parseInt(request.getParameter("stock-alert-limit"))
                );
                service.addProduct(product);
                response.sendRedirect("products");
                return;
            case "delete-product":
                String[] selectedIds = request.getParameterValues("product-ids");
                System.out.println(Arrays.toString(selectedIds));
                if (selectedIds != null && selectedIds.length > 0) {
                    service.deleteProductsById(Arrays.asList(selectedIds));
                }
                response.sendRedirect("products");
                return;
            case "update-product":
                product = new Product(
                        request.getParameter("product-id"),
                        request.getParameter("name"),
                        request.getParameter("category"),
                        Double.parseDouble(request.getParameter("price")),
                        Integer.parseInt(request.getParameter("quantity")),
                        Integer.parseInt(request.getParameter("stock-alert-limit"))
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
