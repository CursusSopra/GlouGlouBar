var str = '';
var h = 24;
var horaireDebut = '';
var horaireFin = '';
var cloneDebut;
var cloneFin;
var cloneJour;
var leJour = '';
var hiddenJour = '';
var inputHoraire ='';

for (var i = 0; i < h; i++) {
	horaireDebut += '<option value="' + i + ':00">' + i + ':00</option>';
	horaireDebut += '<option value="' + i + ':30">' + i + ':30</option>';
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

var inputHoraireTousLesJours = '<tr><td>Tous les jours</td><td id="selectDebutTousLesJours">'
	+ selectHoraireDebut
	+ '</td><td id="selectFinTousLesJours">'
	+ selectHoraireFin + '</td><td></td><td></td></tr>';

$(function() {
	$.getJSON('/Glougloubar/getJSONJours.action', function(data) {
		$('#inputHoraires').html(inputHoraireTousLesJours);
		$.each(data.listeDesJours, function(index, elt) {
			$('#inputHoraires').append('<tr><td><input type="hidden" class="jour" value="'
					+ elt.idJour + '"/><span>' + elt.jour + '</span></td><td>'
					+ selectHoraireDebut + '</td><td>' + selectHoraireFin
					+ '</td><td>' + boutonPlus + boutonMoins + '</td><td>'
					+ checkboxFerme + '</td></tr>');
		});
		
		$('.boutonPlusHoraires').click(plusHoraires);
		$('.boutonMoinsHoraires').click(moinsHoraires);
		$('.boutonFerme').click(fermeAction);
		$('#selectDebutTousLesJours').children().change(changeTousLesHorairesDebut);
		$('#selectFinTousLesJours').children().change(changeTousLesHorairesFin);
	});
	
	

	

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

		$('#idJour').val(szJour);
		$('#idHeureDebut').val(szHeureDebut);
		$('#idHeureFin').val(szHeureFin);
	});
});

function fermeAction() {
	if ($(this).is(':checked')) {
		$(this).parent().parent().children(":nth-child(1)").children("input")
				.prop("disabled", true).addClass("ferme").removeClass("jour");
		$(this).parent().parent().children(":nth-child(2)").children("select")
				.prop("disabled", true).addClass("ferme").removeClass(
						"horaireDebut");
		$(this).parent().parent().children(":nth-child(3)").children("select")
				.prop("disabled", true).addClass("ferme").removeClass(
						"horaireFin");
	}
	if (!$(this).is(':checked')) {
		$(this).parent().parent().children(":nth-child(1)").children("input")
				.prop("disabled", true).addClass("jour").removeClass("ferme");
		$(this).parent().parent().children(":nth-child(2)").children("select")
				.prop("disabled", false).addClass("horaireDebut").removeClass(
						"ferme");
		$(this).parent().parent().children(":nth-child(3)").children("select")
				.prop("disabled", false).addClass("horaireFin").removeClass(
						"ferme");
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

	var nbChampsHoraire = $(this).parent().parent().children(":nth-child(2)")
			.children("select").length;
	if (nbChampsHoraire == 1) {
		cloneDebut = $(this).parent().parent().children(":nth-child(2)")
				.children();
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
	var nbChampsHoraire = $(this).parent().parent().children(":nth-child(2)")
			.children("select").length;
	if (nbChampsHoraire != 1) {
		idJour = $(this).parent().parent().children(":nth-child(1)").children(
				":nth-child(1)").val();
		leJour = $(this).parent().parent().children(":nth-child(1)").children(
				":nth-child(2)").html();
		hiddenJour = '<input type="hidden" class="jour" value="' + idJour
				+ '"/><span>' + leJour + '</span>';
		$(this).parent().parent().children(":nth-child(1)").html(hiddenJour);
		$(this).parent().parent().children(":nth-child(2)").html(
				selectHoraireDebut);
		$(this).parent().parent().children(":nth-child(3)").html(
				selectHoraireFin);
	}
}