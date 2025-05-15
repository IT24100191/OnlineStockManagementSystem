package util;

import model.Supplier;
import java.io.*;
import java.util.*;

public class SupplierFileUtil {
    public static List<Supplier> getAllSuppliers(String filePath) {
        List<Supplier> suppliers = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 4) {
                    int id = Integer.parseInt(parts[0]);
                    String name = parts[1];
                    String email = parts[2];
                    String phone = parts[3];
                    suppliers.add(new Supplier(id, name, email, phone));
                }
            }
        } catch (IOException e) {
            // File may not exist yet, that's fine
        }
        return suppliers;
    }

    public static Supplier getSupplierById(int id, String filePath) {
        for (Supplier s : getAllSuppliers(filePath)) {
            if (s.getId() == id) return s;
        }
        return null;
    }

    public static void addSupplier(Supplier supplier, String filePath) {
        List<Supplier> suppliers = getAllSuppliers(filePath);
        int nextId = suppliers.stream().mapToInt(Supplier::getId).max().orElse(0) + 1;
        supplier.setId(nextId);
        suppliers.add(supplier);
        saveAllSuppliers(suppliers, filePath);
    }

    public static void updateSupplier(Supplier updatedSupplier, String filePath) {
        List<Supplier> suppliers = getAllSuppliers(filePath);
        for (int i = 0; i < suppliers.size(); i++) {
            if (suppliers.get(i).getId() == updatedSupplier.getId()) {
                suppliers.set(i, updatedSupplier);
                break;
            }
        }
        saveAllSuppliers(suppliers, filePath);
    }

    public static void deleteSupplier(int id, String filePath) {
        List<Supplier> suppliers = getAllSuppliers(filePath);
        suppliers.removeIf(s -> s.getId() == id);
        saveAllSuppliers(suppliers, filePath);
    }

    public static List<Supplier> getSuppliersByName(String name, String filePath) {
        List<Supplier> result = new ArrayList<>();
        for (Supplier s : getAllSuppliers(filePath)) {
            if (s.getName().toLowerCase().contains(name.toLowerCase())) {
                result.add(s);
            }
        }
        return result;
    }

    private static void saveAllSuppliers(List<Supplier> suppliers, String filePath) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath))) {
            for (Supplier s : suppliers) {
                bw.write(s.getId() + "," + s.getName() + "," + s.getEmail() + "," + s.getPhone());
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
} 