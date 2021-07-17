<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.print.model.UserBean"
	%>
<%
	UserBean u = (UserBean) (session.getAttribute("currentSessionUser"));
%>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,com.print.model.ProductBean,com.print.model.Cart"%>


<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>Print(3D) Dati Utente</title>
	
	<link rel="stylesheet" type="text/css" href="css\style.css?version=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>

<body id="datiUtenteBody">
<div>
	<%@ include file="/Fragments/Header.html"%>
</div>
<h2 class="text-center">
	I tuoi dati:
</h2>
<div class="userData">
	
		<p class="flex-item">Username: <%=(u.getUsername() != "" && u.getUsername()!=null) ? u.getUsername() : "Username non presente"  %></p>
		<p class="flex-item">Id utente: <%=u.getId() %></p>
		<p class="flex-item">Email: <%=(u.getEmail() != "" && u.getEmail() != null) ? u.getEmail() : "Email non presente" %></p>
		<p class="flex-item">Nome: <%=(u.getFirstName() != "" && u.getFirstName() !=null) ? u.getFirstName() : "Nome non presente" %></p>
		<p class="flex-item">Cognome: <%=(u.getLastName() != "" && u.getLastName() != null) ? u.getLastName() : "Cognome non presente" %></p>
		<p class="flex-item">Codice fiscale: <%=(u.getCf() != "" && u.getCf() != null) ? u.getCf() : "Codice Fiscale non presente" %></p>
		<p class="flex-item">Indirizzo: <%=u.getAddress() %></p>
		<p class="flex-item">Telefono: <%=(u.getTelephone() != "" && u.getAddress() != null) ? u.getAddress() : "Indirizzo non presente" %></p>
		<p class="flex-item">Ragione Sociale: <%=(u.getRagione_sociale() != "" && u.getRagione_sociale() != null) ? u.getRagione_sociale() : "Ragione sociale non presente" %></p>
		<p class="flex-item">Codice SdI: <%= (u.getSdi_code() != "" && u.getSdi_code() != null) ? u.getSdi_code() : "Codice SdI non presente" %> </p>
</div>
<div class="autoSpacer"></div>
<div>
	<%@ include file="/Fragments/Footer.html"%>
</div>

</body>
</html>