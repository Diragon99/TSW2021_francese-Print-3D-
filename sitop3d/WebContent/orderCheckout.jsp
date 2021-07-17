
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.print.model.UserBean, com.print.model.Cart,
     com.print.model.ProductBean, java.util.List"%>
<% Cart cart=(Cart)request.getSession().getAttribute("cart"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check out</title>
<link rel="stylesheet" type="text/css" href="css\style.css?version=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<BODY BGCOLOR="#FDF5E6">
 <div>
	<%@ include file="/Fragments/Header.html"%>
</div>
<p>Riepilogo ordine</p>
	<table border="1">
						<tr>
							<th>Prodotto</th>
							<th>Prezzo</th>	
							<th>Categoria</th>						
						</tr>
						<%	List<ProductBean> prodcart = cart.getProducts();
						   for(ProductBean beancart: prodcart) {
						%>
						<tr>
							<td><%=beancart.getShortdesc()%></td>
							<td><%=beancart.getTot() + " €" %></td>
							<td><%=beancart.getCategory()%></td>							
						</tr>
						<%} %>
						<tr><td>Totale: <%= cart.getTotal() + " €" %></td></tr>
					</table>
	<form action="checkoutServlet" method="post" id="form_ordini">
		<label for="def_address">Usa il mio indirizzo per la fatturazione: <%=((UserBean) (session.getAttribute("currentSessionUser"))).getAddress() %></label>
		<input type= "radio" name="indirizzo" id="def_address"  value="def"><br>
		<label for="new_address">Fattura presso un altro indirizzo</label>
		<input type="radio" name="indirizzo" id="new_address"  value="new">
		<input type="text" name="nuovo_indirizzo" id="new_address_value"><br>
		<label for="payment">Scegli un metodo di pagamento:</label>
		<select name="pagamento" id="payment">
 			<option value="carta">Checkout con carta</option>
  			<option value="bonifico">Checkout con bonifico</option>
  			<option value="contrassegno">Paga in contrassegno</option>
  		</select>
  		<input type="submit" value="Acquista">
	</form>
	<div>
	<%@ include file="/Fragments/Footer.html"%>
</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="Scripts/checkout.js"></script>
</BODY>
</html>