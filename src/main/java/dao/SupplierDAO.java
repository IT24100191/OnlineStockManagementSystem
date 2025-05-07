package dao;

import model.Supplier;
import java.util.ArrayList;
import java.util.List;

public class SupplierDAO {
    private static List<Supplier> suppliers = new ArrayList<>();
    private static int nextId = 1;

    static {
        // Add some sample data
        suppliers.add(new Supplier(nextId++, "ABC Supplies", "abc@example.com", "123-456-7890"));
        suppliers.add(new Supplier(nextId++, "XYZ Corporation", "xyz@example.com", "987-654-3210"));
    }

    public static List<Supplier> getAllSuppliers() {
        return new ArrayList<>(suppliers);
    }

    public static Supplier getSupplierById(int id) {
        for (Supplier supplier : suppliers) {
            if (supplier.getId() == id) {
                return supplier;
            }
        }
        return null;
    }

    public static void addSupplier(Supplier supplier) {
        supplier.setId(nextId++);
        suppliers.add(supplier);
    }

    public static void updateSupplier(Supplier updatedSupplier) {
        for (int i = 0; i < suppliers.size(); i++) {
            if (suppliers.get(i).getId() == updatedSupplier.getId()) {
                suppliers.set(i, updatedSupplier);
                break;
            }
        }
    }

    public static void deleteSupplier(int id) {
        suppliers.removeIf(supplier -> supplier.getId() == id);
    }

    public static List<Supplier> getSuppliersByName(String name) {
        List<Supplier> result = new ArrayList<>();
        for (Supplier supplier : suppliers) {
            if (supplier.getName().toLowerCase().contains(name.toLowerCase())) {
                result.add(supplier);
            }
        }
        return result;
    }
}