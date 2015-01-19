google.maps.event.addDomListener(window, 'load', initialize);

// Initialisation à la fin du redimensionnement de la page
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

var initialLocation;
var browserSupportFlag = new Boolean();

function initialize() {
	var myOptions = {
		zoom : 15,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};
	var map = new google.maps.Map(document.getElementById("map_canvas"),
			myOptions);

	// Try W3C Geolocation (Preferred)
	if (navigator.geolocation) {
		browserSupportFlag = true;
		navigator.geolocation.getCurrentPosition(function(position) {
			initialLocation = new google.maps.LatLng(position.coords.latitude,
					position.coords.longitude);
			map.setCenter(initialLocation);

			directionsDisplay = new google.maps.DirectionsRenderer({
				suppressMarkers : true
			});

			var directionsService = new google.maps.DirectionsService();

			end_pos = new google.maps.LatLng(lat, longi);

			var request = {
				origin : initialLocation,
				destination : end_pos,
				travelMode : google.maps.TravelMode.WALKING
			};
			directionsService.route(request, function(result, status) {
				if (status == google.maps.DirectionsStatus.OK) {
					directionsDisplay.setDirections(result);
				}
			});
			directionsDisplay.setMap(map);
			var marker = new google.maps.Marker({
				position : initialLocation,
				map : map,
				title : "Votre position"
			})
			
			var marker = new google.maps.Marker({
				position : end_pos,
				map : map,
				title : mapTitle
			})

		}, function() {
			handleNoGeolocation(browserSupportFlag);
		});
	}
	// Browser doesn't support Geolocation
	else {
		browserSupportFlag = false;
		handleNoGeolocation(browserSupportFlag);
	}

	function handleNoGeolocation(errorFlag) {
		if (errorFlag == true) {
			alert("Geolocation service failed.");
			initialLocation = newyork;
		} else {
			alert("Your browser doesn't support geolocation. We've placed you in Lyon.");
			initialLocation = new google.maps.LatLng(45.75, 4.85);
		}
		map.setCenter(initialLocation);
	}
}