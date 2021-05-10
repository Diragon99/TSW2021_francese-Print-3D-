<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.print.model.Cart,com.print.model.ProductBean, com.print.model.UserBean" %>
<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	
	ProductBean product = (ProductBean)request.getAttribute("product");
	
	Cart cart = (Cart)request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,com.print.model.ProductBean,com.print.model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Storage DS/BF</title>
</head>

<body>
	<h2>Products</h2>
	<a href="product">List</a>
	<%
	UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
	if ((currentUser==null)||(!currentUser.isValid()))
	{
		%>
		<a href="LoginPage.jsp">Login</a>
		<%
				}
			 %>
	<table border="1">
		<tr>
			<th>Code <a href="product?sort=code">Sort</a></th>
			<th>Name <a href="product?sort=name">Sort</a></th>
			<th>Description <a href="product?sort=description">Sort</a></th>
			<th>Action</th>
		</tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
		<tr>
			<td><%=bean.getCode()%></td>
			<td><%=bean.getBase_price()%></td>
			<td><%=bean.getDescription()%></td>
			<td><a href="product?action=delete&id=<%=bean.getCode()%>">Delete</a><br>
				<a href="product?action=read&id=<%=bean.getCode()%>">Details</a><br>
				<a href="product?action=addC&id=<%=bean.getCode()%>">Add to cart</a>
				</td>
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">No products available</td>
		</tr>
		<%
			}
		%>
	</table>
	
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
		</tr>
		<tr>
			<td><%=product.getCode()%></td>
			<td><%=product.getShortdesc()%></td>
			<td><%=product.getDescription()%></td>
			<td><%=product.getBase_price()%></td>
			<td><%=product.getVat()%></td>
			<td><%=product.getAvailable()%></td>
			<td><%=product.getCategory()%></td>
		</tr>
	</table>
	<%
		}
	%>
	<h2>Insert</h2>
	<form action="product" method="post">
		<input type="hidden" name="action" value="insert"> 
		
		<label for="code">Code:</label><br> 
		<input name="code" type="number" required placeholder="enter code"><br> 
		
		<label for="short_description">Short Description:</label><br>
		<textarea name="short_description" maxlength="50" rows="3" required placeholder="enter short description"></textarea><br>
		
		<label for="description">Description:</label><br>
		<textarea name="description" maxlength="300" rows="5" required placeholder="enter description"></textarea><br>
		
		<label for="base_price">Base Price:</label><br> 
		<input name="base_price" type="number" min="0" value="0" required><br>
		
		<label for="vat">Vat:</label><br> 
		<input name="vat" type="number" min="0" value="0" required><br>

		<label for="available">Available:</label><br> 
		<input name="available" type="number" min="0" max="1" value="1" required><br>
		
		<label for="category">Category:</label><br> 
		<input name="category" type="Text" required><br>

		<input type="submit" value="Add"><input type="reset" value="Reset">
	</form>
	<% if(cart != null) { %>
		<h2>Cart</h2>
		<table border="1">
		<tr>
			<th>Name</th>
			<th>Action</th>
		</tr>
		<% List<ProductBean> prodcart = cart.getProducts(); 	
		   for(ProductBean beancart: prodcart) {
		%>
		<tr>
			<td><%=beancart.getCode()%></td>
			<td><a href="product?action=deleteC&id=<%=beancart.getCode()%>">Delete from cart</a></td>
		</tr>
		<%} %>
	</table>		
	<% } %>	
</body>
</html>
