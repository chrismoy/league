var ready = function() {
  $('#menu-button').click(function() {
    obscure();
    $('#hidden-menu').show();
  });
  $('#hidden-menu').click(function() {
    obscure();
    $('#hidden-menu').hide();
  });

  if ( $('.mapline').offset() > 50 ) {
    $('#title-image').hide();
  }

  $('#new-game-button').click(function() {
    obscure();
    $('#menu-button').toggle();
    toggleLargeOnly('#profile-picture');
    $('.tab').toggleClass('expand');
    toggleForm('.new-game-form')
  });

  $('.park-label').click(function() {
    var id = $(this).attr('data-parkid');
    $(".new-game-form").attr("action", "/parks/" + id + "/games");
    var name = $('.park-name', this).clone()
                                  .children()
                                  .remove()
                                  .end()
                                  .text();
    var heading = '<span>Selected Park:</span><br>'
    $('#new-park-name').html('<h6 id="new-park-name">' + heading + name + '</h6>');
  });

  $(window).resize(function() {
    viewportChangeCorrect('#profile-picture');
  });
};

function obscure() {
  $('.content').toggleClass('obscure');
}

function toggleLargeOnly(element) {
  if($('.blocker').height() != 0) {
    if($('.tab.expand').length == 0) { $(element).hide(); }
    else { $(element).show(); }
  }
}

function toggleForm(form) {
  if($('.tab.expand').length == 0) { $(form).slideToggle(); }
  else { $(form).delay(1000).slideToggle(); }
}

function viewportChangeCorrect(element) {
  if($('.blocker').height() == 0) { $(element).hide(); }
  else { $(element).show(); }
}

$(document).ready(ready);
$(document).on('page:load', ready);



















