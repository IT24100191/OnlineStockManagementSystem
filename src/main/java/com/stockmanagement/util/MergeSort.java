package com.stockmanagement.util;

import com.stockmanagement.model.Product;
import java.util.ArrayList;
import java.util.List;
import java.util.Comparator;

public class MergeSort {
    public static List<Product> mergeSort(List<Product> products, Comparator<Product> comparator) {
      if (products.size() <= 1 || products == null) {
          return products;
      }
      int middle = products.size() / 2;
      List<Product> leftProducts = mergeSort( new ArrayList<>(products.subList(0, middle)), comparator);

      List<Product>rightProducts = mergeSort(new ArrayList<>(products.subList(middle,products.size())), comparator);

      return merge(leftProducts,rightProducts, comparator);
    }

    private static List<Product> merge(List<Product> left, List<Product> right, Comparator<Product> comparator) {
        List<Product> result = new ArrayList<>();
        int i = 0, j = 0;

        while (i < left.size() && j < right.size()) {
            if (comparator.compare(left.get(i), right.get(j)) < 0) {
                result.add(left.get(i++));
            } else {
                result.add(right.get(j++));

            }
        }
        while (i < left.size()) {
            result.add(left.get(i++));

        }
        while (j < right.size()) {
            result.add(right.get(j++));

        }
        return result;

    }





}
