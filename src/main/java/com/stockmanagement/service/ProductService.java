package com.stockmanagement.service;

import com.stockmanagement.dao.ProductDAO;
import com.stockmanagement.model.Product;
import com.stockmanagement.util.ProductSorter;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class ProductService implements IProductService {
    private final ProductDAO dao = new ProductDAO();

    @Override
    public List<Product> getSortedProducts(String sortBy) {
        List<Product> products = dao.getAllProducts();
        Comparator<Product> comparator = getComparator(sortBy);
        ProductSorter.mergeSort(products, comparator);
        return products;
    }

    private Comparator<Product> getComparator(String sortBy) {
        Comparator<Product> comparator;
        switch (sortBy) {
            case "asc":
                comparator = Comparator.comparing(Product::getExpiryDate);
                break;
            case "desc":
                comparator = Comparator.comparing(Product::getExpiryDate).reversed();
                break;
            default:
                comparator = Comparator.comparing(Product::getId);
                break;
        }
        return comparator;
    }

    @Override
    public void addProduct(Product product) {
        dao.addProduct(product);
    }

    @Override
    public void deleteProductsById(List<String> ids) {
        List<Product> products = dao.getAllProducts();
        products.removeIf(product -> ids.contains(product.getId()));
        dao.saveAllProducts(products);
    }

    @Override
    public Product getProductById(String id) {
        for (Product product : dao.getAllProducts()) {
            if (product.getId().equals(id)) {
                return product;
            }
        }
        return null;
    }

    @Override
    public void updateProduct(Product product) {
        List<Product> products = dao.getAllProducts();
        for (Product product1 : products) {
            if (product1.getId().equals(product.getId())) {
                products.set(products.indexOf(product1), product);
                dao.saveAllProducts(products);
                break;
            }
        }
    }

    @Override
    public int getProductsCount() {
        return dao.getAllProducts().size();
    }


}
