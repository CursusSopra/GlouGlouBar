google.maps.event.addDomListener(window, 'load', initialize);

//Initialisation à la fin du redimensionnement de la page
var rtime = new Date(1, 1, 2000, 12,00,00);
var timeout = false;
var delta = 200;
$(window).resize(function() {
    rtime = new Date();
    if (timeout === false) {
        timeout = true;
        setTimeout(resizeend, delta);
    }
});

function resizeend() {
    if (new Date() - rtime < delta) {
        setTimeout(resizeend, delta);
    } else {
        timeout = false;
        initialize();
    }               
}

//Création de la carte

function initialize() {

	var geocoder = new google.maps.Geocoder();
	var address = "12 Rue Sainte-Catherine, 69001 Lyon, FRANCE";
	console.log(lat);
	geocoder.geocode({
		'address' : address
	}, function(results, status) {
		
			var myLatlng = new google.maps.LatLng(lat, longi);
			var mapOptions = {
				center : new google.maps.LatLng(lat, longi),
				zoom : 15,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			map = new google.maps.Map(document.getElementById("map_canvas"),
					mapOptions);
			var marker = new google.maps.Marker({
				position : myLatlng,
				map : map,
				title : mapTitle
			})
		
	});
}