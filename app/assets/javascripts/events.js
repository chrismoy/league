$(document).ready(function() {
  $('#signup-button').click(function() {
    ga('send', 'event', 'button', 'click', 'signup-button', 1);
    console.log('yoloist');
  });
});
