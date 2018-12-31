$(document).on 'turbolinks:load', ->
	if $('body').hasClass('users panel')
		$('#clear-report-btn').click ->
			reports = {}
			$('#report-box .checkbox-container input').each ->
				if $(this)[0].checked
					reports[$(this).val()] = $(this).val()
			serializedReports = JSON.stringify(reports)
			$.post( window.location.href.replace(/users\/panel/, 'reports/destroy'),
				{ to_be_nuked: serializedReports }
			)
			.done( ->
				location.reload()
			)
			.fail( ->
				console.log('Error sending report data')
			)
		$('#clear-album-btn').click ->
			albums = {}
			$('#album-box .checkbox-container input').each ->
				if $(this)[0].checked
					albums[$(this).val()] = $(this).val()
			serializedAlbums = JSON.stringify(albums)
			$.post( window.location.href.replace(/users\/panel/, 'albums/destroy'),
				{ to_be_nuked: serializedAlbums }
			)
			.done( ->
				location.reload()
			)
			.fail( ->
				console.log('Error sending album data')
			)