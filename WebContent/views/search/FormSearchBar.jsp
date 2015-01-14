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
<p><em>Localisation</em></p>
			<div class="form-group">
			<form id="idSearchCP" class="form-horizontal" method="post" 
										action="<s:url action='searchByCP'/>">
			
				<s:iterator value="searchElt.lstCP">
					<input type="checkbox" name="cpSelected"
						value="<s:property />" />
					<s:property  />
				</s:iterator>
				
					<div class="col-lg-4">
					<button type="submit" id="test"	class="btn btn-primary btn-center">
								<span class="glyphicon glyphicon-ok"></span> Rechercher
					</button>
				</form>
			</div>
		
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