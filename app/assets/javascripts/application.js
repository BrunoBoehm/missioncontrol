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
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .



$(document).ready(function() {

	// destroying a resource
	$(document).on('click', '.remove_field', function(e) {
		if (confirm("Are you sure?")) {
			$(this).prev("input[type=hidden]").val('1');
			$(this).closest('fieldset').hide();
			e.preventDefault();
		}
		return false;
	});

	// adding a field for a new resource
	$(document).on('click', '.add_fields', function(e){
		// debugger;
		var time = new Date().getTime();
		// the regexp we create will be a global match, will not stop after the first one it finds
		var regexp = new RegExp($(this).data('id'), 'g')
		$(this).before($(this).data('fields').replace(regexp, time));
		e.preventDefault();
	});
});