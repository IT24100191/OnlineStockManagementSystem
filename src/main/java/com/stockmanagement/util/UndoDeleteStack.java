package com.stockmanagement.util;

import com.stockmanagement.model.Product;

public class UndoDeleteStack extends ProductStack {
    public void pushDeleted(Product product) {
        push(product);
    }

    public Product undoDelete() {
        return pop();
    }
}
