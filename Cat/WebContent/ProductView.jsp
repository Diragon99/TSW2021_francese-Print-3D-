<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,com.print.model.ProductBean,com.print.model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Product Details</title>
</head>

<body>

	<h2>Details</h2>
	<%
		if (product != null) {
	%>
	<table border="1">
		<tr>
			<th>Code</th>
			<th>Name</th>
			<th>Description</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Action</th>
		</tr>
		<tr>
			<td><%=product.getCode()%></td>
			<td><%=product.getShortdesc()%></td>
			<td><%=product.getDescription()%></td>
			<td><%=product.getBase_price()%></td>
			<td><%=product.getAvailable()%></td>
			<td><a href="product?action=addC&id=<%= product.getCode()%>">Add to cart</a></td>
		</tr>
	</table>
	<%
		}
	%>
	<p><a href="product?action=viewC" target="_blank">View cart</a></p>

</body>
</html>
