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
				
					<!-- <label for="nomeSignUp">Nome:</label> -->
					<input type="text" class="inputRound" name="nome" id="nomeSignUp" placeholder="Inserisci nome" required/><br/>
					
<!-- 					<label for="cognSignUp">Cognome:</label> -->
					<input type="text" class="inputRound" name="cognome" id="cognSignUp" placeholder="Inserisci cognome" required/><br/>		
				
					<!-- <label for="indSignUp">Indirizzo:</label> -->
					<input type="text" class="inputRound" name="indirizzo" id="indSignUp" placeholder="Inserisci indirizzo" required/><br/>		
				
<!-- 					<label for="telSignUp">Telefono:</label> -->
					<input type="text" class="inputRound" name="telefono" id="telSignUp" placeholder="Inserisci telefono" required/><br/>
					<span id="telErr"></span>
					
<!-- 					<label for="cfSignUp">Codice fiscale:</label> -->
					<input type="text" class="inputRound" name="cf" id="cfSignUp" placeholder="Inserisci codice fiscale" required/><br/>
					<span id="cfErr"></span>
					
				</div>
				<div class="col-sm-6 col-md-6 col-lg-6">
					
						<p>Credenziali</p>
<!-- 					<label for="unSignUp">Username:</label>	 -->
					<input type="text" class="inputRound" name="un" id="unSignUp" placeholder="Inserisci username" required/><br/>		
					<span id="unErr"></span>
					
<!-- 					<label for="emailSignUp">E-mail:</label> -->
					<input type="text" class="inputRound" name="email" id="emailSignUp" placeholder="Inserisci e-mail" required/><br/>
					<span id="emailErr"></span>
					
<!-- 					<label for="pwSignUp">Password</label> -->
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
		
		<script>
		
		//uppercase del cf region
		
			var input = document.getElementById('cfSignUp');
	
			input.onkeyup = function(){
			    this.value = this.value.toUpperCase();
			}
			
		//endregion		
		
		
		//fields validation region
		
		$('document').ready(function(){
			const regEm = new RegExp('(?:[a-z0-9!#$%&\'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&\'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\\])');
			const regUn = new RegExp('^.{6,}$');
			const regPw = new RegExp('^.{8,}$');
			const regTel = new RegExp(/^\d{8,12}$/);
			const regCf = new RegExp('^[A-Z]{6}[0-9]{2}[A-Z]{1}[0-9]{2}[A-Z]{1}[0-9]{3}[A-Z]{1}$');
			
			let emailEx = false;
			
			$('#unSignUp').keyup(function(){ //change firing only on blur
				if(regUn.test(this.value)){
					$('#unErr').html('');
				}
			});

			$("#unSignUp").blur(function(){
				if((this.value != '') && (regUn.test(this.value) == false)) {
					$('#unErr').html("L'username dev'essere lungo almeno 6 caratteri<br/>");
				} else {
					$('#unErr').html("");
				}
			});
			
			$('#emailSignUp').keyup(function(){
				if(regEm.test(this.value)){
					$('#emailErr').html('');
				}
			});

			$("#emailSignUp").blur(function(){
				var s=this.value;			
				if((this.value != '') && (regEm.test(this.value) == false)) {
					$('#emailErr').html("E-mail non valida <br/>");
				}else if(this.value != '') {
					var xhr=new XMLHttpRequest();					
					xhr.open("post", "verifica_email", true);					
					xhr.setRequestHeader("content-type", "application/json");
					xhr.onreadystatechange=function(){
						if(xhr.readyState==4){
							if (xhr.status==200){								
								//tutto ok
								$('#emailErr').html("");
								emailEx=false;
							}
							else if(xhr.status==412){
								$('#emailErr').html("L' email è già presente")
								emailEx=true;
							}
							else{
								$('#emailErr').html("Errore server, riprova più tardi");
							}
						}	
					}
					var data={email: $("#emailSignUp").val()};
					data = JSON.stringify(data);
					xhr.send(data);									
				}
			});
			
			$('#pwSignUp').keyup(function(){
				if(regPw.test(this.value)){
					$('#pwErr').html('');
				}
			});

			$("#pwSignUp").blur(function(){
				if((this.value != '') && (regPw.test(this.value) == false)) {
					$('#pwErr').html("La password dev'essere lunga almeno 8 caratteri<br/>");
				} else {
					$('#pwErr').html("");
				}
			});
			
			$("#telSignUp").keyup(function(){
				if(regTel.test(this.value)){
					$("#telErr").html('');
				}
			});
			
			$("#telSignUp").blur(function(){
				if((this.value != '') && (regTel.test(this.value) == false)){
					$("#telErr").html("Il numero di telefono deve contenere tra le 8 e le 12 cifre numeriche <br/>");
				}else{
					$("#telErr").html("");
				}
			});
			
			$("#cfSignUp").keyup(function(){
				if(regCf.test(this.value)){
					$("#cfErr").html('');
				}
			});
			
			$("#cfSignUp").blur(function(){
				if((this.value!='') && (regCf.test(this.value) == false)){
					$("#cfErr").html("Codice fiscale non valido <br/>");
				}else{
					$("#cfErr").html("");
				}
			});
			
			$("#unSignUp, #emailSignUp, #pwSignUp, #telSignUp, #cfSignUp" ).keyup(function(){
				if(($('#unSignUp').val()!='') && (regUn.test($('#unSignUp').val()))){
					if(($('#emailSignUp').val()!='') && (regEm.test($('#emailSignUp').val()))){
						if(($('#pwSignUp').val()!='') && (regPw.test($('#pwSignUp').val()))){
							if(($("telSignUp").val()!='') && (regTel.test($("#telSignUp").val()))){
								if(($("cfSignUp").val()!='') && (regCf.test($("#cfSignUp").val()))){
									if(($('#emailSignUp').val()!='') && !emailEx){
										$("#btnSignUp").attr("disabled",false);
									}
									else {
										$("#btnSignUp").attr("disabled",true);
									}
								}
								else {
									$("#btnSignUp").attr("disabled",true);
								}
							}
							else {
								$("#btnSignUp").attr("disabled",true);
							}
						}
						else {
							$("#btnSignUp").attr("disabled",true);
						}
					}
					else {
						$("#btnSignUp").attr("disabled",true);
					}
				}
				else {
					$("#btnSignUp").attr("disabled",true);
				}
			});
			
		});
		
		//endregion
		</script>
	</body>
</html>
