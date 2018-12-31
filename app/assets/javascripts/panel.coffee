$(document).on 'turbolinks:load', ->
	if $('body').hasClass('users panel')
		sendPost = (target, action) ->
			rawData = {}
			$(target).each ->
				if $(this)[0].checked
					rawData[$(this).val()] = $(this).val()
			serializedData = JSON.stringify(rawData)
			$.post( window.location.href.replace(/users\/panel/, action),
				{ 'user[serialized_ids]': serializedData }
			)
			.done( ->
				location.reload()
			)
			.fail( ->
				console.log('Error sending post data')
			)
		$('#clear-report-btn').click ->
			sendPost('#request-box .checkbox-container input', 'reports/destroy')
		$('#clear-album-btn').click ->
			sendPost('#album-box .checkbox-container input', 'albums/destroy')
		$('.admin-btn').click ->
			sendPost('#user-box .checkbox-container input', 'users/toggle-admin')
		$('.ban-btn').click ->
			sendPost('#user-box .checkbox-container input', 'users/toggle-ban')
		$('.nuke-btn').click ->
			sendPost('#user-box .checkbox-container input', 'users/destroy')