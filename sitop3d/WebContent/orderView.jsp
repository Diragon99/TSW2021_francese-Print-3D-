<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1" import="com.print.model.OrderBean,com.print.model.Cart,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>I miei ordini</title>
<link rel="stylesheet" type="text/css" href="css\style.css?version=1">
</head>
<body>
<div>
	<%@ include file="/Fragments/Header.html"%>
</div>
<table border=1>
<tr>
	<th>Id ordine</th>
	<th>Data</th>
	<th>Stato</th>
	<th>Costo totale</th>
	<th>Dettagli</th>
</tr>
<%			
			ArrayList<OrderBean> orders=(ArrayList<OrderBean>)session.getAttribute("orders");
			if (orders!= null && orders.size()!=0) {
				for(int i=0;i<orders.size();i++){
					OrderBean bean=orders.get(i);
%>

		
		<tr>
			<td><%=bean.getId()%></td>
			<td><%=bean.getData_ordine()%></td>
			<td><%=bean.getStato()%></td>
			<td><%=bean.getCosto()%></td>
			<td><a href="product?action=vieworder&id=<%=bean.getId()%>">Vedi l'ordine</a></td>
		</tr>
		
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">Nessun ordine effettuato</td>
		</tr>
		<%
			}
		%>
	</table>
	
<div class="autoSpacer"></div>
<div>
	<%@ include file="/Fragments/Footer.html"%>
</div>
</body>
</html>