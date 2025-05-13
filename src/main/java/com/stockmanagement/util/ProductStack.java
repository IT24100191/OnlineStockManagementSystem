package com.stockmanagement.util;

import com.stockmanagement.model.Product;

import java.util.Stack;

public class ProductStack {
    private final Stack<Product> stack = new Stack<Product>();

    public void push(Product product) {
        stack.push(product);
    }

    public Product pop() {
        return stack.isEmpty() ? null : stack.pop();
    }

    public boolean isEmpty() {
        return stack.isEmpty();
    }
}
