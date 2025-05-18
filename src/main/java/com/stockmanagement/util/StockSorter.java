package com.stockmanagement.util;

import com.stockmanagement.model.Stock;
import java.util.ArrayList;
import java.util.List;

public class StockSorter {
    public static List<Stock> sortByExpiryDate(List<Stock> stocks) {
        if (stocks == null || stocks.size() <= 1) return stocks; // No sort needed
        List<Stock> copy = new ArrayList<>(stocks); // Don’t mess with original list
        mergeSort(copy, 0, copy.size() - 1);
        return copy;
    }

    private static void mergeSort(List<Stock> stocks, int left, int right) {
        if (left < right) {
            int mid = (left + right) / 2;
            mergeSort(stocks, left, mid);
            mergeSort(stocks, mid + 1, right);
            merge(stocks, left, mid, right);
        }
    }

    private static void merge(List<Stock> stocks, int left, int mid, int right) {
        List<Stock> temp = new ArrayList<>();
        int i = left, j = mid + 1;

        while (i <= mid && j <= right) {
            Stock s1 = stocks.get(i);
            Stock s2 = stocks.get(j);
            if (s1.getExpiryDate() == null) {
                temp.add(s2);
                j++;
            } else if (s2.getExpiryDate() == null) {
                temp.add(s1);
                i++;
            } else if (s1.getExpiryDate().isBefore(s2.getExpiryDate()) || s1.getExpiryDate().isEqual(s2.getExpiryDate())) {
                temp.add(s1);
                i++;
            } else {
                temp.add(s2);
                j++;
            }
        }

        while (i <= mid) temp.add(stocks.get(i++));
        while (j <= right) temp.add(stocks.get(j++));

        for (int k = 0; k < temp.size(); k++) {
            stocks.set(left + k, temp.get(k));
        }
    }
}
