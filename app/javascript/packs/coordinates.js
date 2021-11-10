var options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0
};

var coords;
function success(pos) {
        coords = [pos.coords.latitude, pos.coords.longitude];
        // const position = document.getElementById('coords');
        // position.insertAdjacentHTML('beforeend', `<p>${coords[0]} | ${coords[1]}</p>`);
  const teste = document.getElementById('new-form');

  teste.insertAdjacentHTML('beforeend', `<div class="form-group float optional occurrence_latitude">
                                                <label class="float optional" for="occurrence_latitude">Latitude</label>
                                                <input class="form-control numeric float optional" placeholder="Latitude"
                                                type="text" step="any" name="occurrence[latitude]"
                                                id="occurrence_latitude" value=${coords[0]} readonly="readonly" >
                                              </div>`);



  teste.insertAdjacentHTML('beforeend', `<div class="form-group float optional occurrence_longitude">
                                                  <label class="float optional" for="occurrence_longitude">Longitude</label>
                                                  <input class="form-control numeric float optional" placeholder="Longitude"
                                                  type="text" step="any" name="occurrence[longitude]"
                                                  id="occurrence_longitude" value=${coords[1]} readonly="readonly">
                                                </div>`);
  //console.log(coords);
};

function error(err) {
  console.warn('ERROR(' + err.code + '): ' + err.message);
};

navigator.geolocation.getCurrentPosition(success, error, options);

export { success };
