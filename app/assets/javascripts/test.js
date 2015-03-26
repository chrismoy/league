$(document).ready(function() {
  $('#menu-button').click(function() {
    $('#hidden-menu').fadeIn()
  });
  $('#hidden-menu').click(function() {
    $('#hidden-menu').fadeOut()
  });
});
