// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require ace/ace

$(function () {
	var editor = ace.edit("snippet-code");
	editor.getSession().setMode("ace/mode/ruby");
	var textarea = $('textarea[name="snippet[code]"]').hide();
	editor.getSession().setValue(textarea.val());
	editor.getSession().setTabSize(2);
	editor.getSession().on('change', function(){
	  textarea.val(editor.getSession().getValue());
	  console.log(textarea.val())
	});

	// var editor2 = ace.edit("show");
	// editor2.setReadOnly(true);

	/*textarea.closest('form').submit(function (event) {
		event.preventDefault();
		console.log('code')
		console.log(textarea.val())
	  //  textarea.val(editor.getSession().getValue());
	})*/


	$(".editor-mode").change(function() {
		mode = $(this).val()
		editor.session.setMode("ace/mode/" + mode);
	})
})
