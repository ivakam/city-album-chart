$(document).on 'turbolinks:load', ->
	if $('body').hasClass('users')
		$('#avatar').change ->
			$('#avatar-form').submit()
		$('#profile-edit-btn').click ->
			e = $(this)
			$('#profile-form-container').toggleClass('modal-inactive')
			opacity = $('#opaque')
			opacity.css('background', 'rgba(0, 0, 0, 0.6')
			opacity.css('z-index', '13')