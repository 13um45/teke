$(document).on('ready page:load', function() {
$(".menu").click(function() {
  window.location = $(this).data("link")
  });
});




