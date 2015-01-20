<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="back container-fluid">
	<div class="row">
<br/><br/>
<h1 class="entete">Rechercher un bar par heure d'ouverture</h1>
	<br/>
	<div class="form-group">
		<form id="idSearchHoraire" class="form-horizontal" method="post"	action="<s:url action='searchByHoraire'/>">		
			<div class="scheduler-border">		
				<div class="col-sm-4 ">
					<label for="jour">Ouvert le </label> 
					<select id="jour" name="jour"><option value="0">Sélectionnez un jour</option></select>
					<br/>
					<label for="horaireDebut">D'au moins </label> 
					<select id="horaireDebut" name="horaireDebut"></select>
					<br/>
					<label for="horaireFin">Jusqu'à au moins</label> 
					<select id="horaireFin" name="horaireFin"></select>
				</div>
			</div>
			<br>
			<div class="col-sm-4 ">
				<button type="submit" id="test" class="btn-danger btn btn-primary pull-right">
					<span class="glyphicon glyphicon-ok"></span> Rechercher
				</button>
			</div>
		</form>
	</div>
	</div>
</div>