<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,com.print.model.ProductBean,com.print.model.Cart"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

		<title>Login Page</title>
		<link rel="stylesheet" type="text/css" href="css\style.css?version=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body id="loginPage">
	<div>
	<%@ include file="/Fragments/Header.html"%>
</div>
<div class="marginTop marginWidth" id="loginDiv">
		<p>Inserisci le tue credenziali:</p>
			<form  action="loginServlet?action=login" method="post" id="login">
				
				<input type="text" class="inputRound" name="un" id="ulog" placeholder="Inserisci username" required/><br>		
				<span id="unErr"></span>	
				<input type="password" class="inputRound" name="pw" id="pwdlog" placeholder="Inserisci password" required/>
				<span id="pwErr"></span>
				<br>
				<input type="submit" class="inputRound" value="Login" id="loginbtn" > <!-- style="background-color:#ffe06c" -->
			
			</form>
		<br/><br/>
		
		<p><a href="signUpPage.jsp">Sign up ></a></p>
</div>
<div class="autoSpacer"></div>
<div>
	<%@ include file="/Fragments/Footer.html"%>
</div>

		<script type="text/javascript" src="Scripts/login.js"></script>
	</body>
</html>