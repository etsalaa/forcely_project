<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head><title>Login - Forcely</title></head>
<body>
<h2>Σύνδεση στο σύστημα</h2>
<form method="post" action="LoginController.jsp">
    <label>Username: <input type="text" name="username"/></label><br/>
    <label>Password: <input type="password" name="password"/></label><br/>
    <input type="submit" value="Login"/>
</form>
<% if(request.getAttribute("error") != null) { %>
<p style="color:red;"><%= request.getAttribute("error") %></p>
<% } %>
</body>
</html>
