<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.print.model.UserBean"
	%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,com.print.model.ProductBean,com.print.model.Cart"%>


<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>Print(3D) Area Utente</title>
	
	<link rel="stylesheet" type="text/css" href="css\style.css?version=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>

<body id="userAreaBody">
<div>
	<%@ include file="/Fragments/Header.html"%>
</div>
<% // Check user credentials
UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
if ((currentUser==null)||(!currentUser.isValid()))
{%>

<div id="loginLink">
	<p>Sembra tu non sia autenticato!</p>
	<a href="loginPage.jsp">Effettua il log in</a>
</div>

<%}else{ %>
<div>
	<p><a href="orderView.jsp">Ordini</a></p>
	<p><a href="cartView.jsp">Carrello</a></p>
	<p><a href="datiUtente.jsp">Dati Utente</a></p>
</div>

<%} %>
<div class="autoSpacer"></div>
<div>
	<%@ include file="/Fragments/Footer.html"%>
</div>

</body>
</html>