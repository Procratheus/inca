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
//= require refile
//= require bootstrap
//= require adminlte
//= require_tree .

$(document).ready(function(){
  // Datatable for the users
  var user_table = $("#user_table").DataTable({
    stateSave: true,
    stateDuration: -1,
    //scrollY: "300px",
    //scrollX: true,
    // scrollCollapse: true,
    //paging: true,
    columnDefs: [
      // { width: "16%", targets: [0,1,2,3,4]},
      // { width: "4%", targets: 5},
      // { width: "4%", targets: [6,7,8]},
      // Disable the ordering on user action buttons in the user table and fix the width
      { orderable: false, targets: [6,7,8]}
    ],
    
  });
  new $.fn.dataTable.FixedHeader(user_table);

  // Refile javascript for uploading files

  // Start uploading the image
  $(document).on("upload:start", "form", function(e){
    $("#file-loading").text("Loading file.......");
  });

  // Upload progress
  $(document).on("upload:progress", "form", function(e){
    var detail = e.originalEvent.detail;
    var percentComplete = Math.round(detail.loaded / detail.total * 100);
    $("#file-loading").text("#{percentComplete}% uploaded");
  });

  // Upload complete
  $(document).on("upload:complete", "form", function(e){
    var file_id = $("#user_profile_image").val();
    $("#file-loading").html($("<img />").attr({
      src: "/attachments/cache/fill/45/45/#{file_id}/image"
    }));
  });

});





