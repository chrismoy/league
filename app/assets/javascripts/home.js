var ready = function() {
  $('#menu-button').click(function() {
    obscure();
    $('#hidden-menu').show();
  });
  $('#hidden-menu').click(function() {
    obscure();
    $('#hidden-menu').hide();
  });
  $('.notification-close').click(function() {
    $('.notification-tab').remove();
    console.log('hey');
  });
};

function obscure() {
  $('.content').toggleClass('obscure');
}

$(document).ready(ready);
$(document).on('page:load', ready);



















