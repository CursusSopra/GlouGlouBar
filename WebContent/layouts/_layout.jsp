<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link href="css/star-rating.min.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="_css/glouglouStyle.css" media="all" rel="stylesheet"
	type="text/css" />

<tiles:useAttribute name="moreStyles" scope="request" ignore="true" />
<c:if test="${not empty moreStyles}">
	<c:forEach items="${moreStyles}" var="cssFile">
		<link href="./${cssFile}" media="all" rel="stylesheet" type="text/css" />
	</c:forEach>
</c:if>

<tiles:useAttribute name="moreHttpStyles" scope="request" ignore="true" />
<c:if test="${not empty moreHttpStyles}">
	<c:forEach items="${moreHttpStyles}" var="cssFile">
		<link href="./${cssFile}" media="all" rel="stylesheet" type="text/css" />
	</c:forEach>
</c:if>
<title><tiles:getAsString name="title" /></title>
</head>
<body>
	<img class="imgtop" src="content/images/glougloulogo.jpg"
		width="300px;" height="60px;" />
	<div class="container-fluid">

		<nav class="navbar navbar-default">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<s:url action='' />">Accueil</a> <a
					class="navbar-brand navbar-center"
					href="<s:url action='creationBar' />">Créer un bar</a> <a
					class="navbar-brand" href="<s:url action='formSearchBar' />">Rechercher
					un bar</a>
			</div>

			<form class="navbar-form navbar-right" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>

			<!-- /.navbar-collapse -->
		</nav>
		<div class="row">
			<div class="col-lg-12 col-sm-12">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/star-rating.min.js"></script>

	<tiles:useAttribute name="moreHttpScripts" scope="request"
		ignore="true" />
	<c:if test="${not empty moreHttpScripts}">
		<c:forEach items="${moreHttpScripts}" var="jsFile">
			<script type="text/javascript" src="${jsFile}"></script>
		</c:forEach>
	</c:if>

	<tiles:useAttribute name="moreScripts" scope="request" ignore="true" />
	<c:if test="${not empty moreScripts}">
		<c:forEach items="${moreScripts}" var="jsFile">
			<script type="text/javascript" src="./${jsFile}"></script>
		</c:forEach>
	</c:if>

</body>
</html>
