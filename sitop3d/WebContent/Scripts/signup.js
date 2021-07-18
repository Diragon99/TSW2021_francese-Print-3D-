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
				var p=this.value;
				if((this.value != '') && (regTel.test(this.value) == false)){
					$("#telErr").html("Il numero di telefono deve contenere tra le 8 e le 12 cifre numeriche <br/>");
				}else if(this.value != '') {
					var xhr=new XMLHttpRequest();					
					xhr.open("post", "verifica_telefono", true);					
					xhr.setRequestHeader("content-type", "application/json");
					xhr.onreadystatechange=function(){
						if(xhr.readyState==4){
							if (xhr.status==200){								
								//tutto ok
								$('#telErr').html("");
								telEx=false;
							}
							else if(xhr.status==412){
								$('#telErr').html("Numero di telefono già presente")
								telEx=true;
							}
							else{
								$('#telErr').html("Errore server, riprova più tardi");
							}
						}	
					}
					var data={email: $("#telSignUp").val()};
					data = JSON.stringify(data);
					xhr.send(data);									
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
									if(!emailEx){
										if(!telEx){
											$("#btnSignUp").attr("disabled",false);
										}
										else{
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
				}
				else {
					$("#btnSignUp").attr("disabled",true);
				}
			});
			
		});
		
		//endregion