package com.stockmanagement.model;

public class Product {
    protected int id;
    protected String name;
    protected double price;
    protected int quantity;


    public Product() {
    }
    public Product(int id, String name, double price, int quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
    public static Product fromString(String line) {
        String[] parts = line.split(",");
        return new Product(
                Integer.parseInt(parts[0]),
                parts[1],
                Double.parseDouble(parts[2]),
                Integer.parseInt(parts[3])
        );
    }
    @Override
    public String toString() {
        return id + "," + name + "," + price + "," + quantity;
    }

}
