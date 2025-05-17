package com.stockmanagement.model;


    public class Sale {
        private int id;
        private String productName;
        private int quantity;
        private double price;

        public Sale(int id, String productName, int quantity, double price) {
            this.id = id;
            this.productName = productName;
            this.quantity = quantity;
            this.price = price;
        }

        public int getId() {
            return id;
        }

        public String getProductName() {
            return productName;
        }

        public int getQuantity() {
            return quantity;
        }

        public double getPrice() {
            return price;
        }

        public void setProductName(String productName) {
            this.productName = productName;
        }

        public void setQuantity(int quantity) {
            this.quantity = quantity;
        }

        public void setPrice(double price) {
            this.price = price;
        }
        public String toFileString() {
            return id + "," + productName + "," + quantity + "," + price;
        }

        // Parse Sale object from file line
        public static Sale fromFileString(String line) {
            String[] parts = line.split(",");
            int id = Integer.parseInt(parts[0]);
            String productName = parts[1];
            int quantity = Integer.parseInt(parts[2]);
            double price = Double.parseDouble(parts[3]);
            return new Sale(id, productName, quantity, price);
        }
    }


