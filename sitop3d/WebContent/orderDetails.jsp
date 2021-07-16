<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1" import="com.print.model.OrderBean, com.print.model.OrderDetailBean, com.print.model.OrderDAO, java.util.ArrayList"%>
 <%
 float totale=0;	
 ArrayList<OrderDetailBean> o=(ArrayList<OrderDetailBean>)request.getAttribute("order_details");
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ordine #<%=o.get(0).getOrdine()%></title>
<link rel="stylesheet" type="text/css" href="css\style.css?version=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div>
	<%@ include file="/Fragments/Header.html"%>
</div>
<br>
<table border=1>
<tr>
	<th>Costo totale</th>
	<th>Codice prodotto</th>
	<th>Di cui iva</th>
	<th>Categoria</th>
</tr>
<% for(OrderDetailBean b:o) {
	totale+=b.getTot();
	%>
<tr>
			<td><%=b.getTot()%></td>
			<td><%=b.getProdotto()%></td>
			<td><%=b.getIva()%></td>
			<td><%=b.getCat()%></td>
</tr>
<%} %>
<tr><td>Totale: <%= totale %></td></tr>
</table>
<div class="autoSpacer"></div>
<div>
	<%@ include file="/Fragments/Footer.html"%>
</div>
</body>
</html>
