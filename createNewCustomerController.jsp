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
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/createNewCustomerController.css">
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
	
    
    if (firstname != null) {
        firstname = new String(firstname.getBytes("ISO-8859-1"), "UTF-8");
    }

    if (lastname != null) {
        lastname = new String(lastname.getBytes("ISO-8859-1"), "UTF-8");
    }

    if (street != null) {
        street = new String(street.getBytes("ISO-8859-1"), "UTF-8");
    }

    if (area != null) {
        area = new String(area.getBytes("ISO-8859-1"), "UTF-8");
    }


	try{

	Customer customer = new Customer(firstname, lastname, phone, street, area, postalcode, email);
    CustomerService cService = new CustomerService();
    cService.registerCustomer(customer);
%>
    <div class="results">
		<div class="page-header">
			<h1>Ο πελάτης καταχωρήθηκε επιτυχώς!</h1>
        </div>

                <div class="center-button-container">
                   <a href="checkout.jsp" class="complete-registration">Πίσω στο checkout</a>
                   <a href="menu.html" class="complete-registration">Πίσω στο μενού</a>
                </div>

    </div>
<%
        } catch (Exception e) {
%>
        <div class="results">
        <div class="page-header">
            <h1>Registration Form has errors</h1>
        </div>

        <div class="alert-danger" role="alert">
            <p><%= e.getMessage() %></p>
        </div>

        <p>
            <a href="createNewCustomer.jsp" class="complete-registration">
                <span class="glyphicon glyphicon-chevron-left"></span> Πίσω στην φόρμα καταχώρησης νέου πελάτη
            </a>
        </p>

        </div>
<%
        }
%>

