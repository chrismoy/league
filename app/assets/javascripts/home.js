var ready = function() {
  console.log('yo');
  $('#menu-button').click(function() {
    obscure();
    $('#hidden-menu').show();
  });
  $('#hidden-menu').click(function() {
    obscure();
    $('#hidden-menu').hide();
  });
};

function obscure() {
  $('.content').toggleClass('obscure');
}

$(document).ready(ready);
$(document).on('page:load', ready);



















