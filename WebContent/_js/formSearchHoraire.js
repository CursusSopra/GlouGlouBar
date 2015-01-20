var horaireDebut = '';
var horaireFin = '';
var h = 24;

for (var i = 0; i < h; i++) {
	horaireDebut += '<option value="' + i + ':00">' + i + ':00</option>';
	horaireDebut += '<option value="' + i + ':30">' + i + ':30</option>';
	horaireFin += '<option value="' + i + ':00">' + i + ':00</option>';
	horaireFin += '<option value="' + i + ':30">' + i + ':30</option>';
}

$(function() {	
	$.getJSON('/Glougloubar/getJSONJours.action', function(data) {
		$.each(data.listeDesJours, function(index, elt) {
			$('#jour').append('<option value=' + elt.idJour + '>' + elt.jour + '</option>');
		});
	});
	
	$('#horaireDebut').append(horaireDebut);
	$('#horaireFin').append(horaireFin);
});