package com.stockmanagement.model;

public class ElectronicProduct extends Product {
    private int warrantyMonths;

    public ElectronicProduct() {
        super();
    }

    public ElectronicProduct(int id, String name, double price, int quantity, int warrantyMonths) {
        super(id, name, price, quantity);
        this.warrantyMonths = warrantyMonths;
    }

    public int getWarrantyMonths() {
        return warrantyMonths;
    }

    public void setWarrantyMonths(int warrantyMonths) {
        this.warrantyMonths = warrantyMonths;
    }

    @Override
    public String toString() {
        return super.toString() + " Warranty Months: " + warrantyMonths;
    }

    public static ElectronicProduct fromString(String line) {
        String[] parts = line.split(",");
        return new ElectronicProduct(
                Integer.parseInt(parts[0]),
                parts[1],
                Double.parseDouble(parts[2]),
                Integer.parseInt(parts[3]),
                parts.length > 4 ? Integer.parseInt(parts[4]) : 0
        );

    }
}