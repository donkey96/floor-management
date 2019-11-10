$(document).on('turbolinks:load',function() {
  let table_ids = []
  let checks = []

  $(function () {
    if($.cookie("table")== "lightpink"){
      let parsedid = $.cookie("id");
      let parsedcheck = $.cookie("check");
      let split_check = parsedcheck.split(",");
      let split_id = parsedid.split(",");
      $.each(split_check, function (index,c) {
        $(parsedcheck).prop("checked",true);
        checks.push(c);
      })
      $.each(split_id, function (index,i) {
        $(parsedid).addClass("lightpink");
        table_ids.push(i);
      })
    }else{
    }
  $(".table_check").change(function() {
    var table_id = $(this).attr('id');
    if ($("#" + table_id).prop("checked") == true) {
      table_ids.push("#table-" + table_id);
      checks.push("#" + table_id)
      $("#table-" + table_id).addClass("lightpink");
    }else{
      var index_id = table_ids.indexOf("#table-" + table_id);
      var index_check = checks.indexOf("#" + table_id);

      if (index_id > -1) {
        table_ids.splice(index_id, 1);
      };
      if (index_check > -1) {
        checks.splice(index_check, 1);
      };

      $("#table-" + table_id).removeClass("lightpink");
    }
    $.cookie("table","lightpink",{expires: 3 , path: "/"});
    $.cookie("check",checks,{expires: 3 , path: "/"});
    $.cookie("id",table_ids,{expires: 3 , path: "/"}); 
  });
  });
  $(".table_reset").on("click", function () {
    $(".table_check").prop("checked",false);
    $(".table").removeClass("lightpink");
    $.removeCookie("table");
    $.removeCookie("check");
    $.removeCookie("id"); 
    table_ids = []
    checks = []
  });
});
