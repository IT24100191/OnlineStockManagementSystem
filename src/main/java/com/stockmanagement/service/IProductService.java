package com.stockmanagement.service;

import com.stockmanagement.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getSortedProducts(String sortBy);
    void addProduct(Product product);
    void deleteProductsById(List<String> ids);
    Product getProductById(String id);
    void updateProduct(Product product);
    int getProductsCount();
}
