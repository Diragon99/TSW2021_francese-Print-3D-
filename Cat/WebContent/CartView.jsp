<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) session.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,com.print.model.ProductBean,com.print.model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Print(3D) catalog</title>
</head>
<body>
<h2>Cart</h2>
		<% List<ProductBean> prodcart = cart.getProducts();
			if (prodcart.isEmpty()){%>
			<p>Your cart is empty</p> <br/>
			<p><a href="product?action=home">Return to homepage</a></p>
			
		<%}else{ %>
			
			
		<table border="1">
		<tr>
			<th>Name</th>
			<th>Price</th>
			<th>Action</th>
		</tr>
		<%	
		   for(ProductBean beancart: prodcart) {
		%>
		<tr>
			<td><%=beancart.getShortdesc()%></td>
			<td><%=beancart.getBase_price()%></td>
			<td><a href="product?action=deleteC&id=<%=beancart.getCode()%>">Delete from cart</a></td>
		</tr>
		<%} %>
	</table>
	<br/>
	<p><a href="product?action=checkout">Checkout</a></p><br/>
	<p><a href="product?action=home">Return to homepage</a></p>
	<% } %>	
	
	

</body>
</html>