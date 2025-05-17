package com.stockmanagement.util;

import com.stockmanagement.model.Product;

public class RecentProductStack extends ProductStack {
    private final int capacity;

    public RecentProductStack(int capacity) {
        super();
        this.capacity = capacity;
    }

    @Override
    public void push(Product p) {
        super.push(p);
        if (stack.size() > capacity) {
            stack.remove(0);
        }
    }
}
