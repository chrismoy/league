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
  $.ajax({
    url: '/parks_list',
    data: { latitude: position.coords.latitude,
            longitude: position.coords.longitude },
    success: function() {
      $('.loading').fadeOut();
    },
    error: function() {
      $('.loading').html("Load Failed");
    },
  });
}

$(document).ready(function(){
  $(document).on("page:change", function() {});
  $(window).resize(function() {});
});
