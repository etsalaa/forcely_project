<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");

DB db = new DB();
try (Connection con = db.getConnection()) {
    String sql = "SELECT username FROM User WHERE username=? AND password=?";
    PreparedStatement stmt = con.prepareStatement(sql);
    stmt.setString(1, username);
    stmt.setString(2, password);
    ResultSet rs = stmt.executeQuery();

    if(rs.next()) {
        // Login επιτυχής
        session.setAttribute("username", username);
        response.sendRedirect("menu.html");
    } else {
        request.setAttribute("error", "Λανθασμένο username ή password");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    rs.close();
    stmt.close();
} catch(Exception e) {
    e.printStackTrace();
    request.setAttribute("error", "Σφάλμα κατά τη σύνδεση");
    request.getRequestDispatcher("login.jsp").forward(request, response);
}
%>
