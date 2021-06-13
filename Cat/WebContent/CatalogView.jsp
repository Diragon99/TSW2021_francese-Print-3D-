<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>Print(3D) catalog</title>
	
	<link rel="stylesheet" type="text/css" href="css\style.css?version=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>

<body>
<div>
	<%@ include file="/Fragments/Header.html"%>
</div>
<div id="catalog" class="row flex-direction-row">
	<div class="col-sm-2 col-md-2 col-lg-2"></div>
	<div class="col-sm-8 col-md-8 col-lg-8">
		<h2>Products</h2>
		<a href="product">List</a>
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
		
		<p><a href="product?action=viewC" target="_blank">View cart</a></p>
	</div>
	<div class="col-sm-2 col-md-2 col-lg-2"></div>
</div>
<div>
	<%@ include file="/Fragments/Footer.html"%>
</div>

</body>
</html>