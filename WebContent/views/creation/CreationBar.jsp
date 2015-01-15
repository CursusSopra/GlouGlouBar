<%@ taglib prefix="s" uri="/struts-tags"%>

<h1 class="col-md-offset-1">Création bar</h1>
<div class="row">
	<div class="col-md-1"></div>
	<form method="post" class="col-md-10"
		action="<s:url action='addBar' />" id="addBar">

		<div class="form-group">
			<label for="nom">Nom du bar</label> <input type="text"
				class="form-control" id="nom" name="nom"
				placeholder="Entrez le nom du bar">
		</div>
		<div class="form-group">
			<label for="numTel">Numéro de téléphone</label> <input type="text"
				class="form-control" id="numTel" name="numTel"
				placeholder="Entrez le numéro de téléphone">
		</div>
		<div class="form-group">
			<label for="site">Site web</label> <input type="text" name="site"
				class="form-control" id="site" placeholder="Entrez le site web">
		</div>

		<textarea class="form-control" rows="3" name="description">Entrez la description...</textarea>

		<fieldset>
			<legend>Adresse</legend>
			<div class="form-group">
				<label for="voie">Voie</label> <input type="text"
					class="form-control" id="voie" name="voie"
					placeholder="Entrez la voie" />
			</div>
			<div class="form-group">
				<label for="ville">Ville</label> <select class="form-control"
					id="ville" name="ville">
					<s:iterator var="i" value="champVille" status="idx">
						<option value="<s:property />"><s:property /></option>
					</s:iterator>
				</select>
			</div>
		</fieldset>

		<div class="form-group">
			<s:iterator value="lstCategories">
				<input type="checkbox" name="checkboxCategorie"
					value="<s:property value="idCategorie"/>">
				<s:property value="categorieBar" />
			</s:iterator>
		</div>
		<div class="form-group">
			<s:iterator value="lstCriteres">
				<input type="checkbox" name="checkboxCritere"
					value="<s:property value="idCritere"/>">
				<s:property value="critere" />
			</s:iterator>
		</div>

		<fieldset>
			<legend>Horaires</legend>
			<div class="form-group">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Jours</th>
							<th>Heure d'ouverture</th>
							<th>Heure de fermeture</th>
							<th>Ajouter</th>
							<th>Fermé</th>
						</tr>
					</thead>
					<tbody id="inputHoraires">
					</tbody>
				</table>
				<input type="hidden" name="idJour" id="idJour" /> <input
					type="hidden" name="idHeureDebut" id="idHeureDebut" /> <input
					type="hidden" name="idHeureFin" id="idHeureFin" />
			</div>
			<div class="form-group" id="boutonPlusHoraires"></div>
		</fieldset>

		<div class="form-group">
			<button type="reset" class="btn btn-default btn-center">
				<span class="glyphicon glyphicon-refresh"></span> État initial
			</button>
			<button type="submit" id="test" class="btn btn-primary btn-center">
				<span class="glyphicon glyphicon-ok"></span> Créer Bar
			</button>
		</div>
	</form>

	<div class="col-md-1"></div>
</div>
<div class="row">
	<a href="<s:url action='' />" class="col-md-offset-1">Retour
		à l'index</a>
</div>