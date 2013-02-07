# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function() {
	$('#addComment').click(function() {
		$('#new_comment').toggle('fast');
	});

	$('#new_comment').hide();

	$("#new_comment").bind('ajax:success', function(evt, data, status, xhr) {
		$('#commentsDiv').append($(xhr.responseText)).show('fast');
	});

});