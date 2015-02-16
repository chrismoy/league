$(document).ready(function() {

  var viewportHeight = $(window).height();
  var gameAlertHeight = $('#game-div').height();
  var topbarHeight = $('#mobile-top-bar').height()
                      || $('#desktop-top-bar').height();
  var mapbarHeight = $('#mapbar').height();
  var signupHeight = $('#signup').height()
  var joinGameHeight = $('#join-game').height()

  var mainHeight = viewportHeight -  gameAlertHeight - topbarHeight
                      - mapbarHeight - signupHeight - joinGameHeight;

  $(window).resize(function(){
    $(".content").css( "height", mainHeight);
  });

});
