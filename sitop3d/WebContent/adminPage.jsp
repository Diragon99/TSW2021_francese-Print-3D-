<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,com.print.model.ProductBean,com.print.model.Cart"%>
<head>
	<title>Admin</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css\style.css?version=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body id="admin">
<div>
	<%@ include file="/Fragments/Header.html"%>
</div>
<div id="od" class="marginTop">
	<a href="catalogView.jsp">Catalogo</a><br/><br/><br/>
	<div id="id">
		<form action="admin?action=add_product" method="post" enctype="multipart/form-data">
			<input type="text" class="inputRound" name="nome" id="nome" placeholder="Nome prodotto"><br>
			<input type="text" class="inputRound" name="prezzo_netto" id="prezzo_netto" placeholder="Prezzo netto"><br>
			<input type="text" class="inputRound" name="categoria" id="categoria" placeholder="Categoria prodotto"><br>
			<input type="text" class="inputRound" name="iva" id="iva" placeholder="Iva"><br>
			<label for="disponibile">Disponibile</label>
			<input type= "radio" name="disponibile" id="disponibile"  value="si"><br>
			<label for="new_address">Non disponibile</label>
			<input type="radio" name="disponibile" id="non_disponibile"  value="no"><br>
			<textarea class="inputRound" name="descrizione" id="descrizione" placeholder="Descrizione" ></textarea><br>
			<input type="file" name="Immagine" id="img"	multiple accept="image/*">
			<input type="submit" value="Aggiungi">
		</form>
	</div>
</div>
<div class="autoSpacer"></div>
<div>
	<%@ include file="/Fragments/Footer.html"%>
</div>
</body>
</html>