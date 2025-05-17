package com.stockmanagement.util;

import com.stockmanagement.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductStack {
    private List<Product> stack;

    public ProductStack() {
        stack = new ArrayList<>();
    }

    public void push(Product p) {
        stack.add(p);
    }

    public Product pop() {
        if (!isEmpty()) return stack.remove(stack.size() - 1);
        return null;
    }

    public boolean isEmpty() {
        return stack.isEmpty();
    }

    public int size() {
        return stack.size();
    }

    public List<Product> getAllProducts() {
        return new ArrayList<>(stack);
    }
}

