<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.print.model.OrderBean, com.print.model.OrderDetailBean,
    com.print.model.OrderDAO, java.util.ArrayList, com.print.model.FatturaDAO, com.print.model.FatturaBean"%>
 <%
	ArrayList<OrderDetailBean> o=(ArrayList<OrderDetailBean>)request.getAttribute("order_details");
 	float totale = 0;
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dettagli ordine</title>
<link rel="stylesheet" type="text/css" href="css\style.css?version=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div>
	<%@ include file="/Fragments/Header.html"%>
</div>
<%
if(o !=null && o.size()>0){
%>

<table class="detailsTable">
	<tr>
		<th>Totale</th>
		<th>Codice Prodotto</th>
		<th>Di cui iva</th>
		<th>Categoria</th>
	</tr>
	
<%
for(OrderDetailBean b:o) {
	totale+=b.getTot();
	%>
		<tr>
			<td><%=b.getTot() + " €"%></td>
			<td><%=b.getProdotto()%></td>
			<td><%=b.getIva() + " %"%></td>
			<td><%=b.getCat()%></td>
		</tr>
<% } %>
<tr>
	<td>Totale: <%= totale + " €" %></td>
</tr>
</table>
<button id="fattura_button" class="inputRound">Mostra la fattura</button>
<div id="fattura_div" class="fatturaData">
<%FatturaBean f=FatturaDAO.doRetrieve(o.get(0).getOrdine()); %>
<p class="flex-item">Id fattura: <%=f.getId() %></p>
<p class="flex-item">Id ordine: <%=f.getOrdine() %></p>
<p class="flex-item">Costo totale: <%=f.getCosto() %></p>
<p class="flex-item">Pagamento: <%=f.getPagamento() %></p>
<p class="flex-item">Data fattura: <%=f.getData() %></p>		
</div>
<%} else{
%>
<p>Nessun dettaglio da mostrare</p>
<%} %>
<div class="autoSpacer"></div>
<div>
	<%@ include file="/Fragments/Footer.html"%>
</div>
<script type="text/javascript" src="Scripts/orderDetails.js"></script>
</body>
</html>