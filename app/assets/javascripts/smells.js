// Load on page ready...
$(document).ready(function(){
    // define function to get user location
    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(parsePosition);
        }
        // TODO: Add fall-back if user doesn't give location
    }

    // define callback for getCurrentPosition function of getLocation()
    function parsePosition(position) {
        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;
        insertMap(latitude, longitude);
    }

    // Define a function that inserts a map in 'map_canvas' at the user's location
    function insertMap(latitude, longitude) {
        var mapCanvas = document.getElementById('map-canvas');
        var mapOptions = {
            center: new google.maps.LatLng(latitude, longitude),
            zoom: 8,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(mapCanvas, mapOptions)
    }

    getLocation();
});
