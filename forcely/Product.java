package forcely;

import java.util.List;

public class Product {

    private String productCode;
    private double price;
    private String productName;

    private List<Size> availableSizes;
    private List<Color> availableColors;

    private String description;
    private String category;
    private String martialArt;
    private String imageUrl;

    private List<ProductVariant> variants = new ArrayList<>();

    public Product(String productCode,
                   String productName,
                   double price,
                   List<Size> availableSizes,
                   List<Color> availableColors,
                   String description,
                   String category,
                   String martialArt,
                   String imageUrl) {

        this.productCode = productCode;
        this.productName = productName;
        this.price = price;
        this.availableSizes = availableSizes;
        this.availableColors = availableColors;
        this.description = description;
        this.category = category;
        this.martialArt = martialArt;
        this.imageUrl = imageUrl;

        createVariants();

    }

    private void createVariants() {
        for (Size size : availableSizes) {
            for (Color color : availableColors) {

                ProductVariant variant = new ProductVariant(this, size, color, 0);
                variants.add(variant);
            }
        }
    }


    // GETTERS
    public String getProductCode() {
        return productCode;
    }

    public String getProductName() {
        return productName;
    }

    public double getPrice() {
        return price;
    }

    public List<Size> getAvailableSizes() {
        return availableSizes;
    }

    public List<Color> getAvailableColors() {
        return availableColors;
    }

    public String getDescription() {
        return description;
    }

    public String getCategory() {
        return category;
    }

    public String getMartialArt() {
        return martialArt;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    // SETTERS
    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setAvailableSizes(List<Size> availableSizes) {
        this.availableSizes = availableSizes;
    }

    public void setAvailableColors(List<Color> availableColors) {
        this.availableColors = availableColors;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setMartialArt(String martialArt) {
        this.martialArt = martialArt;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

     public List<ProductVariant> getVariants() {
        return variants;
    }
}
