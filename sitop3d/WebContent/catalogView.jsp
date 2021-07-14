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
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,com.print.model.ProductBean,com.print.model.UserBean,
com.print.model.ProductDAO,com.print.model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- <link href="ProductStyle.css" rel="stylesheet" type="text/css"> -->
	<title>Print(3D) catalog</title>
	<link rel="stylesheet" type="text/css" href="css\style.css?version=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body id="catalogBody">
<div>
	<%@ include file="/Fragments/Header.html"%>
</div>
<div class="container">
	<div id="catalog" class="row flex-direction-row">
		<div class="col-sm-2 col-md-2 col-lg-2"></div>
		<div class="col-sm-8 col-md-8 col-lg-8 centralColumn">
			<h2>Catalogo</h2>
			<%
			UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
			if ((currentUser==null)||(!currentUser.isValid()))
			{
				
			}else{
				if(currentUser.getUser_type().equalsIgnoreCase("admin")){
				
					products=ProductDAO.doRetrieveAll(null, true);%>
					<a href="adminPage.jsp">Aggiungi un prodotto</a><br>					
					<%}
			}
				 %><br>
		
		<table>
			<tr>
					<!-- <th><a href="product?sort=code">Codice prodotto </a></th> -->
					<th><a href="product?sort=name">Nome</a></th>
					<th><a href="product?sort=description">Descrizone</a></th>
					<th>Immagine</th>
					<th>Azione</th>
				</tr>
			<%
				if (products != null && products.size() != 0) {
					Iterator<?> it = products.iterator();
					while (it.hasNext()) {
						ProductBean bean = (ProductBean) it.next();
			%>
			<tr>
				<%-- <td><%=bean.getCode()%></td> --%>
				<td><%=bean.getShortdesc()%></td>
				<td><%=bean.getDescription()%></td>
				<td class='zoomCatalog'><img alt="<%=bean.getShortdesc()%>" src="updir/<%=bean.getCode()%>/img_1"></td>
				<td><a href="product?action=read&id=<%=bean.getCode()%>" target="_blank">Dettagli</a><br>
					<p class="fakeButton"><a class="addToCart" href="product?action=addC&id=<%=bean.getCode()%>" target="_blank">Aggiungi al Carrello</a></p>
					</td>
			</tr>
			<%
					}
				} else {
			%>
			<tr>
					<td colspan="6">Nessun prodotto disponibile</td>
				</tr>
			<%
				}
			%>
		</table>
	<p><a href="product?action=viewC" target="_blank">Vai al carrello</a></p>
	</div>
		<div class="col-sm-2 col-md-2 col-lg-2"></div>
	</div>
</div>
<div class="autoSpacer"></div>
<div>
	<%@ include file="/Fragments/Footer.html"%>
</div>

</body>
</html>