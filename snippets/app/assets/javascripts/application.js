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
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require ace/ace


$(function () {
	if ($("#snippet-code").length > 0) {
		var editor = ace.edit("snippet-code");
		console.log(editor);
		editor.setTheme("ace/theme/monokai");
		if ($(".editor-mode option:selected").length > 0) {
			mode = $(".editor-mode option:selected").val()
			editor.session.setMode("ace/mode/" + mode);
		}
		else
			editor.getSession().setMode("ace/mode/ruby");
		var textarea = $('textarea[name="snippet[code]"]').hide();
		editor.getSession().setValue(textarea.val());
		editor.getSession().setTabSize(2);
		editor.getSession().on('change', function(){
		  textarea.val(editor.getSession().getValue());
		  //console.log(textarea.val())
		});

		$(".editor-mode").change(function() {
			mode = $(this).val()
			console.log(mode);
			editor.session.setMode("ace/mode/" + mode);
		})
	}
	if ($('.readonly').length > 0) {
		$('.readonly').each(function(){
			editor_instance = ace.edit(this);
			mode = $(this).attr('alt');
	    editor_instance.setOptions({
	        mode: "ace/mode/" + mode,
	        readOnly: true,
	        theme: 'ace/theme/monokai'
	    })
		})
	}

	if ($(".create-snippet").length > 0) {
		/* Accordion */
    $('.container').on('click', '.create-snippet h3', function() {
        $(this).next().slideToggle('fast');
    })
	}
	// var snippet = ace.edit("snippet-readonly");
	// snippet.setReadOnly(true);

	/*textarea.closest('form').submit(function (event) {
		event.preventDefault();
		console.log('code')
		console.log(textarea.val())
	  //  textarea.val(editor.getSession().getValue());
	})*/



})


