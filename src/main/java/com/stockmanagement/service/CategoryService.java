package com.stockmanagement.service;

import com.stockmanagement.model.Category;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryService {
    private static final String DB_FILE = " categories_db.txt";
    private static final String SEPARATOR = "|||";

    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        File dbFile = new File(DB_FILE);

        if (!dbFile.exists()) {
            System.out.println("DEBUG: File not found: " + DB_FILE);
            return categories;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(dbFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                line = line.trim();
                if (line.isEmpty()) continue;

                String[] parts = line.split("\\|\\|\\|", 3);
                if (parts.length >= 2) {
                    Category category = new Category();
                    try {
                        category.setId(Integer.parseInt(parts[0]));
                        category.setName(parts[1]);
                        category.setDescription(parts.length > 2 ? parts[2] : null);
                        categories.add(category);
                    } catch (NumberFormatException e) {
                        System.err.println("DEBUG: Invalid ID format in line: " + line);
                    }
                } else {
                    System.err.println("DEBUG: Invalid line format: " + line);
                }
            }
        } catch (IOException e) {
            System.err.println("DEBUG: Error reading file: " + e.getMessage());
        }

        System.out.println("DEBUG: Loaded categories: " + categories);
        return categories;
    }

    public Category getCategoryById(int id) {
        return getAllCategories().stream()
                .filter(c -> c.getId() == id)
                .findFirst()
                .orElse(null);
    }

    public List<Category> searchCategories(String searchQuery) {
        List<Category> filteredCategories = new ArrayList<>();
        for (Category category : getAllCategories()) {
            if (category.getName().toLowerCase().contains(searchQuery.toLowerCase()) ||
                    category.getDescription().toLowerCase().contains(searchQuery.toLowerCase())) {
                filteredCategories.add(category);
            }
        }
        return filteredCategories;
    }

    public void addCategory(Category category) throws IOException {
        List<Category> categories = getAllCategories();
        int newId = categories.stream().mapToInt(Category::getId).max().orElse(0) + 1;
        category.setId(newId);

        try (PrintWriter writer = new PrintWriter(new FileWriter(DB_FILE, true))) {
            writer.println(category.getId() + SEPARATOR +
                    category.getName() + SEPARATOR +
                    (category.getDescription() != null ? category.getDescription() : ""));
        }
    }

    public void updateCategory(Category category) throws IOException {
        List<Category> categories = getAllCategories();
        categories.removeIf(c -> c.getId() == category.getId());
        categories.add(category);
        saveAllCategories(categories);
    }

    public void deleteCategory(int id) throws IOException {
        List<Category> categories = getAllCategories();
        categories.removeIf(c -> c.getId() == id);
        saveAllCategories(categories);
    }

    private void saveAllCategories(List<Category> categories) throws IOException{
        try (PrintWriter writer = new PrintWriter(new FileWriter(DB_FILE))) {
            for (Category category : categories) {
                writer.println(category.getId() + SEPARATOR +
                        category.getName() + SEPARATOR +
                        (category.getDescription() != null ? category.getDescription() : ""));
            }
        }
    }
}