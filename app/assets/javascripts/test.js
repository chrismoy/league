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
    toggleLargeOnly('#profile-picture');
    $('.tab').toggleClass('expand');
    toggleForm('.new-game-form')
  });
});

function obscure() {
  $('.content').toggleClass('obscure');
}

function toggleLargeOnly(element) {
  if($('.blocker').height() != 0) {
    if($('.tab.expand').length == 0) { $(element).fadeOut(); }
    else { $(element).fadeIn(); }
  }
}

function toggleForm(form) {
  if($('.tab.expand').length == 0) { $(form).slideToggle(); }
  else { $(form).delay(1000).slideToggle(); }
}
