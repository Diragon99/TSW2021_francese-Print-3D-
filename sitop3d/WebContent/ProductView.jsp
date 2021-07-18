<%@page import="com.print.control.AdminServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	UserBean u=(UserBean)request.getSession().getAttribute("currentSessionUser");	
	ProductBean product = (ProductBean) request.getAttribute("product");
	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,com.print.model.ProductBean,
com.print.model.Cart, com.print.model.UserBean,java.io.Console,java.io.File,com.print.control.AdminServlet"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0 minimum-scale=1">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Product Details</title>
	<link rel="stylesheet" type="text/css" href="css\style.css?version=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>

<body id="detailsBody">

<div>
	<%@ include file="/Fragments/Header.html"%>
</div>

	<h2 class="text-center">Dettagli Prodotto</h2>
	<div class="container detailsPage">
		<%
			if (product != null) {
		%>
		<%			
			if (u!=null&&u.getUser_type().equalsIgnoreCase("admin")) {
		%><div>
		<form action="admin?action=change_price&id=<%=product.getCode()%>" method="post">
			<input type="text" name="cambia_prezzo" id="cp" placeholder="Inserisci il nuovo prezzo">
			<input type="text" name="cambia_iva" id="iva" placeholder="Inserisci iva">
			<input type="submit" value="Aggiorna il prezzo">
		</form>
		<% if(product.getAvailable()){ %>
		<form action="admin?action=set_unavailable&id=<%=product.getCode()%>" method="post">
		<input type="submit" value="Rimuovi dalla vendita">
		</form>
		</div>
		<%}else{ %>
		<form action="admin?action=set_available&id=<%=product.getCode()%>" method="post">
		<input type="submit" value="Rimetti in vendita">
		</form>
		</div>
		<%}}%>
		<div class="row flex-direction-row">
		<div class="col-sm-1 col-md-1 col-lg-1"></div>
		<div class="col-sm-10 col-md-10 col-lg-10 centralColumn pt-5 pb-5">
		<div class="detailsTable">
			<table border="1">
				<tr>
					<th>Codice Prodotto</th>
					<th>Nome</th>
					<th>Descrizione</th>
					<th>Prezzo</th>
					<th>Categoria</th>
					<th>Disponibile</th>
					<th></th>
				</tr>
				<tr>
					<td><%=product.getCode()%></td>
					<td><%=product.getShortdesc()%></td>
					<td><%=product.getDescription()%></td>
					<td><%=String.format("%.2f", product.getTot()) + " €"%></td>
					<td><%=product.getCategory()%></td>
					<td><%=(product.getAvailable()==true) ? "Sì" : "No"%></td>
					<td><p class="fakeButton"><a class="addToCart" href="product?action=addC&id=<%=product.getCode()%>" target="_blank">Aggiungi al Carrello</a></p></td>
				</tr>
			</table>
			</div>
			
			<%
			String path=getServletContext().getInitParameter("updir");
			path+="/"+product.getCode();
				try{
					File f=new File(path); 
					int imgs=f.list().length;
					for(int i=0; i<imgs;i++){
						int j=i+1;
						String source="updir/"+product.getCode()+"/img_"+j;
			%>
			<table>
			<td class='zoomCatalog'><img src="<%=source%>" alt="<%=j%>"></td>
			</table>
			<%}}catch(NullPointerException e){
					e.printStackTrace();
				}}
			%>
			</div>
			<div class="col-sm-1 col-md-1 col-lg-1"></div>
		</div>
		<p  class="text-center"><a href="product?action=viewC" target="_blank">Vai al carrello</a></p>
	</div>
<div class="autoSpacer"></div>
<div>
	<%@ include file="/Fragments/Footer.html"%>
</div>
</body>
</html>