<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	  <ol class="carousel-indicators">
	    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	  </ol>
	  <div class="carousel-inner">
	  	<div class="carousel-item active">
	      <img class="d-block w-100" src="img/dd.jpg" height="670px">
	    </div>
	    <div class="carousel-item">
	      <img class="d-block w-100" src="img/img5.jpg" height="670px">
	    </div>
	    <div class="carousel-item">
	      <img class="d-block w-100" src="img/img1.jpg" height="670px">
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>

	<div class="container p-5  style="height: 100vh;">
		<h2 class="text-center">Key Features of our Hospital</h2>

		<div class="row"">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">User-Friendly interface</p>
								<p>A user-friendly Hospital Management System enabling user registration, doctor appointments, and real-time doctor availability updates.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>Committed to a clean, safe, and hygienic environment for a healthier, more comfortable, and stress-free hospital experience with enhanced care and well-being</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Friendly Doctors</p> <p>Experienced, compassionate, and friendly doctors dedicated to your health, comfort, and overall well-being with personalized care, unwavering support, and exceptional medical expertise.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Medical Research</p>  
								<p>Advancing global health through groundbreaking innovation, dedication, and excellence in medical research, striving for new treatments, better healthcare solutions, and scientific discoveries.</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4 p-5">
				<img style="width: 350px; height: 400px;" alt="" src="img/img11.jpg">
			</div>

		</div>
	</div>
<div class="container-fluid p-1 bg-success text-center text-white">
	<p>Developed by <a href="https://drsnpm.github.io/portfolio/" style="text-decoration: none;" class="text-light">Darshan Parameshwar Moger</a></p>
</div>
</body>
</html>