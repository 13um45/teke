$(document).on('ready page:load', function() {
$(".dropdown-menu a").click(function() {
    $(this).closest(".dropdown-menu").prev().dropdown("toggle");
});
});


$(document).on('ready page:load', function() {
$(".pindex").click(function() {
  window.location = $(this).data("link")
  });
});
