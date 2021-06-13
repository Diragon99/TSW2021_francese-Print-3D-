<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,com.print.model.ProductBean,com.print.model.Cart"%>


<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>Print(3D) Homepage</title>
	
	<link rel="stylesheet" type="text/css" href="css\style.css?version=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	
</head>

<body>
<div>
	<%@ include file="/Fragments/Header.html"%>
</div>
<div id="home">
	
	<div id="slogan">
		<h2>**Slogan**</h2>
	</div>
	<div class="row flex-direction-row">
		<div class="col-sm-6 col-md-6 col-lg-6">
			<p>I prodotti più venduti</p>
			<div id="carousel">
				<h2>**Carousel**</h2>
			</div>
		</div>
		<div class="col-sm-6 col-md-6 col-lg-6 row flex-direction-row" id="try">
			<p>Categorie in evidenza</p>
			<div class="col-sm-3 col-md-3 col-lg-3 categories">
				<p>**Categoria 1**</p>
			</div>
			<div class="col-sm-3 col-md-3 col-lg-3 categories">
				<p>**Categoria 2**</p>
			</div>
			<div class="col-sm-3 col-md-3 col-lg-3 categories">
				<p>**Categoria 3**</p>
			</div>
			<div class="col-sm-3 col-md-3 col-lg-3 categories">
				<p>**Categoria 4**</p>
			</div>
		</div>
	</div>
</div>
<div>
	<%@ include file="/Fragments/Footer.html"%>
</div>

</body>
</html>