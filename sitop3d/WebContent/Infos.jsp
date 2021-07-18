<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,com.print.model.ProductBean,com.print.model.Cart"%>


<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>Print(3D) Info e Contatti</title>
	
	<link rel="stylesheet" type="text/css" href="css\style.css?version=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>

<body id="infosBody">
<div>
	<%@ include file="/Fragments/Header.html"%>
</div>
<div id="infosPage">
	<p class="boldText">I nostri contatti:</p>
	<p><span class="boldText">Diego Contaldi</span> d.contaldi@studenti.unisa.it 0512105713</p>
	<p><span class="boldText">Luigi D'Angelo</span> l.dangelo17@studenti.unisa.it 0512103661</p>
	<p><span class="boldText">Angela Di Stasi</span> a.distasi5@studenti.unisa.it 557000496</p>
</div>
<div class="autoSpacer"></div>
<div>
	<%@ include file="/Fragments/Footer.html"%>
</div>

</body>
</html>