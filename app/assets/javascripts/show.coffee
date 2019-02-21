$(document).on 'turbolinks:load', ->
	
	#Handler for clicking "create account" button
	
	$('.register-btn').click ->
		$('#register-form-container').toggleClass('modal-inactive')
		opacity = $('#opaque')
		opacity.css('background', 'rgba(0, 0, 0, 0.6')
		opacity.css('z-index', '10')				
		
	#Handler for clicking "reset password" button
	
	$('.password-reset-btn').click ->
		$('#password-reset-form-container').toggleClass('modal-inactive')
		opacity = $('#opaque')
		opacity.css('background', 'rgba(0, 0, 0, 0.6')
		opacity.css('z-index', '10')
	
	#Handler for clicking the notifications button
	
	$('#notification-btn').click ->
		$('#notification-list').toggleClass('hidden')
		if $(this).hasClass('unread-notifications')
			$('#notification-btn').removeClass('unread-notifications')
			$('#notification-btn').find('ion-icon')[0].outerHTML = '<ion-icon name="ios-mail" role="img" class="hydrated" aria-label="mail"></ion-icon>'
			$.post(window.location.origin + '/notifications/mark-as-read')
			.fail( ->
				console.log('Error sending post data')
			)
	#Handler for closing the zoom-mode for images
	
	resetFocus = () ->
		$('img').removeClass('enlargened')
		$('#opaque').css('background', 'rgba(0,0,0,0)')
		$('.bigimage').attr('src', '')
		$('#opaque').css('z-index', '0')
		$('.modal').addClass('modal-inactive')
		$('#report-comment').val('')

	$('#opaque').click ->
		resetFocus()
	
	$('.modal-close').click ->
		resetFocus()
		
	if $('.flash-modal')[0]
		opacity = $('#opaque')
		opacity.css('background', 'rgba(0, 0, 0, 0.6')
		opacity.css('z-index', '10')				
		setTimeout( ->
			resetFocus()
		, 10000)
		
	#Handler for sending report
	
	$('.modal input[type=submit]').click ->
		if $(this).closest('.modal').find('input:invalid').length == 0
			$('.submit-message').toggleClass('shrunk')
			setTimeout( ->
				$('.submit-message').toggleClass('shrunk')
				resetFocus()
			, 4000)
		
	if $('body').hasClass('albums show')
		
		#Global variable declaration
		
		host = window.location.href.replace(/\/albums.+$|\/albums$/, '') + '/albums/fetch?'
		albumOpen = false
		delayTimer = null
		vinylClicked = false
		fetchInProgress = false
		titleReplaceRegex = /[\s\'\"\.\(\)\!\#\%\&\\\*]/g
		window.albumsNameSpace = {}
		ytAPIkey = 'AIzaSyAA9tEp3x9uIC60zQfLds8ZlNrwRCBwc5Q'
		totalCount = $('#album-count').html()
		albums = null
		$('#main-search').val('')
		
		#console.log(user)
		#console.log('albums.coffee is running.')
		
		sortAlbums = (arr) ->
			if arr[0] == 'Out of albums to render!'
				return new Map()
			popTemp = (a, i, arr) ->
				tempAlbums.set(a.title.replace(titleReplaceRegex, '').trim(), arr[i])
			tempAlbums = new Map()
			popTemp(a, i, arr) for a, i in arr
			return tempAlbums
		
		#Handler for viewing album-info.
		
		albumClick = (e) ->
			e = $(e.target)
			title = e.closest('.album-container').find('.text-size-wrapper h2').text().replace(titleReplaceRegex, '')
			sibling = $("##{title}-info").find('.info-wrapper')
			parent = $("##{title}")
			arrow = parent.find('.album-arrow')
			toggleAlbum(title, sibling, parent, arrow)
		
		#Handler for expanding the YT viewbox
		
		vinylClick = (e) ->
			vinylClicked = true
			e = $(e.target)
			container = e.parent()
			video = e.siblings('.stream-slider-container')
			e.css('right', '100%')
			e.css('transform', 'rotate(-180deg)')
			container.css('min-width', '1045px')
			container.css('max-width', '1045px')
			video.css('margin-right', '45px')
			setTimeout( ->
				if video.find('.video-slider').find('iframe:first-child').attr('src') == ''
					title = container.closest('.info-container').siblings('.album-container').attr('id')
					albumID = albums.get(title)
					album = albumID.title
					artist = albumID.romaji_artist
					url = 'https://www.googleapis.com/youtube/v3/search'
					searchResults = {}
					params =
						part: 'snippet'
						key: ytAPIkey
						q: album + ' ' + artist + ' full album'
						type: 'video'
						maxResults: '5'
					success = (result) ->
						setItem = (i, item) ->
							searchResults[i] = item.id.videoId
						setItem(i, item) for item, i in result.items
						sliderItems = video.find('.video-slider').find('iframe')
						setSourceVideo = (i, iframe) ->
							$(iframe).attr('src', 'https://www.youtube.com/embed/' + searchResults[i.toString()] + '?enablejsapi=1&version=3&playerapiid=ytplayer')
						setSourceVideo(i, iframe) for iframe, i in sliderItems
					error = (result) ->
						console.log('Failed to fetch YouTube data: ', result)
					$.ajax(
						dataType: 'json'
						url: url
						data: params
						success: success
						error: error
					)
			,
			300)
		
		#Handler for closing YT interface
		
		streamCloseClick = (e) ->
			e = $(e.target)
			vinylClicked = false
			container = e.parent().parent()
			video = e.parent()
			vinyl = container.children('.vinyl-icon')
			vinyl.css('right', '0')
			vinyl.css('transform', 'rotate(0deg)')
			container.css('min-width', '390px')
			container.css('max-width', '390px')
			video.css('margin-right', '625px')
			container.find('iframe').each ->
				this.contentWindow.postMessage('{"event":"command","func":"stopVideo","args":""}', '*')
		
		#Handlers for stream slider buttons
		
		streamArrowClick = (e) ->
			e = $(e.target)
			rightArrow = e.hasClass('stream-arrow-right') ? true : false
			firstChild = e.siblings('.video-slider').children('iframe:first-child')
			if Number.isInteger(parseInt(firstChild.css('margin-left')) / 600)
				if rightArrow
					if parseInt(firstChild.css('margin-left')) > -2400
						firstChild.css('margin-left', (parseInt(firstChild.css('margin-left')) - 600).toString() + 'px')
					else
						firstChild.css('margin-left', '0')
				else
					if parseInt(firstChild.css('margin-left')) < 0
						firstChild.css('margin-left', (parseInt(firstChild.css('margin-left')) + 600).toString() + 'px')
					else
						firstChild.css('margin-left', '-2400px')
		
		#Handlers for clicking the edit buttons
		
		editButtonClick = (e) ->
			e = $(e.target)
			parent = e.closest('.info-wrapper').find('.info-text-container')
			e.parent().find('.ion').each ->
				$(this).css('opacity', '0.6')
				$(this).css('display', 'block')
			e.css('opacity', 0)
			e.css('display', 'none')
			if (parseInt(parent.css('margin-top')) > -10)
				parent.css('margin-top', -1 * (parent.height() + 15))
			else
				parent.css('margin-top', '0')
		
		#Handler for click report button
		
		flagButtonClick = (e) ->
			e = $(e.target)
			title = e.parent().find('.title-container h2').html()
			$('#report-target').attr('value', title)
			$('#report-form-container').toggleClass('modal-inactive')
			opacity = $('#opaque')
			opacity.css('background', 'rgba(0, 0, 0, 0.6')
			opacity.css('z-index', '5')
		
		#Handler for deleting tracks
		
		deleteTrackClick = (e) ->
			e = $(e.target)
			deleteInput = e.closest('.field-container').find('.delete-list')
			toBeNuked = e.siblings('.title_old').val()
			if toBeNuked != ''
				if deleteInput.val() == ''
					deleteInput.attr('value', e.siblings('.title_old').val())
				else
					deleteInput.attr('value', deleteInput.val() + '+++' + toBeNuked)
			e.parent().remove()
		
		#Handler for adding track
		
		addTrackClick = (e) ->
			e = $(e.target)
			$("<div class='track-input-container'>
			<span class='draggable-area'></span>
			<input class='title' placeholder='Title' type='text'>
			<input hidden>
			<input class='romanization' placeholder='Romanization' type='text'>
			<input hidden>
			<input class='duration' placeholder='M:S' type='text'>
			<input hidden>
			<ion-icon name='ios-close' class='track-delete-btn'></ion-icon>
			</div>").insertBefore($(this))
			e.parent().find('.track-delete-btn').each ->
				$(this).get()[0].removeEventListener('click', deleteTrackClick)
				$(this).get()[0].addEventListener('click', deleteTrackClick)
			$('.track-input-container').arrangeable({
				dragSelector: '.draggable-area'
				})
		
		#Handler for serializing tracklist and adding it to hidden input
		
		editSubmitClick = (e) ->
			e = $(e.target)
			rawTracks = []
			tracklist = e.parent().find('.tracklist-submit .tracklist-edit-container .track-input-container')
			tracklist.each((index, element) ->
				currentTrack = index
				rawTracks[index] = {}
				$(element).find('input').each ->
					rawTracks[index][$(this).attr('class')] = $(this).val()
			)
			serializedTracks = JSON.stringify(rawTracks)
			e.next('.tracklist').attr('value', serializedTracks)
			#location.reload()
		
		#Handler for vinyl icon hover
		
		vinylHoverOn = (e) ->
			if !vinylClicked
				e = $(e.target)
				e.parent().css('min-width', '590px')
				e.parent().css('max-width', '590px')
		
		vinylHoverOff = (e) ->
			if !vinylClicked
				e = $(e.target)
				e.parent().css('min-width', '390px')
				e.parent().css('max-width', '390px')
		
		#Handler for image click-zoom
		
		clickImage = (e) ->
			e = $(e.target)
			opacity = $('#opaque')
			img = $('.bigimage')
			imgsrc = e.attr('src')
			if !img.hasClass('enlargened')
				img.addClass('enlargened')
				img.attr('src', imgsrc)
				offset = img.width() / 2
				$('.enlargened').css('left', ($(window).width() / 2) - offset)
				$('.enlargened').css('top', ($(window).height() / 2) - offset)
				opacity.css('background', 'rgba(0, 0, 0, 0.6')
				opacity.css('z-index', '5')
		
		#Updating selected file for cover editing
		
		updateSelectedCover = (e) ->
			e = $(e.target)
			selectedCoverText = e.parent().parent().find('.selected-cover')
			selectedCoverText.html('Currently selected file: ' + e[0].value.split(/(\\|\/)/g).pop())
		
		# Create an album
		
		displayAlbum = (refreshSplash = true) ->
			$('#splash-container').toggle() if refreshSplash
			vinylClicked = false
			albumLi = ''
			createAlbum = (album) ->
				album.loaded = true
				addTrack = (track, i) ->
					return "
					<li class='track-container'>
						<div class='track-title-container'>
							<p>"+(i+1)+".</p>
							<div class='track-title-wrap'>
								<p>" + track.title + "</p>
								<i>" + track.romanization + "</i>
							</div>
						</div>
						<p class='duration'>" + track.duration + "</p>
					</li>
					"
				trackListStr = ''
				trackListStr += addTrack(track, i) for track, i in album.tracklist
				id = album.title.replace(titleReplaceRegex, '')
				editTrackStr = ''
				generateEditTrackStr = (track) ->
					editTrackStr += "<div class='track-input-container'>
									<span class='draggable-area'></span>
									<input class='title' placeholder='Title' value='" + track.title.replace("'", '&#39;') + "' type='text'>
									<input class='romanization' placeholder='Romanization' value='" + track.romanization.replace("'", '&#39;') + "' type='text' >
									<input class='duration' placeholder='4:54' value='" + track.duration + "' type='text'>
									<input class='title_old' value='" + track.title.replace("'", '&#39;') + "' type='text' hidden>
									<input class='romanization_old' value='" + track.romanization.replace("'", '&#39;') + "' type='text' hidden>
									<input class='duration_old' value='" + track.duration + "' type='text' hidden>
									<ion-icon name='ios-close' class='track-delete-btn'></ion-icon>
									</div>"
				generateEditTrackStr(track) for track in album.tracklist
				editTrackStr += "<ion-icon name='ios-add-circle' class='track-add-btn'></ion-icon>"
				editFormStr = ''
				editBtnStr = ''
				if user
					editFormStr = 
					"<div class='edit-form-container'>
						<form action='/albums/update' accept-charset='UTF-8' data-remote='true' method='post' enctype='multipart/form-data'>
							<div class='field-container'>
								<div class='cover-edit-container'>
									<p>Album cover</p>
									<div>
										<label for='#{album.title.replace("'", '&#39;').replace(/\s+/, '')}-cover'>
										    <img src='' class='cover-editable'>
										</label>
										<input class='album-edit-cover' id='#{album.title.replace("'", '&#39;').replace(/\s+/, '')}-cover' name='album[cover]' type='file'>
										<div><p><b>Update cover</b></p></div>
									</div>
									<p class='selected-cover'>No cover selected</p>
								</div>
								<div class='divider'></div>
								<div class='input-field-container'>
									<div class='form-field'>
										<p><label for='#{album.title.replace("'", '&#39;').replace(/\s+/, '')}-title'>Title*</label></p>
										<input id='#{album.title.replace("'", '&#39;').replace(/\s+/, '')}-title' placeholder='ロートスの果実' value='#{album.title.replace("'", '&#39;')}' type='text' name='album[title]'>
										<input value='#{album.title.replace("'", '&#39;')}' type='text' name='album[title_old]' hidden>
									</div>
									<div class='form-field'>
										<p><label for='#{album.title.replace("'", '&#39;').replace(/\s+/, '')}-romanization'>Romanization</label></p>
										<input id='#{album.title.replace("'", '&#39;').replace(/\s+/, '')}-romanization' placeholder='Lotus no Kajitsu' value='#{album.romanization.replace("'", '&#39;')}' type='text' name='album[romanization]'>
										<input value='#{album.romanization.replace("'", '&#39;')}' type='text' name='album[romanization_old]' hidden>
									</div>
									<div class='form-field'>
										<p><label for='#{album.title.replace("'", '&#39;').replace(/\s+/, '')}-japanese-artist'>Japanese artist</label></p>
										<input id='#{album.title.replace("'", '&#39;').replace(/\s+/, '')}-japanese-artist' placeholder='中原めいこ' value='#{album.japanese_artist.replace("'", '&#39;')}' type='text' name='album[japanese_artist]'>
										<input value='#{album.japanese_artist.replace("'", '&#39;')}' type='text' name='album[japanese_artist_old]' hidden>
									</div>
									<div class='form-field'>
										<p><label for='#{album.title.replace("'", '&#39;').replace(/\s+/, '')}-romaji-artist'>Romaji artist*</label></p>
										<input id='#{album.title.replace("'", '&#39;').replace(/\s+/, '')}-romaji-artist' placeholder='Meiko Nakahara' value='#{album.romaji_artist.replace("'", '&#39;')}' type='text' name='album[romaji_artist]'>
										<input value='#{album.romaji_artist.replace("'", '&#39;')}' type='text' name='album[romaji_artist_old]' hidden>
									</div>
									<div class='form-field'>
										<p><label for='#{album.title.replace("'", '&#39;').replace(/\s+/, '')}-year'>Year</label></p>
										<input id='#{album.title.replace("'", '&#39;').replace(/\s+/, '')}-year' placeholder='1984' value='#{album.year.replace("'", '&#39;')}' type='text' name='album[year]'>
										<input value='#{album.year.replace("'", '&#39;')}' type='text' name='album[year_old]' hidden>
									</div>
									<div class='form-field'>
										<p><label for='#{album.title.replace("'", '&#39;').replace(/\s+/, '')}-flavor'>Flavor</label></p>
										<input id='#{album.title.replace("'", '&#39;').replace(/\s+/, '')}-flavor' placeholder='Funk, Idol' value='#{album.flavor.replace("'", '&#39;')}' type='text' name='album[flavor]'>
										<input value='#{album.flavor.replace("'", '&#39;')}' type='text' name='album[flavor_old]' hidden>
									</div>
								</div>
								<div class='divider'></div>
								<div class='form-field description-field'>
									<p><label for='#{album.title.replace("'", '&#39;').replace(/\s+/, '')}-description'>Description</label></p>
									<textarea id='#{album.title.replace("'", '&#39;').replace(/\s+/, '')}-description' placeholder='Meiko Nakahara&#39;s 4th studio album brings the hard synths and slappy basslines.' name='album[description]'>#{album.description.replace("'", '&#39;')}</textarea>
									<input value='#{album.description.replace("'", '&#39;')}' type=text' name='album[description_old]' hidden>
								</div>
								<div class='divider'></div>
								<div class='tracklist-submit'>
									<div class='tracklist-label-text'>
										<p><label for='#{album.title.replace("'", '&#39;').replace(/\s+/, '')}-tracklist'>Tracklist</label></p>
										<div class='tooltip'><span class='tooltiptext'>
											<a>Template in the form of \"&ltTrack title&gt\", \"&ltRomanization&gt\", &ltTrack Duration&gt.</a>
										</div>
									</div>
									<div class='tracklist-edit-container'>
										#{editTrackStr}
									</div>
								</div>
								<input class='edit-submit-btn' type='submit' name='commit' value='Save changes' data-disable-with='Save changes'>
								<input class='tracklist' name='tracklist' value='' hidden>
								<input class='delete-list' name='delete_list' value='' hidden>
							</div>
						</form>
					</div>"
					editBtnStr = "<ion-icon name='create' class='ion edit-icon'></ion-icon>"
				albumLi +=
				"<li>
					<div class='album-container' id='"+id+"'>
						<div class='album-text-container'>
							<div class='text-size-wrapper'>
								<h2>"+album.title+"</h2>
							</div>
							<img src='" + album.thumbnail + "'>
							<div class='artist-year-container'>
								<p class='artist'>"+album.romaji_artist+"</p>
								<p class='year'>"+album.year+"</p>
							</div>
						</div>
						<div class='arrow-container'><ion-icon name='ios-arrow-down' class='album-arrow'></ion-icon></div>
					</div>
					<div class='info-container offset' id='"+id+"-info'>
						<div class='info-wrapper'>
							<ion-icon name='ios-flag' class='ion flag-icon'></ion-icon>
							#{editBtnStr}
							<ion-icon name='ios-close' class='ion close-icon'></ion-icon>
							<div class='info-background'>"+"<img src='" + album.thumbnail + "'></div>
							<div class='info-text-container'>
								<div class='text-container'>
									<div class='title-container'>
										<h2>"+album.title+"</h2>
										<h3><i>"+album.romanization+"</i></h3>
									</div>
									<div class='artist-container'>
										<p>"+album.romaji_artist+"</p>
										<p class='label'>"+album.japanese_artist+"</p>
									</div>
									<div class='release-date'>
										<p class='label'>Release date:</p>
										<p>"+album.year+"</p>
									</div>
									<div class='flavor'>
										<p class='label'>Flavor:</p>
										<p class='flavor-value'>"+album.flavor+"</p>
									</div>
									<div class='description-container'>
										<p class='label'>Description:</p>
										<p class='description'>"+album.description+"</p>
									</div>
								</div>
								<div class='track-grow-wrapper'>
									<div class='link-image-container'>
										<img class='expandable-img' src=''>
										<img class='vinyl-icon hidden' src='https://upload.wikimedia.org/wikipedia/commons/7/75/Vinyl_record.svg'>
										<div class='stream-slider-container'>
											<ion-icon name='ios-close' class='stream-close'></ion-icon>
											<ion-icon name='ios-arrow-back' class='stream-arrow stream-arrow-left'></ion-icon>
											<ion-icon name='ios-arrow-forward' class='stream-arrow stream-arrow-right'></ion-icon>
											<div class='video-slider'>
												</iframe>
												<iframe src='' allowfullscreen='true' allowscriptaccess='always' frameborder='0'>
												</iframe>
												<iframe src='' allowfullscreen='true' allowscriptaccess='always' frameborder='0'>
												</iframe>
												<iframe src='' allowfullscreen='true' allowscriptaccess='always' frameborder='0'>
												</iframe>
												<iframe src='' allowfullscreen='true' allowscriptaccess='always' frameborder='0'>
												</iframe>
											</div>
										</div>
									</div>
									<div class='info-divider'></div>
									<div class='tracklist-wrapper'>
										<h3>Tracklist:</h3>
										<ul class='tracklist-container'>
											#{trackListStr}
										</ul>
									</div>
									<div class='contributor'>
										<p>Uploaded on #{album.upload_date},</p>
										<p>Contributor: <a href='#{host.replace(/albums\/fetch\?/, 'users/') + album.contributor.toLowerCase()}'>#{album.contributor}</a></p>
									</div>
								</div> 
							</div> 
							#{editFormStr}
						</div>
					</div>
				</li>"
				
			albums.forEach( (value, key) ->
				if value.loaded != true
					createAlbum(value)
			)
			$('#splash-container').append(albumLi)
			addEventListener = (element, event, func) ->
				$(element).each ->
					$(this).get()[0].removeEventListener(event, func)
					$(this).get()[0].addEventListener(event, func)
			addEventListener('.expandable-img', 'click', clickImage)
			addEventListener('.vinyl-icon', 'click', vinylClick)
			addEventListener('.vinyl-icon', 'mouseover', vinylHoverOn)
			addEventListener('.vinyl-icon', 'mouseout', vinylHoverOff)
			addEventListener('.stream-close', 'click', streamCloseClick)
			addEventListener('.stream-arrow', 'click', streamArrowClick)
			addEventListener('.arrow-container', 'click', albumClick)
			addEventListener('.album-container img', 'click', albumClick)
			addEventListener('.edit-icon', 'click', editButtonClick)
			addEventListener('.close-icon', 'click', editButtonClick)
			addEventListener('.flag-icon', 'click', flagButtonClick)
			addEventListener('.track-add-btn', 'click', addTrackClick)
			addEventListener('.track-delete-btn', 'click', deleteTrackClick)
			addEventListener('.edit-submit-btn', 'click', editSubmitClick)
			addEventListener('.album-edit-cover', 'change', updateSelectedCover)

			$('.track-input-container').arrangeable({
				dragSelector: '.draggable-area'
				})
			
			#Adjusts text size to make sure the titles fit within their containers
				
			if refreshSplash
				$('#splash-container').show(400, ->
					$('.text-size-wrapper h2, .artist-year-container p').each ->
						fontSize = 20
						while $(this).width() > $(this).parent().width()
							$(this).css('font-size', fontSize -= 0.5)
							padding = Math.pow(fontSize, -fontSize * 0.6)
				)
			else
				$('.text-size-wrapper h2, .artist-year-container p').each ->
					fontSize = 20
					while $(this).width() > $(this).parent().width()
						$(this).css('font-size', fontSize -= 0.5)
						padding = Math.pow(fontSize, -fontSize * 0.6)
		
		#Session storage population
		
		$('.spinner').removeClass('hidden')
		jsonAlbums = fetch("#{host}limit=40&total_count=true")
		.then (response) ->
			return response.json()
		.catch (error) ->
			console.log('Error fetching from database! Error:\n' + error)
			return
		.then (json) ->
			albums = sortAlbums(json)
		.then ->
			displayAlbum()
		.then ->
			$('.spinner').addClass('hidden')

		#Helper method for opening an info container. Call it as 'sibling: undefined' to reset all info containers.
		
		toggleAlbum = (title, sibling, parent, arrow) ->
			timeout = 0
			timeout = 300 if albumOpen
			vinylClicked = false
			$('.album-arrow').css('transform', 'rotate(0)')
			$('.album-container').css('height', '327px')
			$('.info-wrapper').css('height', '0')
			$('.info-wrapper').css('border-top', 'none')
			$('.info-wrapper').css('border-bottom', 'none')
			$('.info-wrapper').css('padding', '0 15px 0 15px')
			$('.album-container').find('img').removeClass('image-border')
			$('iframe').each ->
				this.contentWindow.postMessage('{"event":"command","func":"stopVideo","args":""}', '*')
			setTimeout( ->
				$('.info-wrapper').css('display', 'none')
				$('.info-container').css('display', 'none')
			,
			timeout)
			if sibling isnt undefined && !sibling.hasClass('is-open')
				parent.find('img').addClass('image-border')
				setTimeout( ->
					sibling.parent().css('display', 'block')
					sibling.parent().addClass('offset')
					sibling.css('display', 'flex')
					albumOpen = true
					setTimeout( ->
						offset = parent.offset().top + 115
						$('.offset').css('top', offset)
						$('.info-wrapper').attr('class', 'info-wrapper')
						sibling.addClass('is-open')
						expandImg = sibling.find('.expandable-img')
						editImg = sibling.find('.cover-editable')
						if expandImg.attr('src') == ''
							expandImg.attr('src', albums.get(title).coverlink)
							editImg.attr('src', albums.get(title).coverlink)
						sibling.find('.info-background img').css('display', 'block')
						arrow.css('transform', 'rotate(180deg)')
						parent.css('height', '820px')
						sibling.css('height', '475px')
						sibling.css('border-top', '1px #8c8c8c solid')
						sibling.css('border-bottom', '1px #8c8c8c solid')
						sibling.css('padding', '15px 15px 15px 15px')
						#if expandImg.get()[0].complete && expandImg.get()[0].naturalHeight != 0
						$(expandImg).on('load', ->
							sibling.find('.vinyl-icon').removeClass('hidden')
							if expandImg.height() < expandImg.width()
								sibling.find('.vinyl-icon').css('width', expandImg.height())
								sibling.find('.vinyl-icon').css('height', expandImg.height())
						)
					,
					1)
				,
				timeout)
			else
				albumOpen = false
				$('.info-wrapper').removeClass('is-open')
		
		#Handler for 'random' button. Picks an album-container, scrolls to it, and then opens it
		
		$('#random').click (event) ->
			ids = []
			$('.album-container').each ->
				ids.push($(this).attr('id'))
			random = Math.floor(Math.random() * ids.length)
			id = ids[random]
			container = $('#' + id)
			title = id
			sibling = container.siblings('#' + title + '-info').find('.info-wrapper')
			parent = container
			arrow = container.find('.album-arrow')
			toggleAlbum(title, sibling, parent, arrow)
			if albumOpen then timer = 300 else timer = 0
			setTimeout( ->
				$(container).get()[0].scrollIntoView({behaviour: 'smooth'})
			, timer)
		
		#Handler for clicking the 'sort' buttons
		
		$('.sort-btn').click ->
			clickedArrow = $(this).children('a').text()
			$('#sort-list li').each ->
				if $(this).children('a').text() != clickedArrow
					$(this).find('ion-icon').removeClass('rotated')
			$(this).find('ion-icon').toggleClass('rotated')
			albumSort($(this).children('a').text(), $(this).find('ion-icon').hasClass('rotated'))
		
		#Method for searching
		
		search = (input) ->
			toggleAlbum(sibling: undefined)
			#input = input.target.value
			$('#splash-container').empty()
			$('.spinner').removeClass('hidden')
			#console.log(input)
			jsonAlbums = fetch("#{host}q=#{input}&q_track=true&limit=40")
			.then (response) ->
				return response.json()
			.catch (error) ->
				console.log('Error fetching from database! Error:\n' + error)
				return
			.then (json) ->
				albums = sortAlbums(json)
				displayAlbum()
			.then ->
				$('.spinner').addClass('hidden')
		
		#Search listener
		
		$('#main-search').on('input', (e) ->
			searched = true
			clearTimeout(delayTimer)
			delayTimer = setTimeout( ->
				search(e.target.value)
			, 300)
		)
		
		#Get search field query
		
		searchQ = () ->
			qStr = $('#main-search').val()
			if qStr != ''
				qStr = "q=#{qStr}&"
			else
				qStr = ''
			return qStr
		
		#Method for sorting albums
		 	
		albumSort = (string, dir) ->
			$('#splash-container').empty()
			$('.spinner').removeClass('hidden')
			$('#splash-container').removeClass()
			dirStr = if dir then 'asc' else 'desc'
			$('#splash-container').addClass("sorted-#{string}-#{dirStr}")
			fetch("#{host}#{searchQ()}sort=#{dirStr}&sort_type=#{string}&limit=40")
			.then (response) ->
				return response.json()
			.catch (error) ->
				console.log('Error fetching from database! Error:\n' + error)
				return
			.then (json) ->
				#console.log(albums)
				albums = sortAlbums(json)
				#console.log(albums)
				toggleAlbum(sibling: undefined)
				displayAlbum()
				#console.log(albums)
			.then ->
				$('.spinner').addClass('hidden')
		
		#Load more albums on scroll
		
		concatMaps = (map, iterables) ->
			iterables.forEach( (value, key) ->
				map.set(key, value)
			)
		
		$(window).scroll ->
			if $(window).scrollTop() + $(window).height() >= $(document).height() and $(document).height() > $(window).height() and !fetchInProgress
				offset = albums.size
				fetchInProgress = true
				if albums.size >= totalCount - 1
					return
				else if albums.size + 40 > totalCount - 1
					offset = totalCount - (totalCount - albums.size)
				if $('#splash-container').attr('class') == undefined
					@sortClass = ''
				else 
					@sortClass = $('#splash-container').attr('class')
				sortStr = sortClass.split(/-/).toString
				if sortStr.length > 0
					fetchStr = "#{host}#{searchQ()}limit=40&offset=#{offset}&sort=#{sortStr[2]}&sort_type=#{sortStr[1]}"
				else
					fetchStr = "#{host}#{searchQ()}limit=40&offset=#{offset}"
				fetch(fetchStr)
				.then (response) ->
					return response.json()
				.catch (error) ->
					console.log('Error fetching from database! Error:\n' + error)
					return
				.then (json) ->
					concatMaps(albums, sortAlbums(json))
				.then ->
					displayAlbum(false)
				.then ->
					fetchInProgress = false
