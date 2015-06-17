var ready = function() {
  $('#menu-button').click(function() {
    obscure();
    $('#hidden-menu').show();
  });
  $('#hidden-menu').click(function() {
    obscure();
    $('#hidden-menu').hide();
  });
  $('.organization-select').change(function() {
    var orgId = $(this).val();
    replaceMapLine(orgId);
  });
};

function obscure() {
  $('.content').toggleClass('obscure');
}

function replaceMapLine(orgId) {
  $.ajax({
    url: "parks_list",
    data: { organization_id: orgId }
  });
}

$(document).ready(ready);
$(document).on('page:load', ready);



















