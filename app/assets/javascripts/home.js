$(document).on('ready page:load', function() {
$(".giftron").click(function() {
  window.location = $(this).data("link")
  });
});
