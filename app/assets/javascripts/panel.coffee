$(document).on 'turbolinks:load', ->
	if $('body').hasClass('users panel')
		sendPost = (target, action, param) ->
			rawData = {}
			$(target).each ->
				if $(this)[0].checked
					rawData[$(this).val()] = $(this).val()
			serializedData = JSON.stringify(rawData)
			$.post( window.location.href.replace(/panel/, action),
				{ "#{param}[serialized_ids]": serializedData }
			)
			.done( ->
				location.reload()
			)
			.fail( ->
				console.log('Error sending post data')
			)
		$('#clear-report-btn').click ->
			sendPost('#request-box .checkbox-container input', 'reports/destroy', 'report')
		$('#clear-album-btn').click ->
			sendPost('#album-box .checkbox-container input', 'albums/destroy', 'album')
		$('.admin-btn').click ->
			sendPost('#user-box .checkbox-container input', 'users/toggle-admin', 'user')
		$('.ban-btn').click ->
			sendPost('#user-box .checkbox-container input', 'users/toggle-ban', 'user')
		$('.nuke-btn').click ->
			sendPost('#user-box .checkbox-container input', 'users/destroy', 'user')
		$('#clear-thread-btn').click ->
			sendPost('#threads-box .checkbox-container input', 'thread/destroy', 'thread')