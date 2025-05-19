package com.stockmanagement.model;

import java.time.LocalDate;

public class Stock extends Item {
    private int quantity;
    private String unit;
    private LocalDate expiryDate;

    public Stock(String id, String name, String category, int quantity, String unit, LocalDate expiryDate) {
        super(id, name, category);
        this.quantity = quantity;
        this.unit = unit;
        this.expiryDate = expiryDate;
    }


    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public String getUnit() { return unit; }
    public void setUnit(String unit) { this.unit = unit; }

    public LocalDate getExpiryDate() { return expiryDate; }
    public void setExpiryDate(LocalDate expiryDate) { this.expiryDate = expiryDate; }
}
