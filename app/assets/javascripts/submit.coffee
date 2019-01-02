$(document).on 'turbolinks:load', ->
	if $('body').hasClass('albums submit')
		$('#album-total-count').text(sessionStorage.getItem('albumCount'))
		
		$('.hint-click').click ->
			$('#submit-wrapper').find('input[type=text], input[type=file], textarea').val('')
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
			<input class='duration' placeholder='M:S' type='text'>
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
			
		$('.register-btn').click ->
			$('#register-form-container').toggleClass('modal-inactive')
			opacity = $('#opaque')
			opacity.css('background', 'rgba(0, 0, 0, 0.6')
			opacity.css('z-index', '5')