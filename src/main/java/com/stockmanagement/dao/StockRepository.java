package dao;

import model.Stock;
import java.util.List;

public interface StockRepository {
    List<Stock> readAll();
    void addProduct(Stock p);
    Stock getById(String id);
    void updateQuantity(String id, int soldQty);
    void deleteProduct(String id);
    void changeQuantity(String id, int newQty);
}
