package com.stockmanagement.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Product extends AbstractEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    private String name;
    private String category;
    private double price;
    private LocalDate expiryDate;

    public Product(String id, String name, String category, double price, LocalDate expiryDate) {
        super(id);
        this.name = name;
        this.category = category;
        this.price = price;
        this.expiryDate = expiryDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public LocalDate getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(LocalDate expiryDate) {
        this.expiryDate = expiryDate;
    }

    @Override
    public String toFileString() {
        return id + "," + name + "," + category + "," + price + "," + expiryDate;
    }

    public static Product fromFileString(String fileString) {
        String[] parts = fileString.split(",");

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate expiryDate = parts.length > 4 ? LocalDate.parse(parts[4], formatter) : LocalDate.now();

        return new Product(
                parts[0],
                parts[1],
                parts[2],
                Double.parseDouble(parts[3]),
                expiryDate
        );
    }
}
