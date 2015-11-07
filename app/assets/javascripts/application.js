// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require nested_form_fields
//= require sweet-alert
//= require_tree .

$(document).on("page:change", function() {
	// Clear score before starting new test
	$(".clear-score").click(function() {
	  sessionStorage.clear();
	  sessionStorage.setItem("path", true);
	});

  // Make package links clickable on marketing pages
	$(".package-and-price").click(function() {
    window.location = $(this).find("a").attr("href");
  });

  // Fill in password confirmtion automatically
  // $("#user_password").keyup(function() {
  //  $("#user_password_confirmation").val(this.value);
  // });
});