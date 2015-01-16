
$(function() {
	$('#addEval').submit(function() {
		var str1 = "";
		$.each($('.rating'), function(index, elt) {
			str1 += $(elt).val() + ',';
		});

		var str2 = "";
		$.each($('.critnumber'), function(index, elt) {
			str2 += $(elt).val() + ',';
		});

		$('#idNotes').val(str1);
		$('#idCriteres').val(str2);
	});
});