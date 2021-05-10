<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.print.model.Cart,com.print.model.ProductBean, com.print.model.UserBean" %>
<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
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
	<h2>Products</h2>
	<a href="product">List</a>
	<p><a href="product?action=viewC" target="_blank">View cart</a></p>
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
			<th>Code <a href="product?sort=id_prodotto">Sort</a></th>
			<th>Name <a href="product?sort=descrizione_breve">Sort</a></th>
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
			<td><%=bean.getShortdesc()%></td>
			<td><%=bean.getDescription()%></td>
			<td><a href="product?action=read&id=<%=bean.getCode()%>" target="_blank">Details</a><br>
				<a href="product?action=addC&id=<%=bean.getCode()%>" target="_blank">Add to cart</a>
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
	
	
</body>
</html>
