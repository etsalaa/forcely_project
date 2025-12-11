<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_forcely.jsp" %>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Create New Customer">
	<title>Καταχώρηση Νέου Πελάτη</title>
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/createNewCustomer.css">
</head>
<body>

    <%@ include file="topbar_forcely.jsp" %>

    <h1><strong>Καταχώρηση Νέου Πελάτη</strong></h1>
    
        <form class="register-container" method="post" action="createNewCustomerController.jsp">
             
            <div class="register-section">
    
                <label><strong>Επώνυμο</strong>:
                  <input type="text" name="firstname" placeholder="Γράψτε όνομα">
                </label>

                <label><strong>Όνομα:</strong>
                  <input type="text" name="lastname" placeholder="Γράψτε επώνυμο">
                </label>

                <label><strong>Τηλέφωνο:</strong>
                  <input type="text" name="phone" placeholder="Γράψτε τηλέφωνο">
                </label>

                <label><strong>Οδός:</strong>
                  <input type="text" name="street" placeholder="Γράψτε Οδό">
                </label>

                <label><strong>Περιοχή:</strong>
                 <input type="text" name="area" placeholder="Γράψτε Περιοχή">
                </label>

                <label><strong>ΤΚ:</strong>
                  <input type="text" name="postalcode" placeholder="Γράψτε ΤΚ">
                </label>

                <label><strong>Email:</strong>
                  <input type="text" name="email" placeholder="Γράψτε email">
                </label>
                <button type="submit" class="complete-registration">Υποβολή</button>
             </div>

        </form>
</body>
</html>
