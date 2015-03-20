var resizeViewPort = function() {
  var viewportHeight = $(window).height();
  var topbarHeight = $('#mobile-top-bar').height() ||
                      $('#desktop-top-bar').height();

  var mainHeight = viewportHeight - (2 * topbarHeight);

  $(".content").height(mainHeight);
};

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(addPositionsToForm);
  }
}

function addPositionsToForm(position) {
  $latitudeField.val(position.coords.latitude);
  $longitudeField.val(position.coords.longitude);

  refreshParks(position);
}

function refreshParks(position) {
  if ($.cookie("location") == null) {
    var location = [null, null];
  }
  else {
    var location = $.cookie("location").split("|");
  }
  if ((location[0] != position.coords.latitude.toFixed(3)) ||
      (location[1] != position.coords.longitude.toFixed(3))) {
    $.ajax({
      url: '/parks.js',
      data: {
        latitude: position.coords.latitude,
        longitude: position.coords.longitude
      }
    });
  }

}

$(document).ready(function(){
  resizeViewPort();

  $(document).on("page:change", function() {
    resizeViewPort();
  });

  $(window).resize(function() {
    resizeViewPort();
  });
});
