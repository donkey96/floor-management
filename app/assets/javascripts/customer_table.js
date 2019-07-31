$(document).on('turbolinks:load',function() {
  $(".table").on("click", function() {
    $(this).toggleClass("lightpink");
  });
});
