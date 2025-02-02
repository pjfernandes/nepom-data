import mapboxgl from '!mapbox-gl';

function buildMapNewPoint() {
  var coords;

  // function getLocation() {
  //   if (navigator.geolocation) {
  //     navigator.geolocation.watchPosition(showPosition);
  //   } else {
  //     coords = "Geolocation is not supported by this browser.";
  //   }
  // }

  // function showPosition(position) {
  //   coords = [position.coords.latitude, position.coords.longitude];

  // }

  if (document.querySelector(".map-edit-point")) {

    const latitude = parseFloat(document.querySelector("#occurrence_latitude").value);
    const longitude = parseFloat(document.querySelector("#occurrence_longitude").value);
    coords = [longitude, latitude];

  } else {

    coords = [-43, -22];
  }

 mapboxgl.accessToken = 'pk.eyJ1IjoicGpmZXJuYW5kZXMiLCJhIjoiY2t1c291Z3lzNWg2bzJvbW5kNWNhbnZhaCJ9.eYxvagOUGuS5qDo-zOfRCA';

  if (document.getElementById("new_point") || document.getElementById("map-new-point")) {
    let map = new mapboxgl.Map({
      container: 'map-new-point',
      style: "mapbox://styles/mapbox/satellite-v9",
      center: coords,
      zoom: 6
    });

    var el = document.createElement('div');
    el.id = 'marker';

    var marker = new mapboxgl.Marker();
    marker
      .setLngLat(coords)
      .addTo(map);

    function add_marker(event) {
      marker.remove()
      var coordinates = event.lngLat;
      document.getElementById("occurrence_longitude").value = coordinates.lng;
      document.getElementById("occurrence_latitude").value = coordinates.lat;
      marker.remove().setLngLat(coordinates).addTo(map);
      var position = document.getElementById("position");
      position.innerHTML = '';
      position.insertAdjacentHTML('beforeend', `<p class="text-info"><i class="fa fa-globe text-secondary"></i> ${coordinates.lat.toFixed(3)}°, ${coordinates.lng.toFixed(3)}°</p>`);

    }

    map.on('click', add_marker);
    return map;
  }
}

export { buildMapNewPoint };
