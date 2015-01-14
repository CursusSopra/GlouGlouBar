<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title><tiles:getAsString name="title" /></title>
<link href="_css/FifaWorldCup.css" rel="stylesheet" />
<link rel="icon" type="image/x-icon" href="favicon.ico" />
<script src="js/star-rating.min.js" type="text/javascript"></script>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet">
<link href="js/star-rating.min.css" media="all" rel="stylesheet"
	type="text/css" />
<style type="text/css">
.linkStyle:link {
	color: #000;
}

.linkStyle:visited {
	color: #000;
}

.linkStyle:active {
	color: #000;
}

.linkStyle:hover {
	color: #000;
	text-decoration: none;
}
</style>
</head>
<body>
<img src="content/images/glouglou.jpg"/>
	<div class="container">
		<h1>
			<img src="_logo/FifaWorldCupBrasil.png" />
		</h1>
		<div class="navbar navbar-inverse">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-responsive-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

			</div>
			<div class="navbar-collapse collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li></li>
					<li></li>
					<li><a href="#">FAQ</a></li>
					<li><a href="#">Conditions légales</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Mon espace</a></li>
					<li><a href="#">Nous contacter</a></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-offset-2 col-sm-offset-2 col-lg-8 col-sm-8">
				<section class="content-wrapper main-content clear-fix">
					<tiles:insertAttribute name="body" />
				</section>
			</div>
		</div>
	</div>

	<script src="js/jQuery/jquery-2.1.1.min.js"></script>
</body>
</html>