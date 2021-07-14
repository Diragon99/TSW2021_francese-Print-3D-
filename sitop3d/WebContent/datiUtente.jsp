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

<body>
<div>
	<%@ include file="/Fragments/Header.html"%>
</div>
<h2>
I tuoi dati:
</h2>
<div>
<ul>
<li>Username: <%=u.getUsername() %></li>
<li>Id utente: <%=u.getId() %></li>
<li>Email: <%=u.getEmail() %></li>
<li>Nome: <%=u.getFirstName() %></li>
<li>Cognome: <%=u.getLastName() %></li>
<li>Codice fiscale: <%=u.getCf() %></li>
<li>Indirizzo: <%=u.getAddress() %></li>
<li>Telefono: <%=u.getTelephone() %></li>
<%if(u.getRagione_sociale()!=null&&u.getRagione_sociale().length()>1){ %>
<li>Ragione Sociale: <%=u.getRagione_sociale() %></li>
<%}if(u.getSdi_code()!=null&&(u.getSdi_code().length()==6||u.getSdi_code().length()==7)) {%>
<li>Codice SdI: <%=u.getSdi_code() %></li>
<%} %>
</ul>
</div>
<div>
	<%@ include file="/Fragments/Footer.html"%>
</div>

</body>
</html>