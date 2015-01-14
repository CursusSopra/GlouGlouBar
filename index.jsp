<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.css" rel="stylesheet">

<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script src="js/star-rating.min.js" type="text/javascript"></script>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">
<link href="js/star-rating.min.css" media="all" rel="stylesheet" type="text/css" />
<link href="css/glouglouStyle.css" type="text/css" rel="stylesheet"/>

<title>Index</title>

</head>
<body>
<img src="content/images/glouglou.jpg"/>
	<div class="row" style="margin-top: 50px; margin-left: 50px;">

		<s:iterator value="lstBars">

			<s:url action="detailsBar" var="db">
				<s:param name="idBar">
					<s:property value="idBar" />
				</s:param>
			</s:url>
			<div class="vignette col-lg-3 col-sm-4">
				<a href="<s:property value='#db'/>" class="linkStyle"> <img
					src="<s:property value="lienImage"/>" class="vignetteImage" 
					title="<s:property value="nom" />" />

					<p class="lead">
						<s:property value="nom" />
					</p> <input name="accueil" id="<s:property value="idBar" />"
					type="number" class="rating" min=0 max=5 step=0.1 data-size="sm"
					data-rtl="false" value="<s:property value="lstNotes[4]" />"
					data-show-caption="false" data-show-clear="false"
					data-read-only="true" data-hover-enabled="false" />
					<h5>
						<s:property value="shortDescription" />
					</h5>
				</a>
			</div>

		</s:iterator>
	
	</div>
	<a href="<s:url action='creationBar' />">Création d'un nouveau bar</a>
</body>
</html>