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

			var myLatlng = new google.maps.LatLng(lat,long);
			var mapOptions = {
				center : new google.maps.LatLng(lat, long),
				zoom : 15,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
			var marker = new google.maps.Marker({
			      position: myLatlng,
			      map: map,
			      title: address})
		}
	});

}
google.maps.event.addDomListener(window, 'load', initialize);
google.maps.event.addDomListener(window, "resize", function() {
	var center = $('#map_canvas').getCenter();
	google.maps.event.trigger($('#map_canvas'), "resize");
	$('#map_canvas').setCenter(center);
});

function resizeBootstrapMap() {
    var mapParentWidth = $('#map_container').width();
    $('#map_canvas').width(mapParentWidth);
    $('#map_canvas').height(3 * mapParentWidth / 4);
    console.log($('#map_container').width());
    console.log( $('#map_canvas').width(mapParentWidth));
    google.maps.event.trigger($('#map_canvas'),'resize');
    console.log(mapParentWidth);
}

$(window).resize(resizeBootstrapMap,initialize);
