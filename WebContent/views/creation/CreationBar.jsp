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
	<a href="<s:url action='retourIndex' />" class="col-md-offset-1">Retour
		à l'index</a>
</div>

<script>
	var str = '';
	var h = 24;
	var horaireDebut = '';
	var horaireFin = '';
	var cloneDebut;
	var cloneFin;
	var cloneJour;
	var leJour = '';
	var hiddenJour = '';

	for (var i = 0; i < h; i++) {
		horaireDebut += '<option value="' + i + ':00">' + i
				+ ':00</option>';
		horaireDebut += '<option value="' + i + ':30">' + i
				+ ':30</option>';
		horaireFin += '<option value="' + i + ':00">' + i + ':00</option>';
		horaireFin += '<option value="' + i + ':30">' + i + ':30</option>';
	}

	var selectHoraireDebut = '<select class="horaireDebut" name="horaireDebut">'
			+ horaireDebut + '</select>';
	var selectHoraireFin = '<select class="horaireFin" name="horaireFin">'
			+ horaireFin + '</select>';

	var checkboxFerme = '<input type="checkbox" name="ferme" class="boutonFerme" />';
	var boutonPlus = '<input type="button" class="boutonPlusHoraires" value="+" />';
	var boutonMoins = '<input type="button" class="boutonMoinsHoraires" value="-" />';

	var inputHoraire = '<s:iterator value="lstJours"><tr><td><input type="hidden" class="jour" value="<s:property value="idJour"/>"/><span><s:property value="jour"/></span></td><td>'
			+ selectHoraireDebut
			+ '</td><td>'
			+ selectHoraireFin
			+ '</td><td>'
			+ boutonPlus
			+ boutonMoins
			+ '</td><td>'
			+ checkboxFerme + '</td></tr></s:iterator>';

	var inputHoraireTousLesJours = '<tr><td>Tous les jours</td><td id="selectDebutTousLesJours">'
			+ selectHoraireDebut
			+ '</td><td id="selectFinTousLesJours">'
			+ selectHoraireFin + '</td><td></td><td></td></tr>';

	var str = inputHoraire + inputHoraireTousLesJours;

	$(function() {
		$('#inputHoraires').html(str);

		$('.boutonPlusHoraires').click(plusHoraires);
		$('.boutonMoinsHoraires').click(moinsHoraires);
		$('.boutonFerme').click(fermeAction);
		$('#selectDebutTousLesJours').children().change(
				changeTousLesHorairesDebut);
		$('#selectFinTousLesJours').children().change(
				changeTousLesHorairesFin);

		$('#addBar').submit(function() {
			var szJour = '';
			var szHeureDebut = '';
			var szHeureFin = '';
			$.each($('.jour'), function(index, elt) {
				szJour += $(elt).val() + ',';
			});
			$.each($('.horaireDebut'), function(index, elt) {
				szHeureDebut += $(elt).val() + ',';
			});
			$.each($('.horaireFin'), function(index, elt) {
				szHeureFin += $(elt).val() + ',';
			});
			alert(szJour);
		});

		$('#idJour').val(szJour);
		$('#idHeureDebut').val(szHeureDebut);
		$('#idHeureFin').val(szHeureFin);
	});

	function fermeAction() {
		if ($(this).is(':checked')) {
			$(this).parent().parent().children(":nth-child(1)").children(
					"input").prop("disabled", true).addClass("ferme")
					.removeClass("jour");
			$(this).parent().parent().children(":nth-child(2)").children(
					"select").prop("disabled", true).addClass("ferme")
					.removeClass("horaireDebut");
			$(this).parent().parent().children(":nth-child(3)").children(
					"select").prop("disabled", true).addClass("ferme")
					.removeClass("horaireFin");
		}
		if (!$(this).is(':checked')) {
			$(this).parent().parent().children(":nth-child(1)").children(
					"input").prop("disabled", true).addClass("jour")
					.removeClass("ferme");
			$(this).parent().parent().children(":nth-child(2)").children(
					"select").prop("disabled", false).addClass(
					"horaireDebut").removeClass("ferme");
			$(this).parent().parent().children(":nth-child(3)").children(
					"select").prop("disabled", false)
					.addClass("horaireFin").removeClass("ferme");
		}
	}

	function changeTousLesHorairesDebut() {
		var heureDebut = $('#selectDebutTousLesJours').children().val();
		$(".horaireDebut").val(heureDebut);
	}

	function changeTousLesHorairesFin() {
		var heureFin = $('#selectFinTousLesJours').children().val();
		$(".horaireFin").val(heureFin);
	}

	function plusHoraires() {

		var nbChampsHoraire = $(this).parent().parent().children(
				":nth-child(2)").children("select").length;
		if (nbChampsHoraire == 1) {
			cloneDebut = $(this).parent().parent()
					.children(":nth-child(2)").children();
			cloneFin = $(this).parent().parent().children(":nth-child(3)")
					.children();
			cloneJour = $(this).parent().parent().children(":nth-child(1)")
					.children("input");
		}

		cloneDebut.parent().append('<br />');
		cloneDebut.clone().appendTo(cloneDebut.parent());

		cloneFin.parent().append('<br />');
		cloneFin.clone().appendTo(cloneFin.parent());

		cloneJour.clone().appendTo(cloneJour.parent());
	}

	function moinsHoraires() {
		var nbChampsHoraire = $(this).parent().parent().children(
				":nth-child(2)").children("select").length;
		if (nbChampsHoraire != 1) {
			idJour = $(this).parent().parent().children(":nth-child(1)")
					.children(":nth-child(1)").val();
			leJour = $(this).parent().parent().children(":nth-child(1)")
					.children(":nth-child(2)").html();
			hiddenJour = '<input type="hidden" class="jour" value="'+idJour+'"/><span>'
					+ leJour + '</span>';
			$(this).parent().parent().children(":nth-child(1)").html(
					hiddenJour);
			$(this).parent().parent().children(":nth-child(2)").html(
					selectHoraireDebut);
			$(this).parent().parent().children(":nth-child(3)").html(
					selectHoraireFin);
		}
	}
</script>