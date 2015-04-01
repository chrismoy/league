$(document).ready(function() {
  $('#menu-button').click(function() {
    obscure();
    $('#hidden-menu').fadeIn();
  });
  $('#hidden-menu').click(function() {
    obscure();
    $('#hidden-menu').fadeOut();
  });

  if ( $('.mapline').offset() > 50 ) {
    $('#title-image').fadeOut();
    console.log("yolo");
  }

  $('#new-game-button').click(function() {
    obscure();
    $('#menu-button').fadeToggle();
    $('#profile-picture').fadeToggle();
    $('.new-game-form').fadeToggle();
    $('.tab').toggleClass('expand');
  });
});

function obscure() {
  $('.content').toggleClass('obscure');
}
