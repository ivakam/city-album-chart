$(document).on 'turbolinks:load', ->
	if $('body').hasClass('albums submit')
		$('#album-total-count').text(sessionStorage.getItem('albumCount'))
		
		$('.hint-click').click ->
			$('#submit-wrapper').find('input[type=text], input[type=file], textarea').val('')
			window.scraper.albumObjects = []
			$('#input-container').toggleClass('left-margin')
			
		$('.save-btn').click ->
			toBreak = false
			$('#title-field, #romaji-artist-field').each ->
				if $(this).val() == '' && $('#scraper-textarea').val() == ''
					$(this).next('.error-msg-container').css('height', '30px')
					$(this).css('border', '1px red solid')
					$('#scraper-textarea').css('border', '1px red solid')
					toBreak = true
			if !toBreak
				tracklist = {}
				makeTrack = (track, i) -> 
					return if track.find('.title').val() == ''
					title = track.find('.title').val()
					tracklist[title] = {}
					tracklist[title]['order'] = i + 1
					track.find('input').each ->
						tracklist[title][$(this).attr('class')] = $(this).val()
				makeTrack($(track), i) for track, i in $('.tracklist-edit-container').find('.track-input-container')
				$('#hidden-tracklist').attr('value', JSON.stringify(tracklist))
		
		deleteTrackClick = (e) ->
			e = $(e.target)
			e.parent().remove()
		
		$('.track-add-btn').click ->
			e = $(this)
			$("<div class='track-input-container'>
			<span class='draggable-area'></span>
			<input class='title' placeholder='Title' type='text'>
			<input class='romanization' placeholder='Romanization' type='text'>
			<input class='duration' placeholder='4:54' type='text'>
			<ion-icon name='ios-close' class='track-delete-btn'></ion-icon>
			</div>").insertBefore($(this))
			e.parent().find('.track-delete-btn').each ->
				$(this).get()[0].removeEventListener('click', deleteTrackClick)
				$(this).get()[0].addEventListener('click', deleteTrackClick)
			$('.track-input-container').arrangeable({
			dragSelector: '.draggable-area'
			})
		
		$('.track-delete-btn').click ->
			$(this).parent().remove()
		
		$('#scraper-submit-btn').click ->
			e = $(this)
			scraperAlbums = window.scraper.albumObjects
			if !e.hasClass('transparent')
				data = 
					scraper: scraperAlbums
				$.post(window.location.href.replace(/submit/, 'create'), data)
				.fail( ->
					console.log('Error sending post data')
				)
			
		$('#album-cover').change ->
			e = $(this)
			$('#selected-cover').html('Currently selected file: ' + e[0].value.split(/(\\|\/)/g).pop())	