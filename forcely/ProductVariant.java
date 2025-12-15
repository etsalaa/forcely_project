package forcely;

import java.util.Objects;

import apple.laf.JRSUIConstants.Size;

public class ProductVariant {

//Αντικείμενο που περιγράφει μια συγκεκριμένη παραλλαγή προϊόντος (μέγεθος + χρώμα).

    private int productId; // Σύνδεση με το parent προϊόν
    private Size size;
    private Color color;
    private int stock;

    // Constructor
    public ProductVariant (int productId, Size size, Color color, int stock) {
        this.producId = productId;
        this.size = size;
        this.color = color;
        this.stock = stock;
    }

    // GETTERS

    public Product getProductId() {
        return productId;
    }

    public Size getSize() {
        return size;
    }

    public Color getColor() {
        return color;
    }

    public int getStock() {
        return stock;
    }


    // SETTERS

    public void setProductId(Product product) {
        this.productId = productId;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    // OTHER METHODS

    public boolean isAvailable(int quantity) {
        return stock >= quantity;
    }

    public double getPrice() {
        double price = 0;
        ProductService pService = new ProductService();
        price = pService.getPriceByProductId(productId);
        return price;
    }



    // equals και hashCode για χρήση σε Map
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ProductVariant)) return false;
        ProductVariant that = (ProductVariant) o;
        return productId == that.productId &&
               size == that.size &&
               color == that.color;
    }

    @Override
    public int hashCode() {
        return Objects.hash(productId, size, color);
    }

}
