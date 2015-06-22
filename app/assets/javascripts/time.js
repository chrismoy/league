var set_timezone = function() {
  var tz = jstz.determine();
  $.cookie('timezone', tz.name(), { path: '/' });
};

$(document).ready(set_timezone);
