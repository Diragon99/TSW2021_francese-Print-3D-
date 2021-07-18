<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.print.model.OrderBean,com.print.model.Cart,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ordine</title>
<link rel="stylesheet" type="text/css" href="css\style.css?version=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
<div>
	<%@ include file="/Fragments/Header.html"%>
</div>
<%			
			ArrayList<OrderBean> orders=(ArrayList<OrderBean>)session.getAttribute("orders");
			if (orders!= null && orders.size()!=0) {%>
			<table>
				<tr>
					<th>ID Prodotto</th>
					<th>Data Ordine</th>
					<th>Stato Ordine</th>
					<th>Prezzo Totale</th>
					<th></th>
				</tr>
				<%
					
					
				
				for(int i=0;i<orders.size();i++){
					OrderBean bean=orders.get(i);
%>
		<tr>
			<td><%=bean.getId()%></td>
			<td><%=bean.getData_ordine()%></td>
			<td><%=bean.getStato()%></td>
			<td><%=bean.getCosto() + " €"%></td>
			<td><a href="product?action=vieworder&id=<%=bean.getId()%>">Dettagli ordine</a></td>
		</tr>
		
		<%
				}
				%>
				</table>
				<%
			} else {
		%>
			<div class="noOrders">
				<h1>Nessun ordine effettuato</h1>
				<p>Effettua un ordine ora!</p>
				<a href="catalogView.jsp">Vai al catalogo ></a>
			</div>
		<%
			}
		%>
	
	
<div class="autoSpacer" id="spacerOrdini"></div>
<div>
	<%@ include file="/Fragments/Footer.html"%>
</div>
</body>
</html>