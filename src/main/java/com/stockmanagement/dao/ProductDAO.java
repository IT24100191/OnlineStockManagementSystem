package com.stockmanagement.dao;

import com.stockmanagement.model.Product;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private static final String FILE_PATH = "products.txt";

    private void ensureFileExists() {
        File file = new File(FILE_PATH);
        try {
            if (!file.exists()) {
                file.createNewFile();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Product> getAllProducts() {
        ensureFileExists();
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
        ensureFileExists();
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
        ensureFileExists();
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            bw.write(product.toFileString());
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
