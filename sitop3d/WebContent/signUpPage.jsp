<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" 
import="java.util.*,com.print.model.ProductBean,com.print.model.UserDAO,
com.print.model.Cart"%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css\style.css?version=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
		<title>SignUp Page</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>

	<body id="signUpBody">
	<div>
		<%@ include file="/Fragments/Header.html"%>
	</div>
	<div class="container-fluid" id="signUpPage">
	<div class="row row-eq-height">
		<h1>Registrati</h1>
		<div class="col-sm-1 col-md-1 col-lg-1"></div>
		<div class="col-sm-10 col-md-10 col-lg-10">
			
			<form action="register" method="post" id="reg">
			<div class="row">
				<div class="col-sm-6 col-md-6 col-lg-6">
				
					<p>Informazioni personali</p>
				
					
					<input type="text" class="inputRound" name="nome" id="nomeSignUp" placeholder="Inserisci nome" required/><br/>
					

					<input type="text" class="inputRound" name="cognome" id="cognSignUp" placeholder="Inserisci cognome" required/><br/>		
				
					
					<input type="text" class="inputRound" name="indirizzo" id="indSignUp" placeholder="Inserisci indirizzo" required/><br/>		
				

					<input type="text" class="inputRound" name="telefono" id="telSignUp" placeholder="Inserisci telefono" required/><br/>
					<span id="telErr"></span>
					

					<input type="text" class="inputRound" name="cf" id="cfSignUp" placeholder="Inserisci codice fiscale" required/><br/>
					<span id="cfErr"></span>
					
				</div>
				<div class="col-sm-6 col-md-6 col-lg-6">
					
						<p>Credenziali</p>

					<input type="text" class="inputRound" name="un" id="unSignUp" placeholder="Inserisci username" required/><br/>		
					<span id="unErr"></span>
					

					<input type="text" class="inputRound" name="email" id="emailSignUp" placeholder="Inserisci e-mail" required/><br/>
					<span id="emailErr"></span>
					

					<input type="password" class="inputRound" id="pwSignUp" name="pw" placeholder="Inserisci password" required/><br/>
					<span id="pwErr"></span>
					
					<p>Altro</p>
					
<!-- 					<label for="ragsocSignUp">Ragione sociale:</label> -->
					<input type="text" class="inputRound" id="ragsocSignUp" name="ragione_sociale" placeholder="Inserisci ragione sociale"/><br/>		
				
					<!-- <label for="sdiSignUp">SdI:</label> -->
					<input type="text" class="inputRound" id="sdiSignUp" name="sdi" placeholder="Inserisci SdI"><br/>
				</div>
			</div>
				<input type="submit" class="inputRound" value="Registrati" disabled id="btnSignUp">			
			
			</form>
		
		<br/>
		<p><a href="loginPage.jsp">Log In ></a></p>
	</div>
	<div class="col-sm-1 col-md-1 col-lg-1"></div>
</div>
</div>
<div class="autoSpacer"></div>
<div>
	<%@ include file="/Fragments/Footer.html"%>
</div>
		<script type="text/javascript" src="Scripts/signup.js"></script>
	</body>
</html>