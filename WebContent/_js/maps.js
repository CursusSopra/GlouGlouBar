var map; // <-- This is now available to both event listeners and the
			// initialize() function

function initialize() {

	var geocoder = new google.maps.Geocoder();
	var address = "12 Rue Sainte-Catherine, 69001 Lyon, FRANCE";
	
	geocoder.geocode({
		'address' : address
	}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {

			lat = results[0].geometry.location.lat();
			long = results[0].geometry.location.lng();

			var mapOptions = {
				center : new google.maps.LatLng(lat, long),
				zoom : 15,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
		}
	});

}
google.maps.event.addDomListener(window, 'load', initialize);
google.maps.event.addDomListener(window, "resize", function() {
	var center = map.getCenter();
	google.maps.event.trigger(map, "resize");
	map.setCenter(center);
});
