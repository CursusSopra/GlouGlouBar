<%@ taglib prefix="s" uri="/struts-tags"%>


	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-7">
			<div class="panel panel-primary">
				<div class="panel-heading" style="text-align: center">

					<b><font size="20px" face="Mistral"> <s:property
								value="leBar.nom.toUpperCase()" />
					</font></b> <img class="tailleimage" src="<s:property value="leBar.lienImage"/>" />


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
						
							<s:property value="libCourt" />
							<input disabled="true" type="number" class="rating " min=0 max=5
								step=1 data-size="sm" data-rtl="false"
								value="<s:property value="note"/>" data-show-caption="false"
								data-show-clear="false" data-read-only="true"
								data-hover-enabled="false" />
							
						</s:iterator>

					</div>
					
					<div class="col-md-3">
						<a href="<s:url action='' />">Retour aux bars</a>
						<br/>
						<br/>

						<s:url action="formAddEval" var="GoToformEval">
							<s:param name="idBar">
								<s:property value="idBar" />
							</s:param>
						</s:url>

						<a href="<s:property value='#GoToformEval'/> "> Donnez votre
							avis </a>
						<br/>
						<br/>

						<s:url action="modifyBar" var="GoToFormModify">
							<s:param name="idBar">
								<s:property value="idBar" />
							</s:param>
						</s:url>

						<a href="<s:property value='GoToFormModify'/> "> Modifiez les informations </a>
					
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
					<div style="width: 300px; height: 300px;">
						<div id="map-canvas" style="width: 100%; height: 100%;"></div>
					</div>

				<br/>

				<s:property value="leBar.nom" />
				<br/>
				<s:property value="leBar.voie" />
				<br/>
				<s:property value="leBar.cp" />
				<s:property value="leBar.ville" />
				<br/> <br/>
				<s:property value="leBar.numTel" />
				<br/> <br/>
				<s:property value="leBar.site" />
				<br/>
				
				</div>
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
		<div class="panel panel-info">
			<div class="col-lg-offset-3 col-lg-6 col-sm-offset-3 col-sm-6">
				<section class="content-wrapper main-content clear-fix">
					<form method="post" id="addEval" class="form-horizontal" action="<s:url action='addEval' />">
			
						<s:iterator value="lstCriteresEval" status="idx">

							<label class="col-lg-4 control-label"> <s:property
								value="libcourt" />
							</label>
							<input class="critnumber" type="hidden"
								value='<s:property value="idcriteval" />' />
							<input type="number" id='"<s:property value="libcourt" />" '
								class="rating" min=0 max=5 step=1 data-size="sm" data-rtl="false" />
						</s:iterator>

						<input type="hidden" name="idBar" id="ididBar"
							value='<s:property value="idBar" />' /> <input type="hidden"
							name="idNotes" id="idNotes" /> <input type="hidden"
							name="idCriteres" id="idCriteres" />

						<fieldset>
							<div class="form-group">
								<div class="col-lg-4">
									<div class="row">
										<div class="col-lg-6 col-lg-offset-10">
											<br> <br> <label for="idCommentaire"
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
						<button type="submit" id="test" class="btn btn-primary btn-center">
							<span class="glyphicon glyphicon-ok"></span> Mettre à jour
						</button>
					</div>
				</div>
			</form>
		</section>
	</div>
</div>
</div>


	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-7">
			<div class="panel panel-info">
				<div class="panel-heading" style="text-align: center">
					<h2>
						L'avis des internautes
					</h2>
				</div>
				
				<div class="panel-body">
					<s:iterator value="leBar.lstComms">
					
						<s:property value="dateComm"/>
						
							<input disabled="true" type="number" class="rating " min=0 max=5
								step=1 data-size="sm" data-rtl="false"
								value="<s:property value="note"/>" data-show-caption="false"
								data-show-clear="false" data-read-only="true"
								data-hover-enabled="false" />
							
							<s:property value="comm"/>
							<br/>
							<br/>
							
					</s:iterator> 
				
				</div>
			</div>
		</div>
	</div>
