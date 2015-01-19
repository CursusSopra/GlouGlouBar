<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="back container-fluid">
	<div class="row">
<br/><br/>
<h1 class="entete">Rechercher un bar</h1>
<br/><br/><br/><br/><br/>
	<div class="form-group">
		<form id="idSearchCP" class="form-horizontal" method="post"	action="<s:url action='searchByCP'/>">		
			<div class="scheduler-border">
				<h2 class="titre"><em>Par localisation</em></h2>	
				<fieldset>			
					<div class="col-sm-4 ">
						<h3>Nom</h3>
						<input class="form-control alignfc" id="idNom" name="nom" />
					</div>
				
					<div class="col-sm-4 col-sm-offset-2">
						<h3>Adresse</h3>
						<input class="form-control alignfc " id="idAdresse" name="adresse" /> 
					</div>
				</fieldset>
				

					<div class="form-group text">
						<h3 class="titre">Code Postal</h3>
						<s:iterator value="lstVilles">
							<label ><input class="align" type="checkbox" name="cpSelected" value="<s:property value="cp"/>" /></label>
							<s:property value="nom"/>
						</s:iterator>
					</div>

			</div>
			
			<div class="col-sm-5 scheduler-border">	
			<h2 class="titre"><em>Par critères spéciaux</em></h2>	
				<s:iterator value="lstCriteres">
					<label><input type="checkbox" name="selectedCritere" value="<s:property value="idCritere"/>"></label>
					<s:property value="critere" />
				</s:iterator>
			</div>	
			
			<div class="col-sm-5 scheduler-border">	
			<h2 class="titre"><em>Par types de bar</em></h2>
				<s:iterator value="lstCategories">
					<label><input type="checkbox" name="catSelected" value="<s:property value="idCategorie" />" /></label>
					<s:property value="categorieBar" />
				</s:iterator>
			</div>

			<br><br><br>
			<div class="col-sm-4 ">
				<button type="submit" id="test" class="btn-danger btn btn-primary pull-right">
					<span class="glyphicon glyphicon-ok"></span> Rechercher
				</button>
			</div>
		</form>
	</div>
	</div>
</div>