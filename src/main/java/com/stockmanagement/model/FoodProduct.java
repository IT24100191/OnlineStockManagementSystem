package com.stockmanagement.model;

public class FoodProduct extends Product{
    private String expiryDate;
    public FoodProduct() {
        super();
    }
    public FoodProduct(int id,String name, double price, int quantity, String expiryDate) {
        super(id,name,price,quantity);
        this.expiryDate = expiryDate;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }
    @Override
    public String toString() {
        return super.toString() + " Expiry Date: "+expiryDate;

    }
    public static FoodProduct fromString(String line) {
        String[] parts = line.split(",");
        return new FoodProduct(
                Integer.parseInt(parts[0]),
                parts[1],
                Double.parseDouble(parts[2]),
                Integer.parseInt(parts[3]),
                parts.length > 4 ? parts[4] :"N/A"
        );

    }
}
