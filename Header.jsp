<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.print.model.UserBean" 
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div id="headerMobile" class="pos-f-t">
				<!--Navbar-->
		<nav class="navbar">
		
		  <!-- Navbar brand -->
		  <span class="navbar-brand mb-0 h1"><a href="Homepage.jsp">Print3D</a></span>
		
		  <!-- Collapse button -->
		 
			
				<div class="hamb pos-f-t" onclick="hambFoo(this)">
					<div class="bar1"></div>
					<div class="bar2"></div>
					<div class="bar3"></div>
				</div>
			
		</nav>
			
		
		  <!-- Collapsible content -->
		  <div class="collapse row" id="navbarToggleExternalContent">
		
		    <div id="navItemsMob">
			    <ul>
			      <li class="nav-item">
			        <a class="nav-link" href="Homepage.jsp">Home</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="catalogView.jsp">Modelli 3D</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="AreaUtente.jsp">Area Utente</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="Infos.jsp">Info e Contatti</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="Privacy.jsp">Privacy e Cookie</a>
			      </li>
			    </ul>
		    </div>
		
		  </div>
		  <!-- Collapsible content -->
		
		
		<!--/.Navbar-->
	</div>
	<!-- desktop -->
	<div class="container-fluid"> <!-- prevents horizontal scroll from row class -->
		<div id="header" class="row flex-direction-row">
			<div id="logo" class="col-3 col-sm-2 col-md-3 col-lg-3"> <!-- to set height to 50% -->
				<h1><a href="Homepage.jsp">Print3D</a></h1><!--  <img srg="---" alt="Logo.png"> -->
			</div>
			<div class="col-2 col-sm-1 col-md-1 col-lg-3"></div>
			<div class="col-7 col-sm-9 col-md-8 col-lg-6">
	            <div id="nav">
	                <p><a href="Homepage.jsp">Home</a></p>
	                <p><a href="catalogView.jsp">Modelli 3D</a></p>
	                <p><a href="AreaUtente.jsp">Area Utente</a></p>
	                <p><a href="Infos.jsp">Info e Contatti</a></p>
	                <p><a href="Privacy.jsp">Privacy e Cookies</a></p>
	                <% // Check user credentials
					UserBean current_user = (UserBean) (session.getAttribute("currentSessionUser"));
					if ((current_user==null)||(!current_user.isValid()))
					{%>
	                <p><a href="loginPage.jsp">Login</a></p>
	                <%}else{ %>
	                <p><a href="loginServlet?action=logout">Logout</a></p><%} %>
	            </div>
	            <!-- put stuff in div and fix id nav -->
	            <div id="misc" class="row">
	                <div class="col-sm-6 col-md-6 col-lg-6">
	                    <p><a href="cartView.jsp">Carrello <i class="fa fa-shopping-cart"></i></a></p>
	                </div>
	            </div>
			</div>
		</div>
	</div>
</body>
</html>