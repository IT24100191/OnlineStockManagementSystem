package model;

import java.time.LocalDate;


public class Product {
    private String id;
    private String name;
    private String category;
    private int quantity;
    private String unit;
    private LocalDate expiryDate;

    public Product(String id, String name, String category, int quantity, String unit, LocalDate expiryDate) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.quantity = quantity;
        this.unit = unit;
        this.expiryDate = expiryDate;
    }

    public String getId() { return id; }
    public String getName() { return name; }
    public String getCategory() { return category; }
    public int getQuantity() { return quantity; }
    public String getUnit() { return unit; }
    public LocalDate getExpiryDate() { return expiryDate; }

    public void setQuantity(int quantity) { this.quantity = quantity; }


}
