$(document).on "turbolinks:load", ->
	if $("body").hasClass("albums show")
		
		#Global variable declaration
		
		#host = "https://album-chart-ivakam.c9users.io/albums/fetch?"
		host = "http://varieti.es/albums/fetch?"
		albumOpen = false
		delayTimer = null
		vinylClicked = false
		titleReplaceRegex = /[\s\'\"\.\(\)]/g
		window.albumsNameSpace = {}
		ytAPIkey = "AIzaSyAA9tEp3x9uIC60zQfLds8ZlNrwRCBwc5Q"
		totalCount = 0
		albums = null
		
		#console.log("albums.coffee is running.")
		
		sortAlbums = (arr) ->
			popTemp = (a, i, arr) ->
				tempAlbums.set(a.title.replace(titleReplaceRegex, ""), arr[i])
			tempAlbums = new Map()
			popTemp(a, i, arr) for a, i in arr
			return tempAlbums
		
		#Handler for viewing album-info.
		
		albumClick = (e) ->
			e = $(e.target)
			title = e.parent().find(".text-size-wrapper h2").text().replace(titleReplaceRegex, "")
			sibling = $("##{title}-info").find(".info-wrapper")
			parent = $("##{title}")
			arrow = parent.find(".album-arrow")
			toggleAlbum(title, sibling, parent, arrow)
		
		#Handler for expanding the YT viewbox
		
		vinylClick = (e) ->
			vinylClicked = true
			e = $(e.target)
			container = e.parent()
			video = e.siblings(".stream-slider-container")
			e.css("right", "100%")
			e.css("transform", "rotate(-180deg)")
			container.css("min-width", "1045px")
			container.css("max-width", "1045px")
			video.css("margin-right", "45px")
			setTimeout( ->
				if video.find(".video-slider").find("iframe:first-child").attr("src") == ''
					title = container.closest(".info-container").siblings(".album-container").attr("id")
					albumID = albums.get(title)
					album = albumID.title
					artist = albumID.romaji_artist
					url = "https://www.googleapis.com/youtube/v3/search"
					searchResults = {}
					params =
						part: 'snippet'
						key: ytAPIkey
						q: album + " " + artist + " full album"
						type: "video"
						maxResults: "5"
					success = (result) ->
						setItem = (i, item) ->
							searchResults[i] = item.id.videoId
						setItem(i, item) for item, i in result.items
						sliderItems = video.find(".video-slider").find("iframe")
						setSourceVideo = (i, iframe) ->
							$(iframe).attr("src", "https://www.youtube.com/embed/" + searchResults[i.toString()] + "?enablejsapi=1&version=3&playerapiid=ytplayer")
						setSourceVideo(i, iframe) for iframe, i in sliderItems
					error = (result) ->
						console.log("Failed to fetch YouTube data: ", result)
					$.ajax(
						dataType: "json"
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
			vinyl = container.children(".vinyl-icon")
			vinyl.css("right", "0")
			vinyl.css("transform", "rotate(0deg)")
			container.css("min-width", "390px")
			container.css("max-width", "390px")
			video.css("margin-right", "625px")
			container.find("iframe").each ->
				this.contentWindow.postMessage('{"event":"command","func":"stopVideo","args":""}', '*')
		
		#Handlers for stream slider buttons
		
		streamArrowClick = (e) ->
			e = $(e.target)
			rightArrow = e.hasClass("stream-arrow-right") ? true : false
			firstChild = e.siblings(".video-slider").children("iframe:first-child")
			if Number.isInteger(parseInt(firstChild.css("margin-left")) / 600)
				if rightArrow
					if parseInt(firstChild.css("margin-left")) > -2400
						firstChild.css("margin-left", (parseInt(firstChild.css("margin-left")) - 600).toString() + "px")
					else
						firstChild.css("margin-left", "0")
				else
					if parseInt(firstChild.css("margin-left")) < 0
						firstChild.css("margin-left", (parseInt(firstChild.css("margin-left")) + 600).toString() + "px")
					else
						firstChild.css("margin-left", "-2400px")
		
		#Handler for vinyl icon hover
		
		vinylHoverOn = (e) ->
			if !vinylClicked
				e = $(e.target)
				e.parent().css("min-width", "590px")
				e.parent().css("max-width", "590px")
		
		vinylHoverOff = (e) ->
			if !vinylClicked
				e = $(e.target)
				e.parent().css("min-width", "390px")
				e.parent().css("max-width", "390px")
		
		#Handler for image click-zoom
		
		clickImage = (e) ->
			e = $(e.target)
			opacity = $("#opaque")
			img = $(".bigimage")
			imgsrc = e.attr("src")
			if !img.hasClass("enlargened")
				img.addClass("enlargened")
				img.attr("src", imgsrc)
				offset = img.width() / 2
				$(".enlargened").css("left", ($(window).width() / 2) - offset)
				$(".enlargened").css("top", ($(window).height() / 2) - offset)
				opacity.css("background", "rgba(0, 0, 0, 0.6")
				opacity.css("z-index", "4")
		
		#Create an album
		
		displayAlbum = (refreshSplash = true) ->
			$("#splash-container").toggle() if refreshSplash
			vinylClicked = false
			albumLi = ""
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
				trackListStr = ""
				trackListStr += addTrack(track, i) for track, i in album.tracklist
				id = album.title.replace(titleReplaceRegex, "")
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
									<div class='link-image-container'>" +
										"<img class='expandable-img' src=''>
										<img class='vinyl-icon hidden' src='https://upload.wikimedia.org/wikipedia/commons/7/75/Vinyl_record.svg'>
										<div class='stream-slider-container'>
											<ion-icon name='ios-close' class='stream-close'></ion-icon>
											<ion-icon name='ios-arrow-back' class='stream-arrow stream-arrow-left'></ion-icon>
											<ion-icon name='ios-arrow-forward' class='stream-arrow stream-arrow-right'></ion-icon>
											<div class='video-slider'>
												<iframe src='' allowfullscreen='true' allowscriptaccess='always' frameborder='0'>
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
								</div>
							</div>
						</div>
					</div>
				</li>"
				
			albums.forEach( (value, key) ->
				if value.loaded != true
					createAlbum(value)
			)
			$("#splash-container").append(albumLi)
			addEventListener = (element, event, func) ->
				$(element).each ->
					$(this).get()[0].removeEventListener(event, func)
					$(this).get()[0].addEventListener(event, func)
			addEventListener(".expandable-img", "click", clickImage)
			addEventListener(".vinyl-icon", "click", vinylClick)
			addEventListener(".vinyl-icon", "mouseover", vinylHoverOn)
			addEventListener(".vinyl-icon", "mouseout", vinylHoverOff)
			addEventListener(".stream-close", "click", streamCloseClick)
			addEventListener(".stream-arrow", "click", streamArrowClick)
			addEventListener(".arrow-container", "click", albumClick)
			addEventListener(".album-container img", "click", albumClick)
			
			#Adjusts text size to make sure the titles fit within their containers
				
			if refreshSplash
				$("#splash-container").show(400, ->
					$(".text-size-wrapper h2, .artist-year-container p").each ->
						fontSize = 20
						while $(this).width() > $(this).parent().width()
							$(this).css("font-size", fontSize -= 0.5)
							padding = Math.pow(fontSize, -fontSize * 0.6)
				)
			else
				$(".text-size-wrapper h2, .artist-year-container p").each ->
					fontSize = 20
					while $(this).width() > $(this).parent().width()
						$(this).css("font-size", fontSize -= 0.5)
						padding = Math.pow(fontSize, -fontSize * 0.6)
		
		#Session storage population
		
		if !sessionStorage.getItem("Albums")
			$(".spinner").removeClass("hidden")
			jsonAlbums = fetch("#{host}limit=40&total_count=true")
			.then (response) ->
				return response.json()
			.catch (error) ->
				console.log("Error fetching from database! Error:\n" + error)
				return
			.then (json) ->
				sessionStorage.setItem("Albums", JSON.stringify(json))
				totalCount = json[json.length - 1]
				json.pop()
				albums = sortAlbums(json)
			.then ->
				displayAlbum()
			.then ->
				$(".spinner").addClass("hidden")
		else
			tempAlbums = JSON.parse(sessionStorage.getItem("Albums"))
			totalCount = tempAlbums[tempAlbums.length - 1]
			tempAlbums.pop()
			albums = sortAlbums(tempAlbums)
			displayAlbum()
			$(".spinner").addClass("hidden")
			
		#Helper method for opening an info container. Call it as 'sibling: undefined' to reset all info containers.
			
		toggleAlbum = (title, sibling, parent, arrow) ->
			timeout = 0
			timeout = 300 if albumOpen
			vinylClicked = false
			$(".album-arrow").css("transform", "rotate(0)")
			$(".album-container").css("height", "327px")
			$(".info-wrapper").css("height", "0")
			$(".info-wrapper").css("border-top", "none")
			$(".info-wrapper").css("border-bottom", "none")
			$(".info-wrapper").css("padding", "0 15px 0 15px")
			$(".album-container").find("img").removeClass("image-border")
			$('iframe').each ->
				this.contentWindow.postMessage('{"event":"command","func":"stopVideo","args":""}', '*')
			setTimeout( ->
				$(".info-wrapper").css("display", "none")
				$(".info-container").css("display", "none")
			,
			timeout)
			if sibling isnt undefined && !sibling.hasClass("is-open")
				parent.find("img").addClass("image-border")
				setTimeout( ->
					sibling.parent().css("display", "block")
					sibling.parent().addClass("offset")
					sibling.css("display", "flex")
					albumOpen = true
					setTimeout( ->
						offset = parent.offset().top + 132
						$(".offset").css("top", offset)
						$(".info-wrapper").attr("class", "info-wrapper")
						sibling.addClass("is-open")
						expandImg = sibling.find(".expandable-img")
						if expandImg.attr("src") == ""
							expandImg.attr("src", albums.get(title).coverlink)
						sibling.find(".info-background img").css("display", "block")
						arrow.css("transform", "rotate(180deg)")
						parent.css("height", "820px")
						sibling.css("height", "475px")
						sibling.css("border-top", "1px #8c8c8c solid")
						sibling.css("border-bottom", "1px #8c8c8c solid")
						sibling.css("padding", "15px 15px 15px 15px")
						#if expandImg.get()[0].complete && expandImg.get()[0].naturalHeight != 0
						$(expandImg).on('load', ->
							sibling.find(".vinyl-icon").removeClass("hidden")
							if expandImg.height() < expandImg.width()
								sibling.find(".vinyl-icon").css("width", expandImg.height())
								sibling.find(".vinyl-icon").css("height", expandImg.height())
						)
					,
					1)
				,
				timeout)
			else 
				albumOpen = false
				$(".info-wrapper").removeClass("is-open")
						
		window.albumsNameSpace.albumTotalCount = totalCount
		
		$("#album-total-count").text(totalCount)
		
		#Handler for 'random' button. Picks an album-container, scrolls to it and then opens it
		
		$("#random").click (event) ->
			ids = []
			$(".album-container").each ->
				ids.push($(this).attr("id"))
			random = Math.floor(Math.random() * ids.length)
			id = ids[random]
			container = $("#" + id)
			title = id
			sibling = container.siblings("#" + title + "-info").find(".info-wrapper")
			parent = container
			arrow = container.find(".album-arrow")
			toggleAlbum(title, sibling, parent, arrow)
			if albumOpen then timer = 300 else timer = 0
			setTimeout( ->
				$(container).get()[0].scrollIntoView({behaviour: "smooth"})
			, timer)
			
			
		#Handler for closing the zoom-mode for images
			
		$("#opaque").click ->
			$("img").removeClass("enlargened")
			$(this).css("background", "rgba(0,0,0,0)")
			$(".bigimage").attr("src", "")
			$(this).css("z-index", "0")
	
		#Handler for clicking the 'sort' buttons
	
		$(".sort-btn").click ->
			clickedArrow = $(this).children("a").text()
			$("#sort-list li").each ->
				if $(this).children("a").text() != clickedArrow
					$(this).find("ion-icon").removeClass("rotated")
			$(this).find("ion-icon").toggleClass("rotated")
			albumSort($(this).children("a").text(), $(this).find("ion-icon").hasClass("rotated"))
		
		#Method for searching
		
		search = (input) ->
			toggleAlbum(sibling: undefined)
			input = input.target.value
			$("#splash-container").empty()
			$(".spinner").removeClass("hidden")
			jsonAlbums = fetch("#{host}q=#{input}&limit=40")
			.then (response) ->
				return response.json()
			.catch (error) ->
				console.log("Error fetching from database! Error:\n" + error)
				return
			.then (json) ->
				albums = sortAlbums(json)
				displayAlbum()
			.then ->
				$(".spinner").addClass("hidden")
		
		#Search listener
		
		$("#main-search").on("input", (e) ->
			clearTimeout(delayTimer)
			delayTimer = setTimeout( ->
				search(e)
			, 150)
		)
		
		#Get search field query
		
		searchQ = () ->
			qStr = $("#main-search").val()
			if qStr != ""
				qStr = "q=#{qStr}&"
			else
				qStr = ""
			return qStr
		
		#Method for sorting albums
		 	
		albumSort = (string, dir) ->
			$("#splash-container").empty()
			$(".spinner").removeClass("hidden")
			dirStr = if dir then "asc" else "desc"
			fetch("#{host}#{searchQ()}sort=#{dirStr}&sort_type=#{string}&limit=40")
			.then (response) ->
				return response.json()
			.catch (error) ->
				console.log("Error fetching from database! Error:\n" + error)
				return
			.then (json) ->
				#console.log(albums)
				albums = sortAlbums(json)
				#console.log(albums)
				toggleAlbum(sibling: undefined)
				displayAlbum()
				#console.log(albums)
			.then ->
				$(".spinner").addClass("hidden")
		
		#Load more albums on scroll
		
		concatMaps = (map, iterables) ->
			iterables.forEach( (value, key) ->
				map.set(key, value)
			)
		
		$(window).scroll -> 
			if $(window).scrollTop() + $(window).height() >= $(document).height() and $(document).height() > $(window).height()
				offset = albums.size
				if albums.size >= totalCount - 1
					return
				else if albums.size + 40 > totalCount - 1
					offset = totalCount - (totalCount - albums.size)
				qStr = $("#main-search").val()
				fetch("#{host}#{searchQ()}limit=40&offset=#{offset}")
				.then (response) ->
					return response.json()
				.catch (error) ->
					console.log("Error fetching from database! Error:\n" + error)
					return
				.then (json) ->
					concatMaps(albums, sortAlbums(json))
				.then ->
					displayAlbum(false)