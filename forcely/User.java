package forcely;

import java.sql.*;

public class User {

    private String username;
    private String role;

    public String getUsername() {
        return username;
    }

    public String getRole() {
        return role;
    }

    public boolean authenticate(String u, String p) throws Exception {

        DB db = new DB();
        Connection con = db.getConnection();

        String sql = "SELECT * FROM User WHERE username=? AND password=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, u);
        ps.setString(2, p);

        ResultSet rs = ps.executeQuery();

        if (!rs.next()) {
            db.close();
            return false;
        }

        this.username = u;

        // Έλεγχος ρόλου
        if (exists(con, "SELECT * FROM Secretary WHERE username=?", u)) {
            role = "SECRETARY";
        } else if (exists(con, "SELECT * FROM WarehouseWorker WHERE username=?", u)) {
            role = "WAREHOUSE";
        }

        db.close();
        return true;
    }

    private boolean exists(Connection con, String sql, String u) throws Exception {
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, u);
        ResultSet rs = ps.executeQuery();
        return rs.next();
    }
}
