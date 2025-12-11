<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_forcely.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="forcely.*" %>


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
	<%
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String phone = request.getParameter("phone");
    String street = request.getParameter("street");
    String area = request.getParameter("area");
    String postalcode = request.getParameter("postalcode");
    String email = request.getParameter("email");
	
	try{

	Customer customer = new Customer(firstname, lastname, phone, street, area, postalcode, email);
    CustomerService cService = new CustomerService();
    cService.registerCustomer(customer);
%>
		<div class="page-header">
			<h2>Ο πελάτης καταχωρήθηκε επιτυχώς!</h2>

			<div class="center-button-container">
            <div class="center-button">
                <a href="../checkout/checkout.html" class="complete-registration">Πίσω στο καλάθι</a>
            </div>
            <div class="center-button">
                <a href="../menu/menu.html" class="complete-registration">Πίσω στο μενού</a>
            </div>
        
		</div>
<%
        } catch (Exception e) {
%>
        <div class="page-header">
            <h2>Registration Form has errors</h2>
        </div>

        <div class="alert alert-danger" role="alert">
            <p><%= e.getMessage() %></p>
        </div>

        <p>
            <a href="createNewCustomer.jsp" class="complete-registration">
                <span class="glyphicon glyphicon-chevron-left"></span> Back to the form
            </a>
        </p>
<%
        }
%>

