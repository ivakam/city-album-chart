$(document).on 'turbolinks:load', ->
	if $('body').hasClass('users')
	    $('#avatar').change ->
	        $('#avatar-form').submit()