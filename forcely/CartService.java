package forcely;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import forcely.Cart;
import forcely.ProductVariant;

public class CartService {

    // Δημιουργεί ένα νέο Cart στη βάση
    public int insertCart(Cart cart) throws Exception {
            DB db = new DB();
            Connection con = null;
            String sql = "INSERT INTO Cart (createdAt, totalAmount, totalQuantity) VALUES (?, ?, ?)";
            try {

            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setDate(1, java.sql.Date.valueOf(cart.getCreatedAt()));
            stmt.setDouble(2, cart.getTotalAmount());
            stmt.setInt(3, cart.getTotalQuantity());

            stmt.executeUpdate();

            stmt.close();
            db.close();

            } catch (Exception e) {
                throw e;
            } finally {
                try {
                    db.close();
                } catch (Exception e) {

                }

            }

    }

    public void deleteCartById(int cartId) throws Exception {

        DB db = new DB();
        Connection con = null;
        String sql = "DELETE FROM Cart where cartId=?;";

        try {

            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);

            // binding parameter
            stmt.setInt(1, cartId);

            int rows = stmt.executeUpdate();
            stmt.close();
            // Optional: If there is no student with this id
            if (rows == 0) {
                throw new Exception("No cart found with id: " + cartId);
            }
                        
            db.close();

        } catch (Exception e) {
            throw e;
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }

        }

    }

    // Προσθήκη προϊόντος στο Cart
    public void addToCart(int cartId, ProductVariant variant, int quantity) throws Exception {
        DB db = new DB();
        Connection con = null;
        String query = "INSERT INTO Cart_Item (cartId, productVariant_id, quantity, totalAmount) " +
                         "VALUES (?, ?, ?, ?) " +
                         "ON DUPLICATE KEY UPDATE quantity = quantity + ?, totalAmount = totalAmount + ?";
            double totalAmount = variant.getPrice() * quantity;
        try {
                con = db.getConnection();
                PreparedStatement stmt = con.prepareStatement(query);
                stmt.setInt(1,cartId);
                stmt.setInt(2, variant.getId());
                stmt.setInt(3, quantity);
                stmt.setDouble(4, totalAmount);

                stmt.executeUpdate();

                // Ανανεώνουμε συνολικά ποσά και ποσότητες στο Cart
                recalculateCartTotals(cartId);

        } catch (Exception e) {
            throw e;
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }

        }

    }
    

    // Αφαίρεση προϊόντος από το Cart
    public void removeFromCart(int cartId, ProductVariant variant) {
        String sql = "DELETE FROM Cart_Item WHERE cartId = ? AND productVariant_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, cartId);
            ps.setInt(2, variant.getId());
            ps.executeUpdate();
            recalculateCartTotals(cartId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Υπολογισμός και ενημέρωση συνολικών ποσών και ποσοτήτων
    private void recalculateCartTotals(int cartId) {
        String sql = "SELECT SUM(quantity) AS totalQty, SUM(totalAmount) AS totalAmt FROM Cart_Item WHERE cartId = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, cartId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int totalQty = rs.getInt("totalQty");
                double totalAmt = rs.getDouble("totalAmt");

                String updateCart = "UPDATE Cart SET totalQuantity = ?, totalAmount = ? WHERE cartId = ?";
                try (PreparedStatement psUpdate = con.prepareStatement(updateCart)) {
                    psUpdate.setInt(1, totalQty);
                    psUpdate.setDouble(2, totalAmt);
                    psUpdate.setInt(3, cartId);
                    psUpdate.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
