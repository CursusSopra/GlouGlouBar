<!-- Virgile -->

<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="container-fluid">
<div class="row">
	<div class="col-md-3 col-sm-2">
		<div class="panel panel-danger">
			<div class="panel-heading"> Recherche rapide </div>
			
			<div class="panel-body">
			<form id="idSearchCP" class="form-horizontal" method="post"
				action="<s:url action='searchByCP'/>">	
					<h3 class="titre">Code Postal</h3>
					<s:iterator value="lstVilles">
						<label><input class="align" type="checkbox"
							name="cpSelected" value="<s:property value="cp"/>" /></label>
						<s:property value="nom" />
					</s:iterator>
					<br/>
					<button type="submit" id="test"
						class="btn-danger btn btn-primary pull-right btn-xs">
						<span class="glyphicon glyphicon-ok"></span> Rechercher
					</button>
				<div class="row">
					<div class=" col-md-6 col-sm-6">
					<br/>
						<h3 class="titre">
							<em>Par critères spéciaux</em>
						</h3>
						<s:iterator value="lstCriteres">
							<label><input type="checkbox" name="selectedCritere"
								value="<s:property value="idCritere"/>"></label>
							<s:property value="critere" />
							<br />
						</s:iterator>
						<button type="submit" id="test"
							class="btn-danger btn btn-primary pull-right btn-xs">
							<span class="glyphicon glyphicon-ok"></span> Rechercher
						</button>
					</div>
					<div class="col-md-6 col-sm-6">
						<h3 class="titre">
							<em>Par types de bar</em>
						</h3>
						<s:iterator value="lstCategories">
							<label><input type="checkbox" name="catSelected"
								value="<s:property value="idCategorie" />" /></label>
							<s:property value="categorieBar" />
							<br />
						</s:iterator>
						<button type="submit" id="test"
							class="btn-danger btn btn-primary pull-right btn-xs">
							<span class="glyphicon glyphicon-ok"></span> Rechercher
						</button>
					</div>
				</div>
				<input type="hidden" id="idAdresse" name="adresse" /> <input
					type="hidden" id="idAdresse" name="nom" />
			</form>
			</div>
		</div>
	</div>


<div class="row bars">
		<div class="col-md-8 col-sm-10">
			<div class="panel panel-primary panel-danger">
					<div class="panel-heading"">
						Où boire un verre ce soir ?
					</div>
					<div class="panel-body panelbd">
							<s:iterator value="lstBars">
								<s:url action="detailsBar" var="db">
									<s:param name="idBar">
										<s:property value="idBar" />
									</s:param>
								</s:url>
								<div class="vignette col-md-4 col-sm-2">
<!-- 								col-lg-3 col-sm-4 -->
									<a href="<s:property value='#db'/>" class="linkStyle"> <img
										src="<s:property value="mainImage.lien"/>" class="vignetteImage"
										title="<s:property value="nom" />" />
					
										<p class="lead">
											<s:property value="nom" />
										</p> <input id="<s:property value="idBar" />" disabled="true"
										type="number" class="handPointer rating " min=0 max=5 step=0.1
										data-size="sm" data-rtl="false"
										value="<s:property value="lstEvals[4].note" />"
										data-show-caption="false" data-show-clear="false"
										data-read-only="true" data-hover-enabled="false" /> <span
										class="description"> <s:property value="shortDescription" />
									</span>
									</a>
								</div>
							</s:iterator>
	
					</div>
				</div>
			</div>
		</div>
</div>
</div>