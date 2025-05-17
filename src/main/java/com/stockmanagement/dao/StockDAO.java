package dao;

import model.Stock;
import java.io.*;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;

public class StockDAO {
    private static final String FILE_PATH = "C:/temp/products.txt";

    static {
        // Ensure the directory exists
        File dir = new File("C:/temp");
        if (!dir.exists()) {
            dir.mkdirs();
        }
    }

    public static List<Stock> readAll() {
        List<Stock> list = new ArrayList<>();
        File file = new File(FILE_PATH);

        if (!file.exists()) {
            System.out.println("File does not exist: " + FILE_PATH);
            return list; // Return empty list if file doesn't exist
        }

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 6) {
                    try {
                        list.add(new Stock(
                                parts[0].trim(),
                                parts[1].trim(),
                                parts[2].trim(),
                                Integer.parseInt(parts[3].trim()),
                                parts[4].trim(),
                                LocalDate.parse(parts[5].trim())
                        ));
                    } catch (NumberFormatException | DateTimeParseException e) {
                        System.out.println("Invalid data in line: " + line + " - " + e.getMessage());
                    }
                } else {
                    System.out.println("Invalid line format: " + line);
                }
            }
        } catch (IOException e) {
            System.out.println("Error reading file " + FILE_PATH + ": " + e.getMessage());
        }
        return list;
    }

    public static void addProduct(Stock p) {
        if (p == null || getById(p.getId()) != null) return; // Prevent null or duplicate products

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            bw.write(String.join(",",
                    p.getId(), p.getName(), p.getCategory(),
                    String.valueOf(p.getQuantity()), p.getUnit(), p.getExpiryDate().toString()));
            bw.newLine();
        } catch (IOException e) {
            System.out.println("Error adding product: " + e.getMessage());
        }
    }

    public static Stock getById(String id) {
        if (id == null) return null;
        for (Stock p : readAll()) {
            if (p.getId().equals(id)) return p;
        }
        return null;
    }

    public static void updateQuantity(String id, int soldQty) {
        if (id == null || soldQty < 0) return;
        List<Stock> products = readAll();
        for (Stock p : products) {
            if (p.getId().equals(id)) {
                int newQty = p.getQuantity() - soldQty;
                if (newQty >= 0) p.setQuantity(newQty);
                overwrite(products);
                break;
            }
        }
    }

    public static void deleteProduct(String id) {
        if (id == null) return;
        List<Stock> products = readAll();
        products.removeIf(p -> p.getId().equals(id));
        overwrite(products);
    }

    public static void changeQuantity(String id, int newQty) {
        if (id == null || newQty < 0) return;
        List<Stock> products = readAll();
        for (Stock p : products) {
            if (p.getId().equals(id)) {
                p.setQuantity(newQty);
                break;
            }
        }
        overwrite(products);
    }

    private static void overwrite(List<Stock> products) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, false))) {
            for (Stock p : products) {
                if (p != null) {
                    bw.write(String.join(",",
                            p.getId(), p.getName(), p.getCategory(),
                            String.valueOf(p.getQuantity()), p.getUnit(), p.getExpiryDate().toString()));
                    bw.newLine();
                }
            }
        } catch (IOException e) {
            System.out.println("Error overwriting file: " + e.getMessage());
        }
    }
}