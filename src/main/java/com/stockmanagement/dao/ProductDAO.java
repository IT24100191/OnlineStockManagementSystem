package com.stockmanagement.dao;

import com.stockmanagement.model.Product;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private static final String FILE_PATH = "products.txt";

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<Product>();

        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                products.add(Product.fromFileString(line));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return products;
    }

    public void saveAllProducts(List<Product> products) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Product product : products) {
                bw.write(product.toFileString());
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void addProduct(Product product) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            bw.write(product.toFileString());
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
