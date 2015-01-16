<%@ taglib prefix="s" uri="/struts-tags"%>

<h1>Rechercher un bar</h1>

	<div class="form-group">
		<form id="idSearchCP" class="form-horizontal" method="post"	action="<s:url action='searchByCP'/>">

		<p><em>Localisation</em></p>
			<s:iterator value="lstVilles">
				<input type="checkbox" name="cpSelected" value="<s:property value="cp"/>" />
				<s:property value="ville"/>
			</s:iterator>
		<br/><br/>	
		<p><em>Adresse</em></p>
			Adresse : <input class="form-control" id="idAdresse" name="adresse" /> 
			<br/>
			Nom : <input class="form-control" id="idNom" name="nom" />
		<br/><br/>	
		<p><em>Type de bar</em></p>
			<s:iterator value="lstCategories">
				<input type="checkbox" name="catSelected" value="<s:property value="idCategorie" />" />
				<s:property value="categorieBar" />
			</s:iterator>
			<br/>
		<br/>	
		<p><em>Criteres speciaux</em></p>	
			<s:iterator value="lstCriteres">
				<input type="checkbox" name="selectedCritere"
					value="<s:property value="idCritere"/>">
				<s:property value="critere" />
			</s:iterator>
				
	
			<br><br><br>
			<div class="col-lg-4">
				<button type="submit" id="test" class="btn btn-primary btn-center">
					<span class="glyphicon glyphicon-ok"></span> Rechercher
				</button>
			</div>
		</form>
	</div>