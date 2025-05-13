package com.stockmanagement.model;

public class Product extends AbstractEntity {
    private String name;
    private String category;
    private double price;
    private int quantity;
    private int stockAlertLimit;

    public Product(String id, String name, String category, double price, int quantity, int stockAlertLimit) {
        super(id);
        this.name = name;
        this.category = category;
        this.price = price;
        this.quantity = quantity;
        this.stockAlertLimit = stockAlertLimit;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStockAlertLimit() {
        return stockAlertLimit;
    }

    public void setStockAlertLimit(int stockAlertLimit) {
        this.stockAlertLimit = stockAlertLimit;
    }

    @Override
    public String toFileString() {
        return id + "," + name + "," + category + "," + price + "," + quantity + "," + stockAlertLimit;
    }

    public static Product fromFileString(String fileString) {
        String[] parts = fileString.split(",");
        return new Product(
                parts[0],
                parts[1],
                parts[2],
                Double.parseDouble(parts[3]),
                Integer.parseInt(parts[4]),
                Integer.parseInt(parts[5])
        );
    }
}
