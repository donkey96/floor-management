$(document).on('turbolinks:load',function() {
var cookie = $.cookie('table');
if(cookie){
  $(this).toggleClass("lightpink");
}
  $(".table").on("click", function() {
    $(this).toggleClass("lightpink");
    $.cookie("table","lightpink");
  });
});
