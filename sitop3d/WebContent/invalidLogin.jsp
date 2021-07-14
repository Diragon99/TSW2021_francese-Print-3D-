<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

   <!DOCTYPE html>

   <html>

      <head>
         <%@ page contentType="text/html; charset=UTF-8"%>
         <title>Invalid Login</title>
         <link rel="stylesheet" type="text/css" href="css\style.css?version=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
      </head>
	
      <body id="invalidBody">
      <div>
	<%@ include file="/Fragments/Header.html"%>
	</div>
	<div class="retryActions">
         <p>Credenziali sbagliate. Riprova</p>
         <p><a href="loginPage.jsp">Login ></a></p>
         <br/>
         <br/>
         <p>Non sei ancora registrato?</p>
         <p><a href="signUpPage.jsp">Sign up ></a></p>
   	</div>
<div class="autoSpacer"></div>
<div>
	<%@ include file="/Fragments/Footer.html"%>
</div>
      </body>
	
   </html>