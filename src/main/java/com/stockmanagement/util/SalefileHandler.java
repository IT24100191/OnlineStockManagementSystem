package com.stockmanagement.util;

import com.stockmanagement.model.Sale;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class SalefileHandler {
        private static final String FILE_NAME = "D:/InventoryStock/OnlineStockmanagement/sales_data.txt";
        //Saving path



        public static void saveSales(List<Sale> sales) {
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_NAME))) {
                for (Sale sale : sales) {
                    writer.write(sale.toFileString());
                    writer.newLine();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        public static List<Sale> loadSales() {
            List<Sale> sales = new ArrayList<>();
            File file = new File(FILE_NAME);
            if (!file.exists()) {
                return sales;
            }

            try (BufferedReader reader = new BufferedReader(new FileReader(FILE_NAME))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    sales.add(Sale.fromFileString(line));
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            return sales;
        }
    }





