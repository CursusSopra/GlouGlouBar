<!-- Antoine -->

<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="container-fluid">
	<div class="row">
		<h1 class="col-md-offset-1 entete">Ajout d'un super Bar pour les
			copains</h1>
		<div class="col-md-1"></div>
		<form method="post" class="col-md-10"
			action="<s:url action='addBar' />" id="addBar">

			<div class="row form-inline">
				<fieldset class="scheduler-border-crit form-group">
					<legend class="scheduler-border">Bar</legend>
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
				</fieldset>

				<fieldset class="scheduler-border-crit form-group">
					<legend class="scheduler-border">Adresse</legend>
					<div class="form-group">
						<label for="voie">Voie</label> <input type="text"
							class="form-control" id="voie" name="voie"
							placeholder="Entrez la voie" size="50" />
					</div>
					<div class="form-group">
						<label for="ville">Ville</label> <select class="form-control"
							id="ville" name="ville">
							<s:iterator var="i" value="champVille" status="idx">
								<option value="<s:property />"><s:property /></option>
							</s:iterator>
						</select>
					</div>
					<input type="hidden" id="latitude" name="latitude"/>
					<input type="hidden" id="longitude" name="longitude"/>			
				</fieldset>
			</div>
			<div class="row">
				<fieldset class="scheduler-border-crit form-group">
					<legend class="scheduler-border">Description du bar</legend>
					<textarea class="form-control" rows="5" cols="220"
						name="description">Entrez la description...</textarea>
				</fieldset>
			</div>
			<div class="row form-inline">
				<fieldset class="scheduler-border-crit form-group">
					<legend class="scheduler-border">Caractéristiques</legend>
					<div class="table">
						<s:iterator value="lstCriteres">
							<input type="checkbox" name="checkboxCritere"
								value="<s:property value="idCritere"/>">
							<s:property value="critere" />
							<br />
						</s:iterator>
					</div>
				</fieldset>
				<fieldset class="scheduler-border-ctg form-group">
					<legend class="scheduler-border">Type de Bar</legend>
					<div class="table">
						<s:iterator value="lstCategories">
							<input type="checkbox" name="checkboxCategorie"
								value="<s:property value="idCategorie"/>">
							<s:property value="categorieBar" />
							<br />
						</s:iterator>
					</div>
				</fieldset>
				<fieldset class="scheduler-border-horaire form-group">
					<legend class="scheduler-border">Horaires</legend>
					<div class="table">
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
			</div>
		</form>
		<div class="col-md-1"></div>
	</div>
	<div class="row">
		<a href="<s:url action='' />" class="col-md-offset-1"></a>
	</div>
</div>