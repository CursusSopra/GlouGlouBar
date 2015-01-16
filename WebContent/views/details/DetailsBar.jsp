<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/glouglouStyle.css" rel="stylesheet">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="css/star-rating.min.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="_css/maps.css" type="text/css" rel="stylesheet" />

<style>

body {
	background-image: url("content/images/background.jpg");
	background-repeat: repeat;
}

</style>

<title>Détails bar</title>

</head>


<body>
	<img src="content/images/glougloulogo.jpg" width="300px;"
		height="60px;" />

	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-7">
			<div class="panel panel-primary">
				<div class="panel-heading" style="text-align: center">

					<b><font size="20px" face="Mistral"> <s:property
								value="leBar.nom.toUpperCase()" />
					</font></b> <img src="<s:property value="leBar.lienImage"/>" width="40%"
						height="40%" />


				</div>
				<div class="panel-body">
					<h3>
						L'avis de <font face="Comic Sans">GlouGlouBar</font>
					</h3>
					<br />
					<s:property value="leBar.description" />
					<br />
				</div>
				<div class="panel-body">
					<div class="col-md-4 col-md-offset-1">
						<s:if test="%{leBar.lstHoraires.size > 0}">
							<table class="table table-striped table-hover"
								style="text-align: center;">
								<thead>
									<tr>
										<th colspan="2" style="text-align: center;">Horaires
											d'ouverture</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="leBar.lstHoraires">
										<tr>
											<td><s:property value="getNomJour()" /></td>
											<td><s:property value="heureDebut.getHours()" />h<s:property
													value="heureDebut.getMinutes()" /> - <s:property
													value="heureFin.getHours()" />h<s:property
													value="heureFin.getMinutes()" /></td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
						</s:if>
					</div>
					
					<div class="col-md-4 col-md-offset-1">
						<s:iterator value="leBar.lstEvals">
							<input disabled="true" type="number" class="rating " min=0 max=5
								step=0.1 data-size="sm" data-rtl="false"
								value="<s:property value="note"/>" data-show-caption="false"
								data-show-clear="false" data-read-only="true"
								data-hover-enabled="false" />
							<s:property value="libCourt" />
						</s:iterator>
					
					</div>
					<a href="<s:url action='' />">Retour aux bars</a>

					<s:url action="formAddEval" var="GoToformEval">
						<s:param name="idBar">
							<s:property value="idBar" />
						</s:param>
					</s:url>

					<a href="<s:property value='#GoToformEval'/> "> Donnez votre
						avis </a>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="panel panel-info">
				<div class="panel-heading" style="text-align: center">
					<font size="4px"><b>Informations pratiques</b> </font>
				</div>
				<div class="panel-body" >
				<div style="width: 300px; height: 300px;">
				<div id="map-canvas" style="width: 100%; height: 100%;"></div>
				</div>


				</div>

				<s:property value="leBar.nom" />
				<br />
				<s:property value="leBar.voie" />
				<br />
				<s:property value="leBar.cp" />
				<s:property value="leBar.ville" />
				<br /> <br />
				<s:property value="leBar.numTel" />
				<br /> <br />
				<s:property value="leBar.site" />
				<br />
			</div>

			<div class="panel panel-info" style="margin-right: 20px;">
				<div class="panel-heading" style="text-align: center">
					<font size="4px"><b>Caractéristiques</b> </font>
				</div>

				<div class="panel-body">
					<ul>
						<s:iterator value="leBar.lstCategorie">
							<li><s:property value="categorieBar" /></li>
						</s:iterator>

						<s:iterator value="leBar.lstCritere">
							<li><s:property value="critere" /></li>
						</s:iterator>

					</ul>
				</div>
			</div>

		</div>
	</div>



	<!-- Partie Ajout Evaluation -->



	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-7">
			<div class="panel panel-info">
				<div class="panel-heading" style="text-align: center">
					<h2>
						Votre avis sur
						<s:property value="leBar.nom" />
					</h2>
				</div>
				<div class="panel-body">

					<section class="content-wrapper main-content clear-fix">
						<form id="addEval" class="form-horizontal" method="post"
							action="<s:url action='addEval'/>">

							<s:iterator value="lstCriteresEval" status="idx">

								<label class="col-lg-4 control-label"> <s:property
										value="libcourt" />
								</label>
								<input type="number" id='"<s:property value="libcourt" />" '
									class="rating" min=0 max=5 step=1 data-size="xs"
									data-rtl="false" />

							</s:iterator>

							<input type="hidden" name="idBar" id="ididBar"
								value='<s:property value="idBar" />' /> <input type="hidden"
								name="idLib" id="idLib" />

							<fieldset>
								<div class="form-group">
									<div class="col-lg-4">
										<div class="row">
											<div class="col-lg-6">
												<br /> <br /> <label for="idCommentaire"
													class="col-lg-4 control-label">Commentaire</label> <input
													class="form-control" id="idCommentaire" name="commentaire" />
											</div>
											<div class="col-lg-6">&nbsp;</div>
										</div>
									</div>
								</div>
							</fieldset>

							<div class="form-group">
								<div class="col-lg-4 col-lg-offset-2 col-sm-4 col-sm-offset-2">
									<button type="reset" class="btn btn-default btn-center">
										<span class="glyphicon glyphicon-refresh"></span> État initial
									</button>
								</div>
								<div class="col-lg-4">
									<button type="submit" id="test"
										class="btn btn-primary btn-center">
										<span class="glyphicon glyphicon-ok"></span> Mettre à jour
									</button>
								</div>
							</div>
						</form>
					</section>
				</div>
			</div>
		</div>
	</div>





</body>

<script>
	$(function() {
		$('#addEval').submit(function() {
			var sz = "";
			$.each($('.rating'), function(index, elt) {
				sz += $(elt).val() + ',';
			});
			$('#idLib').val(sz);
		});
	});
</script>

<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCIXm3hVBQgLwOmmsORoaxue1ZSqYx4rc0	"></script>
<script src="_js/maps.js" type="text/javascript"></script>
<script src="js/star-rating.min.js" type="text/javascript"></script>

</html>