<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--  http://localhost:8080/Glougloubar/rechercheBar.action  -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rechercher un bar</title>



</head>
<body>
	<p>
		<em>Localisation</em>
	</p>
	<div class="form-group">
		<form id="idSearchCP" class="form-horizontal" method="post"
			action="<s:url action='searchByCP'/>">

			<s:iterator value="lstVilles">
				<input type="checkbox" name="cpSelected" value="<s:property value="cp"/>" />
				<s:property value="ville"/>
			</s:iterator>
			
			<p>
				<em>Type de bar</em>
			</p>

			<s:iterator value="lstCategories">
				<input type="checkbox" name="catSelected" value="<s:property value="idCategorie" />" />
				<s:property value="categorieBar" />
			</s:iterator>
			<br/>
			Adresse:<input class="form-control" id="idAdresse" name="adresse" /> 
			<br/>
			Nom<input
				class="form-control" id="idNom" name="nom" />
				
			<s:iterator value="lstCriteres">
				<input type="checkbox" name="selectedCritere"
					value="<s:property value="idCritere"/>">
				<s:property value="critere" />
			</s:iterator>
				
	
			<br><br><br><br>
			<div class="col-lg-4">
				<button type="submit" id="test" class="btn btn-primary btn-center">
					<span class="glyphicon glyphicon-ok"></span> Rechercher
				</button>
			</div>
		</form>
	</div>


	<script>
		$(function() {

			$('#loca').submit(function() {
				var sz = "";
				$.each($('.rating'), function(index, elt) {
					sz += $(elt).val() + ',';
				});
				$('#idLib').val(sz);
			});
		});
	</script>

</body>
</html>