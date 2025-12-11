package forcely;      

public class ProductService {
 
    public List<Product> searchProduct(String keyword) throws Exception {
            List<Product> products = new ArrayList<Product>();

            DB db = new DB();
            Connection con = null;
            String query1 = "SELECT * FROM Product ORDER BY productCode;";
            String query2 = "SELECT * FROM Product WHERE productCode=? OR description=? OR company=? OR category=? ORDER BY productCode;";
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {

            con = db.getConnection();
            if (keyword == null || keyword.trim().isEmpty()) {
                stmt = con.prepareStatement(query1);
            } else {
                stmt = con.prepareStatement(query2);
                stmt.setString(1,keyword);
                stmt.setString(2,keyword);
                stmt.setString(3,keyword);
                stmt.setString(4,keyword);
            }

            rs = stmt.executeQuery();

            while (rs.next()) {

                products.add( new Product(rs.getString("code"), rs.getString("name"), rs.getString("company")) );

            }

            rs.close();
            stmt.close();
            db.close();

            return products;
            
        } catch (Exception e) {
            throw e;
        } finally {
            try {
                db.close();    
            } catch (Exception e) {
                
            }
            
        }


    }
}
