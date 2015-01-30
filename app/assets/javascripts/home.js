$(document).ready(function() {

  var viewportHeight = $(window).height();
  var gameAlertHeight = $('#game-div').height();
  var topbarHeight = $('#mobile-top-bar').height()
                      || $('#desktop-top-bar').height();
  var mapbarHeight = $('#mapbar').height();
  var signupHeight = $('#signup').height()

  var mainHeight = viewportHeight -  gameAlertHeight - topbarHeight
                      - mapbarHeight - signupHeight - 100;

  $(window).resize(function(){
    console.log( mainHeight )
    $("#main-content").css( "height", mainHeight);
  });

});
