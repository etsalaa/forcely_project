<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_forcely.jsp" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="forcely.*"%>


<%
// getting keyword from request
String keyword = request.getParameter("keyword");

List<Customer> customers = new ArrayList<Customer>();
CustomerService service = new CustomerService();

if (keyword == null || keyword.length() == 0) {
  customers = service.getCustomers();

} else {
  keyword = new String(keyword.getBytes("ISO-8859-1"), "UTF-8");
  customers = service.searchCustomersByLastname(keyword);

}

%>



<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Checkout">
	<title>Καταχώρηση Παραγγελίας</title>

  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/checkout.css">
  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">		
  <!-- Bootstrap Optional theme -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap-theme.min.css">

</head>
<body>

    <%@ include file="topbar_forcely.jsp" %>

    
    <%
	if (request.getAttribute("errorMessage") != null) {	
%>				
			<div class="row">
				<div class="col-xs-12">

					<div class="alert alert-danger">
						<%=(String)request.getAttribute("errorMessage") %>
					</div>

				</div>
			</div>
<%
	}			
%>

    <%
	if (request.getAttribute("successMessage") != null) {	
%>				
			<div class="row">
				<div class="col-xs-12">

					<div class="alert alert-success">
						<%=(String)request.getAttribute("successMessage") %>
					</div>

				</div>
			</div>
<%
	}			
%>


    <h1>Λεπτομέρειες Παραγγελίας</h1>

    <div class="col-xs-12" style="padding-bottom: 20px;">
    
		<h3>1. Στοιχεία Πελάτη</h3>

    <form action="checkout.jsp" method="get" class="form-horizontal">
    <div class="form-group">
        <input class="form-control input-lg" name="keyword" id="search" type="text" placeholder="Search Customer"
               value="<%= (keyword != null && keyword.length() > 0 ? keyword : "") %>">

        <button type="submit" class="btn btn-search">
          <span class="glyphicon glyphicon-search"></span> Αναζήτηση
        </button>

        <a href="checkout.jsp" class="btn btn-cancel">
          <span class="glyphicon glyphicon-remove"></span> Άκυρο
        </a>
    </div>
</form>


    </div>

    

    <div class="col-xs-12">

        <div class="table-responsive">

            <table class="table table-bordered table-hover table-condensed">
              <thead>

                <tr class="table-header">
                    <th>A/A</th>
                    <th>Επώνυμο</th>
                    <th>Όνομα</th>
                    <th>Τηλέφωνο</th>
                    <th>Περιοχή</th>
                    <th class="text-center" style="width: 120px;">Επιλογή</th>
                </tr>
              </thead>
              <tbody>

<%
int counter = 0;
for (Customer customer: customers) {
  counter++;
%>

                <tr>
                    <td><%=counter %></td>
                    <td><%=customer.getLastname() %></td>
                    <td><%=customer.getFirstname() %></td>
                    <td><%=customer.getPhone() %></td>
                    <td><%=customer.getArea() %></td>
                    

                    <td class="text-center">
                        <a href="selectCustomer.jsp?customerId=<%= customer.getCustomerId() %>"
                           class="btn btn-success btn-xs">
                           <span class="glyphicon glyphicon-ok"></span>
                        </a>
                    </td>
                </tr>
<%
}

if (customers.size() == 0) {
%>
                <tr>
                    <td colspan="6" class="text-center">Δεν βρέθηκαν πελάτες με αυτά τα στοιχεία</td>
                </tr>
<%
}
%>
            </tbody>

          </table>

        </div>

        <!-- Κουμπί Καταχώρηση Νέου Πελάτη κάτω από τον πίνακα -->
        <div class="bottom-register-button">
          <a href="createNewCustomer.jsp" class="register-button">
             Καταχώρηση Νέου Πελάτη
          </a>
        </div>

    </div>
    
</body>

</html>
