var options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0
};

var coordsArray;
function success(pos) {
  coordsArray = [pos.coords.latitude, pos.coords.longitude];
  //console.log(coordsArray);
};

function error(err) {
  console.warn('ERROR(' + err.code + '): ' + err.message);
};

navigator.geolocation.getCurrentPosition(success, error, options);

export { coordsArray };
