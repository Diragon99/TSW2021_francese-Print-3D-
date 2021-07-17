<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) session.getAttribute("cart");
	
	float totale = 0;
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,com.print.model.ProductBean,com.print.model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css\style.css?version=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<title>Print(3D) catalog</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body id="cart">
<div>
	<%@ include file="/Fragments/Header.html"%>
</div>
<h2 class="text-center mt-5">Carrello</h2>
		<%	if(cart!=null){
				List<ProductBean> prodcart = cart.getProducts();
				if (prodcart.isEmpty()){%>
				<div class="emptyCart text-center">
					<p>Il carrello è vuoto</p> <br/>
					<a href="product?action=home">Torna al catalogo ></a>
				</div>
		<%}else{ %>
		<div class="container">	
			<div class="notEmptyCart row flex-direction-row">
				<div class="col-sm-2 col-md-2 col-lg-2"></div>
				<div  class="col-sm-8 col-md-8 col-lg-8 centralColumn pt-5">
					<table border="1">
						<tr>
							<th>Prezzo</th>
							<th>Prodotto</th>
							<th></th>
						</tr>
						<%	
						   for(ProductBean beancart: prodcart) {
							   totale+=beancart.getTot();
						%>
						<tr>
							<td class="boldText"><%=(beancart.getBase_price()+((beancart.getBase_price()*beancart.getVat())/100)) + " €" %></td>
							<td><%=beancart.getShortdesc()%></td>
							<td><a href="product?action=deleteC&id=<%=beancart.getCode()%>">Rimuovi dal carrello</a></td>
						</tr>
						<%} %>
						<tr><td>Totale: <%= totale + " €" %></td></tr>
					</table>
					<br/>
					<p><a href="orderCheckout.jsp">Procedi al checkout ></a></p><br/>
					<p><a href="product?action=home">Torna al catalogo ></a></p>
				</div>
				<div class="col-sm-2 col-md-2 col-lg-2"></div>
			</div>
		</div>
	<% }}else{ %>
			<div class="emptyCart text-center">
					<p>Il carrello è vuoto</p> <br/>
					<a href="product?action=home">Torna al catalogo ></a>
				</div>
		<% } %>			

<div class="autoSpacer"></div>
<div>
	<%@ include file="/Fragments/Footer.html"%>
</div>
</body>
</html>