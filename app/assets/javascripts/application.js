// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/extras/dataTables.responsive
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require refile
//= require bootstrap
//= require metisMenu/jquery.metisMenu.js
//= require pace/pace.min.js
//= require peity/jquery.peity.min.js
//= require sweetalert/sweetalert.min.js
//= require inspinia.js
//= require slimscroll/jquery.slimscroll.min.js
//= require_tree .

// Datables

$(document).ready(function(){
  // Datatable for the users
  $("#user_table").DataTable({
    responsive: true,
    autoWidth: false,
    order: [[1,"asc"]],
    columns: [
      // Disable the ordering on action buttons in the table
      null,
      null,
      null,
      null,
      null,
      { orderable: false, searchable: false },
      { orderable: false, searchable: false },
      { orderable: false, searchable: false }
    ]
  });
  // Datatable for publishers
  $("#publisher_table").DataTable({
    responsive: true,
    autoWidth: false,
    order: [[1,"asc"]],
    columns: [
      // Disable the ordering on action buttons in the table
      null,
      null,
      null,
      null,
      { orderable: false, searchable: false },
      { orderable: false, searchable: false },
      { orderable: false, searchable: false }
    ]
  });
  // Datatable for contents
  $("#content_table").DataTable({
    responsive: true,
    autoWidth: false,
    order: [[1,"asc"]],
    processing: true,
    serverSide: true,
    columns: [
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      { orderable: false, searchable: false },
      { orderable: false, searchable: false },
      { orderable: false, searchable: false }
    ],
    ajax: {
      url: "/contents/datatable_ajax_content",
    }
  })
});

// Refile javascript for uploading files

$(document).ready(function(){

  // Start uploading the image
  $(document).on("upload:start", "form", function(e){
    $("#file-loading").text("Loading file.......");
  });

  // Upload progress
  $(document).on("upload:progress", "form", function(e){
    var detail = e.originalEvent.detail;
    var percentComplete = Math.round(detail.loaded / detail.total * 100);
    $("#file-loading").text(percentComplete + "% uploaded");
  });

  // Upload complete
  $(document).on("upload:success", "form", function(e){
    var json_id = $("input[name='user[profile_image]'").val();
    var file_id = JSON.parse(json_id).id;
    $("#file-loading").html($("<img />").attr({
      src: "/attachments/cache/fill/45/45/" + file_id + "/image"
    }));
  });

});

// Custom delete and restore sweet alert

$(document).ready(function() {
  $('#user_table, #content_table, #publisher_table').on( 'draw.dt', function () {
    $("td, th").addClass("th-col-span");
    $("[data-behavior='confirmDelete']").click(function(e){
      e.preventDefault();
      var model = $(this).data("type");
      return swal({
        title: 'Are you sure?',
        text: 'The ' + model + ' will be deleted',
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#DD6B55',
        confirmButtonText: 'Yes',
        cancelButtonText: 'No',
        closeOnConfirm: false,
        closeOnCancel: false
      }, (function(_this) {
        return function(confirmed) {
          if (confirmed) {
            $.ajax({
              url: $(_this).attr("href"),
              dataType: "JSON",
              method: "DELETE",
              success: function() {
                swal("Restored!", "The " + model + " has been restored.", "success");
                if ($(_this).closest("tr").find(".active").hasClass("label-warning")) {
                  $(_this).closest("tr").find(".active").removeClass("label-warning").addClass("label-primary").html("active");
                } else {
                  $(_this).closest("tr").find(".active").removeClass("label-primary").addClass("label-warning").html("archived");
                }
              }
            });
          } else {
            swal("Cancelled!", "The " + model + " has not been deleted.", "error");
          }
        };
      })(this));
    });

    $("[data-behavior='confirmRestore']").click(function(e){
      e.preventDefault();
      var model = $(this).data("type");
      return swal({
        title: 'Are you sure?',
        text: 'The ' + model + ' will be restored',
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'rgb(174, 222, 244)',
        confirmButtonText: 'Yes',
        cancelButtonText: 'No',
        closeOnConfirm: false,
        closeOnCancel: false
      }, (function(_this) {
        return function(confirmed) {
          if (confirmed) {
            $.ajax({
              url: $(_this).attr("href"),
              dataType: "JSON",
              method: "PUT",
              success: function() {
                swal("Restored!", "The " + model + " has been restored.", "success");
                if ($(_this).closest("tr").find(".active").hasClass("label-warning")) {
                  $(_this).closest("tr").find(".active").removeClass("label-warning").addClass("label-primary").html("active");
                } else {
                  $(_this).closest("tr").find(".active").removeClass("label-primary").addClass("label-warning").html("archived");
                }
              }
            });
          } else {
            swal("Cancelled!", "The " + model + " has not been restored.", "error");
          }
        };
      })(this));
    });
  });
});
