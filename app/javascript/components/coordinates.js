const createCoords = () => {

    var options = {
      enableHighAccuracy: true,
      timeout: 5000,
      maximumAge: 0
    };


    var coords;
    function success(pos) {
      coords = [pos.coords.latitude, pos.coords.longitude];

      return coords;

    };

    function error(err) {
      console.warn('ERROR(' + err.code + '): ' + err.message);
    };

    navigator.geolocation.getCurrentPosition(success, error, options);

  }

export { createCoords };
