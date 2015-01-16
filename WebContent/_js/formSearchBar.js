$(function() {

			$('#loca').submit(function() {
				var sz = "";
				$.each($('.rating'), function(index, elt) {
					sz += $(elt).val() + ',';
				});
				$('#idLib').val(sz);
			});
});