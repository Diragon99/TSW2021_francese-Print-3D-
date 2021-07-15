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
<script>
		
		//fields validation region
		
		$('document').ready(function(){
			$("#loginbtn").attr("disabled",true);
			const regUn = new RegExp('^.{6,}$');
			const regPw = new RegExp('^.{8,}$');			
			let unNotF=true;
			$('#ulog').keyup(function(){ //change firing only on blur
				if(regUn.test(this.value)){
					$('#unErr').html('');
				}
			});
			$("#ulog").blur(function(){
				if((this.value != '') && (regUn.test(this.value) == false)) {
					$('#unErr').html("L'username dev'essere lungo almeno 6 caratteri<br/>");					
				} else {
					var xhr=new XMLHttpRequest();					
					xhr.open("post", "loginServlet?action=verifica_un", true);					
					xhr.setRequestHeader("content-type", "application/json");
					xhr.onreadystatechange=function(){
						if(xhr.readyState==4){
							if (xhr.status==200){
								$('unErr').html("");
								unNotF=false;
							}
							else if(xhr.status==412){
								$('#unErr').html("L'username non è presente")
								unNotF=true;
							}
							else{
								$('#unErr').html("Errore server, riprova più tardi");
							}
						}	
					}
					var data={username: $("#ulog").val()};
					data = JSON.stringify(data);
					xhr.send(data);
				}
			});
						
			$('#pwdlog').keyup(function(){
				if(regPw.test(this.value)){
					$('#pwErr').html('');
				}
			});
			$("#pwdlog").blur(function(){
				if((this.value != '') && (regPw.test(this.value) == false)) {
					$('#pwErr').html("La password dev'essere lunga almeno 8 caratteri<br/>");
				} else {
					$('#pwErr').html("");
				}
			});
						
			$("#ulog,#pwdlog").keyup(function(){
				if(($('#ulog').val()!='') && (regUn.test($('#ulog').val()))){	
					if(($('#pwdlog').val()!='') && (regPw.test($('#pwdlog').val()))){		
						$("#loginbtn").attr("disabled",false);
					}
					else {
						$("#loginbtn").attr("disabled",true);
					}
				}
				else {
					$("#loginbtn").attr("disabled",true);
				}
			});
			
		});
		
		//endregion
		</script>
	</body>
</html>