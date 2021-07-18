
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