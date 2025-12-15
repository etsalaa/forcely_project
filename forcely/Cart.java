package forcely;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

public class Cart {
    private int cartId;
    private LocalDate createdAt;

    // Κλειδί: ProductVariant, Τιμή: quantity
    private Map<ProductVariant, Integer> items;

    private double totalAmount;
    private int totalQuantity;

// Constructor
    public Cart() {
        this.createdAt = LocalDate.now();
        this.items = new HashMap<>();
        this.totalAmount = 0.0;
        this.totalQuantity = 0;
    }

// Getters και Setters
    public Integer getCartId() {
        return cartId;
    }

    public LocalDate getCreatedAt() {
        return createdAt;
    }

    public Map<ProductVariant, Integer> getItems() {
        return items;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void recalculateTotals() {
        double amount = 0.0;
        int quantity = 0;
        for (Map.Entry<ProductVariant, Integer> entry : items.entrySet()) {
            amount += entry.getKey().getPrice() * entry.getValue();
            quantity += entry.getValue();
        }
        this.totalAmount = amount;
        this.totalQuantity = quantity;
    }
}

