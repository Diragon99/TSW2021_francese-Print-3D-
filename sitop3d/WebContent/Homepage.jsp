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

<body id="home">
<div>
	<%@ include file="/Fragments/Header.html"%>
</div>
<div id="homeCont">
	
	<div id="slogan">
		<img src="./img/Slogan.png" alt="Slogan.png"/>
	</div>
	<div class="container-fluid">
		<div class="row flex-direction-row">
			<div class="col-sm-6 col-md-6 col-lg-6">
				<p>I prodotti più venduti</p>
				<div id="carousel">
					<!-- Slideshow container -->
<div class="slideshow-container">

  <!-- Full-width images with number and caption text -->
  <div class="mySlides fade">
    <div class="numbertext">1 / 3</div>
   	 <div id="altair"></div>
    <div class="text">Action figure: Altair</div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">2 / 3</div>
	    <div id="falcon"></div>
    <div class="text text-secondary">Modellino: Millennium Falcon</div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">3 / 3</div>
	    <div id="chess"></div>
    <div class="text">Giocattoli: Scacchi</div>
  </div>
</div>
<br>

<!-- The dots/circles -->
<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span>
  <span class="dot" onclick="currentSlide(2)"></span>
  <span class="dot" onclick="currentSlide(3)"></span>
</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-6 col-lg-6">
				<p>Categorie in evidenza</p>
				<div class="row">
					<div class='zoomContainer col-md-6'>
						<div class="categories zoom" id="toys">
							<p class="showOnHover">Giocattoli</p>
						</div>
					</div>
					
					<div class='zoomContainer col-md-6'>
						<div class="categories zoom" id="accessories">
							<p class="showOnHover">Accessori</p>
						</div>
					</div>
					
					<div class='zoomContainer col-md-6'>
						<div class="categories zoom" id="figures">
							<p class="showOnHover">Figures</p>
						</div>
					</div>
					
					<div class='zoomContainer col-md-6'>
						<div class="categories zoom" id="arch">
							<p class="showOnHover">Architettura</p>
						</div>
					</div>
				</div>
			</div>
		
		</div>
	</div>
</div>
<div class="autoSpacer"></div>
<div>
	<%@ include file="/Fragments/Footer.html"%>
</div>

<script>
var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
}
</script>
</body>
</html>