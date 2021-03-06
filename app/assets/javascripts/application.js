// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/extras/dataTables.responsive
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require refile
//= require bootstrap
//= require adminlte
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
