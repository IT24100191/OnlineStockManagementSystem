package com.stockmanagement.util;

import com.stockmanagement.model.Product;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class ProductSorter {
    public static void mergeSort(List<Product> products, Comparator<Product> comparator) {
        if (products.size() <= 1) {
            return;
        }

        int mid = products.size() / 2;
        List<Product> left = new ArrayList<>(products.subList(0, mid));
        List<Product> right = new ArrayList<>(products.subList(mid, products.size()));

        mergeSort(left, comparator);
        mergeSort(right, comparator);

        merge(products, left, right, comparator);
    }

    private static void merge(List<Product> products, List<Product> left, List<Product> right, Comparator<Product> comparator) {

        int i = 0, j = 0, k = 0;

        while (i < left.size() && j < right.size()) {
            if (comparator.compare(left.get(i), right.get(j)) <= 0) {
                products.set(k++, left.get(i++));
            } else {
                products.set(k++, right.get(j++));
            }
        }

        while (i < left.size()) {
            products.set(k++, left.get(i++));
        }

        while (j < right.size()) {
            products.set(k++, right.get(j++));
        }
    }
}
