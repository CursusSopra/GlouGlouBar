var map; //<-- This is now available to both event listeners and the initialize() function
function initialize() {
  var mapOptions = {
   center: new google.maps.LatLng(45.7,4.882715),
   zoom: 15,
   mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);
}
google.maps.event.addDomListener(window, 'load', initialize);
google.maps.event.addDomListener(window, "resize", function() {
 var center = map.getCenter();
 google.maps.event.trigger(map, "resize");
 map.setCenter(center); 
});

var geocoder = new google.maps.Geocoder();
var address = document.getElementById("address").value;
geocoder.geocode( { 'address': address}, function(results, status) {
  if (status == google.maps.GeocoderStatus.OK)
  {
      // do something with the geocoded result
      //
      // results[0].geometry.location.latitude
      // results[0].geometry.location.longitude
  }
});