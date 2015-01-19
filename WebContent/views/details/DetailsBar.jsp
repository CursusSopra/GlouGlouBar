<%@ taglib prefix="s" uri="/struts-tags"%>


<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-7">
		<div class="panel panel-primary">
			<div class="panel-heading" style="text-align: center">

				<b><font size="20px" face="Mistral"> <s:property
							value="leBar.nom.toUpperCase()" />
				</font></b> <img class="tailleimage"
					src="<s:property value="leBar.lienImage"/>" />


			</div>
			<div class="panel-body">
				<h3>L'avis de GlouGlouBar</h3>
				<br />
				<s:property value="leBar.description" />
				<br />
			</div>
			<div class="panel-body">
				<div class="col-md-4">
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
										<td><s:property value="heureDebut" /> - <s:property
												value="heureFin" /></td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					</s:if>
				</div>

				<div class="col-md-4 col-md-offset-1">
					Résumé des notes :
					<s:property value="leBar.lstComms.size()" /> avis
					<br/><br/>
					
					<s:iterator value="leBar.lstEvals">

						<s:property value="libCourt" />
						<input disabled type="number" class="rating " min=0 max=5 step=1
							data-size="sm" data-rtl="false"
							value="<s:property value="note"/>" data-show-caption="false"
							data-show-clear="false" data-read-only="true"
							data-hover-enabled="false" />

					</s:iterator>

				</div>

				<div class="col-md-3">
					<a href="<s:url action='' />">Retour aux bars</a> <br /> <br />

					<s:url action="formAddEval" var="GoToformEval">
						<s:param name="idBar">
							<s:property value="idBar" />
						</s:param>
					</s:url>
					<s:url action="formAddImage" var="GoToformImage">
						<s:param name="idBar">
							<s:property value="idBar" />
						</s:param>
					</s:url>

					<a href="<s:property value='#GoToformEval'/> "> Donnez votre
						avis </a> <br /> <br />

					<s:url action="modifyBar" var="GoToFormModify">
						<s:param name="idBar">
							<s:property value="idBar" />
						</s:param>
					</s:url>

					<a href="<s:property value='GoToFormModify'/> "> Modifiez les
						informations </a> 
					<br/><br/>	
					<a href="<s:property value='GoToformImage'/> ">
						Ajouter une image </a>

				</div>
			</div>
		</div>
	</div>

	<div class="col-md-3">
		<div class="panel panel-info">
			<div class="panel-heading" style="text-align: center">
				<font size="4px"><b>Informations pratiques</b> </font>
			</div>
			<div class="panel-body">
				<div id="map_container" class="map_container">
					<div id="map_canvas" class="map_canvas"></div>
				</div>
				<br />
				<a href="<s:property value='#dir'/>"><button
							id="buttonDirections">Comment y aller !</button></a> <br />

				<s:property value="leBar.nom" />
				<br />
				<s:property value="leBar.adresse.voie" />
				<br />
				<s:property value="leBar.adresse.ville.cp" />
				<s:property value="leBar.adresse.ville.nom" />
				<br /> <br />
				<s:property value="leBar.numTel" />
				<br /> <br /> <a href="http://<s:property value="leBar.site" />"><s:property
						value="leBar.site" /> </a> <br />

			</div>
		</div>

		<div class="panel panel-info" >
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
				<div class="col-lg-offset-2 col-lg-8 col-sm-offset-2 col-sm-8">
					<section class="content-wrapper main-content clear-fix">
						<form method="post" id="addEval" class="form-horizontal"
							action="<s:url action='addEval' />">

							<s:iterator value="lstCriteresEval" status="idx">

								<label class="col-lg-4 control-label"> <s:property
										value="libcourt" />
								</label>
								<input class="critnumber" type="hidden"
									value='<s:property value="idcriteval" />' />
								<input type="number" id='"<s:property value="libcourt" />" '
									class="rating" min=0 max=5 step=1 data-size="sm"
									data-rtl="false" />
							</s:iterator>

							<input type="hidden" name="idBar" id="ididBar"
								value='<s:property value="idBar" />' /> <input type="hidden"
								name="idNotes" id="idNotes" /> <input type="hidden"
								name="idCriteres" id="idCriteres" />

							<fieldset>
								<div class="form-group">
									<div class="col-lg-5 col-lg-offset-4">
										<div class="row">
											<br> <br> <label for="idCommentaire"
												class="col-lg-4 control-label">Commentaire</label>
												<textarea class="form-control" id="idCommentaire" name="commentaire"
												cols="30" rows="5">
												</textarea>
											<br />
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
</div>

<!-- Partie affichage des commentaires -->

<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-7">
		<div class="panel panel-info">
			<div class="panel-heading" style="text-align: center">
				<h2>L'avis des internautes</h2>
			</div>

			<div class="panel-body">
				<s:iterator value="leBar.lstComms">

					<s:property value="dateComm" />

					<input disabled type="number" class="rating " min=0 max=5 step=1
						data-size="sm" data-rtl="false" value="<s:property value="note"/>"
						data-show-caption="false" data-show-clear="false"
						data-read-only="true" data-hover-enabled="false" />

					<s:property value="comm" />
					<br />
					<br />

				</s:iterator>
			</div>
		</div>
	</div>
</div>

<script>
// var lat = '<s:property value="leBar.adresse.latitude"/>';
// var longi = '<s:property value="leBar.adresse.longitude"/>';
// var mapTitle = '<s:property value="leBar.adresse.longitude"/>';
var lat = <s:property value="leBar.adresse.latitude"/>;
var longi = <s:property value="leBar.adresse.longitude"/>;
var mapTitle = <s:property value="leBar.adresse.longitude"/>;
</script>
