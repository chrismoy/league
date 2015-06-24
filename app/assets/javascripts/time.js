var set_timezone = function() {
  var tz = jstz.determine();
  $.cookie('timezone', tz.name(), { expires: 7,
                                    path: '/' });
};

$(document).ready(set_timezone);
