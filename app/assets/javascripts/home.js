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
  $('.organization-select').change(function() {
    alert('yolo');
  });
};

function obscure() {
  $('.content').toggleClass('obscure');
}

function replaceMapLine() {
  $ajax({
    url: "parks_list_url"
  });
}

$(document).ready(ready);
$(document).on('page:load', ready);



















