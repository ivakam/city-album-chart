$(document).on "turbolinks:load", ->
    $('#announcement-btn').click ->
    	e = $(this)
    	$('#announcement-form-container').toggleClass('modal-inactive')
    	opacity = $('#opaque')
    	opacity.css('background', 'rgba(0, 0, 0, 0.6')
    	opacity.css('z-index', '13')