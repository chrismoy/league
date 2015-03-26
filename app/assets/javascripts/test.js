$(document).ready(function() {
  $('#menu-button').click(function() {
    $('#hidden-menu').fadeIn()
  });
  $('#hidden-menu').click(function() {
    $('#hidden-menu').fadeOut()
  });

  if ( $('.mapline').offset() > 50 ) {
    $('#title-image').fadeOut();
    console.log("yolo");
  }
});
