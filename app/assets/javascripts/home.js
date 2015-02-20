var resizeViewPort = function() {
  var viewportHeight = $(window).height();
  var topbarHeight = $('#mobile-top-bar').height() ||
                      $('#desktop-top-bar').height();
  var mapbarHeight = $('#mapbar').height();
  var mainButtonHeight = $('#main-button').height()

  var mainHeight = viewportHeight - topbarHeight - mapbarHeight - 
                    mainButtonHeight;

  $(".content").height(mainHeight);
};

$(document).ready(function(){
  resizeViewPort();

  $(document).on("page:load", function(){
    resizeViewPort();
  });
});