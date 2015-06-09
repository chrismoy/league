$(function(){
  $('body').on('click','.close_button', function(){
    $(this).parent().slideUp("fast", function() {
      $(this).remove();
    });
  });
});
