$(document).on "turbolinks:load", ->
	if $("body").hasClass("albums index")
		window.albumsNameSpace = {}
		ytAPIkey = "AIzaSyAA9tEp3x9uIC60zQfLds8ZlNrwRCBwc5Q"
	
		#console.log("albums.coffee is running.")
	
		#Populate localstorage object
	
		populateAlbums = ->
			if typeof gon != "undefined"
				jsonAlbums = JSON.stringify(gon.Albums)
				jsonTracks = JSON.stringify(gon.Tracks)
			localStorage.setItem("Albums", jsonAlbums)
			localStorage.setItem("Tracks", jsonTracks)
	
		populateAlbums()
	
		#Global variable declaration
		
		rawAlbums = JSON.parse(localStorage.getItem("Albums"))
		masterAlbums = {}
		assignKey = (album) ->
			masterAlbums[album.id] = album
		assignKey(album) for album in rawAlbums
		albums = []
		albums.push(masterAlbums[i+1]) for album, i in Object.values(masterAlbums)
		sortedAlbums = albums.sort (a, b) ->
			compA = parseInt(a.quality)
			compB = parseInt(b.quality)
			return (compB - compA)
		masterTracks = JSON.parse(localStorage.getItem("Tracks"))
		tracks = masterTracks
		albumOpen = false
		delayTimer = null
		loadedAlbums = 0
	
		#Helper method for opening an info container. Call it as 'sibling: undefined' to reset all info containers.
	
		toggleAlbum = (title, sibling, parent, arrow) ->
			timeout = 0
			timeout = 300 if albumOpen
			$(".album-arrow").css("transform", "rotate(0)")
			$(".album-container").css("height", "327px")
			$(".info-wrapper").css("height", "0")
			$(".album-container").find("img").removeClass("image-border")
			setTimeout( ->
				$(".info-wrapper").css("display", "none")
				$(".info-container").css("display", "none")
			,
			timeout)
			if sibling isnt undefined && !sibling.hasClass("is-open")
				parent.find("img").addClass("image-border")
				if sibling.find(".video-slider").find("iframe:first-child").attr("src") == ''
					albumID = masterAlbums[parseInt(title)]
					album = albumID.title
					artist = albumID.romaji_artist
					url = "https://www.googleapis.com/youtube/v3/search"
					searchResults = {}
					#console.log("Artist + album: ", artist, album)
					params =
						part: 'snippet'
						key: ytAPIkey
						q: album + " " + artist + " full album"
						type: "video"
						maxResults: "5"
					#.log("Params: ", params)
					success = (result) ->
						setItem = (i, item) ->
							#console.log("i + item: ", i, item)
							searchResults[i] = item.id.videoId
						setItem(i, item) for item, i in result.items
						sliderItems = sibling.find(".video-slider").find("iframe")
						setSourceVideo = (i, iframe) ->
							#console.log("searchResults: ", searchResults)
							#console.log("video ID: ", searchResults[i.toString()])
							$(iframe).attr("src", "https://www.youtube.com/embed/" + searchResults[i.toString()])
						setSourceVideo(i, iframe) for iframe, i in sliderItems
					$.ajax(
						dataType: "json"
						url: url
						data: params
						success: success
					)
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
						img = sibling.find("img").attr("src")
						sibling.find(".info-background img").css("display", "block")
						arrow.css("transform", "rotate(180deg)")
						parent.css("height", "820px")
						sibling.css("height", "475px")
					,
					1)
				,
				timeout)
			else 
				albumOpen = false
				$(".info-wrapper").removeClass("is-open")
	
		#Handler for viewing album-info.
	
		albumClick = (e) ->
			title = e.closest(".album-container").attr("id")
			sibling = $("#" + title + "-info").find(".info-wrapper")
			parent = $("#" + title)
			arrow = parent.find(".album-arrow")
			toggleAlbum(title, sibling, parent, arrow)
	
	
		#Handler for image click-zoom
	
		clickImage = (e) ->
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
	
		displayAlbum = (min, max, refreshSplash = true) ->
			$("#splash-container").toggle() if refreshSplash
			createAlbum = (i) ->
				currentAlbum = sortedAlbums[i]
				albumID = currentAlbum.id
				albumTracks = []
				albumLi = 
				"<li>
					<div class='album-container' id='"+albumID+"'>
						<div class='album-text-container'>
							<div class='text-size-wrapper'>
								<h2>"+currentAlbum.title+"</h2>
							</div>
							<img src='" + currentAlbum.coverlink + "'>
							<div class='artist-year-container'>
								<p class='artist'>"+currentAlbum.romaji_artist+"</p>
								<p class='year'>"+currentAlbum.year+"</p>
							</div>
						</div>
						<div class='arrow-container'><ion-icon name='ios-arrow-down' class='album-arrow'></ion-icon></div>
					</div>
					<div class='info-container offset' id='"+albumID+"-info'>
						<div class='info-wrapper'>
							<div class='info-background'>"+"<img src='" + currentAlbum.coverlink + "'></div>
							<div class='info-text-container'>
								<div class='text-container'>
									<div class='title-container'>
										<h2>"+currentAlbum.title+"</h2>
										<h3><i>"+currentAlbum.romanization+"</i></h3>
									</div>
									<div class='artist-container'>
										<p>"+currentAlbum.romaji_artist+"</p>
										<p class='label'>"+currentAlbum.japanese_artist+"</p>
									</div>
									<div class='release-date'>
										<p class='label'>Release date:</p>
										<p>"+currentAlbum.year+"</p>
									</div>
									<div class='flavor'>
										<p class='label'>Flavor:</p>
										<p class='flavor-value'>"+currentAlbum.flavor+"</p>
									</div>
									<div class='description-container'>
										<p class='label'>Description:</p>
										<p class='description'>"+currentAlbum.description+"</p>
									</div>
								</div>
								<div class='track-grow-wrapper'>
									<div class='link-image-container'>" +
										#<ul class='info-link-list'>
										#	<li><img class='video-stream-img' src='https://png.icons8.com/metro/1600/cinema-.png'></img></li>
										#</ul>
										"<img class='expandable-img' src='" + currentAlbum.coverlink + "'>
									</div>
									<div class='info-divider'></div>
									<div class='stream-slider-container'>
										<ion-icon name='ios-arrow-back' class='stream-arrow stream-arrow-left'></ion-icon>
										<ion-icon name='ios-arrow-forward' class='stream-arrow stream-arrow-right'></ion-icon>
                                        <div class='tooltip'>
                                        	<span class='tooltiptext'>
                                            	<a>The videos in the box are the top 5 search results on YouTube for this album.</a>
                                            </span>
                                            <ion-icon class='info-help-icon' name='help-circle-outline'></ion-icon>
                                        </div>
										<div class='video-slider'>
											<iframe src=''>
											</iframe>
											<iframe src=''>
											</iframe>
											<iframe src=''>
											</iframe>
											<iframe src=''>
											</iframe>
											<iframe src=''>
											</iframe>
										</div>
									</div>
									<div class='info-divider'></div>
									<div class='tracklist-wrapper'>
										<h3>Tracklist:</h3>
										<ul class='tracklist-container'>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</li>"
				
				$("#splash-container").append(albumLi)
				$("#" + albumID + "-info .expandable-img").get()[0].addEventListener("click",(e) -> clickImage($(this)))
				$("#" + albumID + " .arrow-container").get()[0].addEventListener("click", (e) -> albumClick($(this)))
				$("#" + albumID + " img").get()[0].addEventListener("click", (e) -> albumClick($(this)))
				
				albumTracks.push(track) for track in tracks when track.album_id is albumID
		
				addTrack = (track, i) -> 
					$("#" + albumID + "-info").find(".tracklist-container").append(
						"
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
						)
		
				addTrack(track, i) for track, i in albumTracks
				loadedAlbums++
				
			createAlbum(i) for i in [min...max]
			
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
	
		window.albumsNameSpace.displayAlbum = displayAlbum
	
		displayAlbum(0, 40)
		
		window.albumsNameSpace.albumTotalCount = masterAlbums.length
	
		$("#album-total-count").text(albums.length)
	
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
			albumSort($(this).children("a").text())

		#Handler for toggling regex matching
	
		$("#regex").click ->
			regex = $(this)
			regex.toggleClass("brightness")
			regex.toggleClass("gray")
	
		#Method for searching
	
		window.albumsNameSpace.search = (input) ->
			new Promise (resolve) ->
				loadedAlbums = 40
				toggleAlbum(sibling: undefined)
				rawInput = $(input).val()
				inputValues = rawInput.split(/,/)
				inputValues[i] = inputValues[i].trim() for i of inputValues
				sortedAlbums = albums
				tracks = masterTracks
				if $(input).data("lastval") isnt rawInput
					$(input).data("lastval", rawInput)
					$("#splash-container").empty()
					if rawInput isnt ""
						doSearch = (album) ->
							albumValues = [
								album.title,
								album.romanization,
								album.romaji_artist,
								album.japanese_artist,
								album.year,
								album.description,
								album.flavor
								]
							trackValues = []
							trackValues.push(track.title, track.romanization) for track in tracks when track.album_id == album.id
							matchValues = albumValues.concat(trackValues)
							if checkMatch(matchValues, inputValues)
								tempAlbums.push(album)
						tempAlbums = []
						doSearch(sortedAlbums[album.id-1]) for album in sortedAlbums
						sortedAlbums = tempAlbums
						asyncDisplayAlbum(0, sortedAlbums.length)
					else
						asyncDisplayAlbum(0, 40)
				resolve("resolved")
	
		#Search listener
	
		$("#main-search").on("input", (e) ->
			clearTimeout(delayTimer)
			delayTimer = setTimeout( ->
				asyncSearch(e)
			, 150)
		)
	
		#Helper method for checking if any 'conditions' match the selected text
	
		checkMatch = (values, conditions) ->
			blackList = []
			conditionCount = []
			conditionCount.push(false) for val in conditions
			match = (value, conditions) ->
				compConditions = []
				if $("#regex").hasClass("brightness")
					compConditions.push(new RegExp(cond)) for cond in conditions
					testSuccess = (regexCond) ->
						blackList.push(regexCond.source)
						conditionCount[conditionCount.findIndex((element) -> element == false)] = true
					testSuccess(regexCond) for regexCond in compConditions when regexCond.test(value) && blackList.find((element) -> element == regexCond.source) == undefined
				else
					compValue = escapeRegExp(value).toUpperCase()
					compConditions.push(escapeRegExp(cond).toUpperCase()) for cond in conditions
					testSuccess = (compCond) ->
						blackList.push(compCond)
						conditionCount[conditionCount.findIndex((element) -> element == false)] = true
					testSuccess(compCond) for compCond in compConditions when compValue.match(compCond) != null && blackList.find((element) -> element == compCondition) == undefined
			match(val, conditions) for val in values when !(conditionCount.find((element) -> element == false) == undefined)
			if (conditionCount.find((element) -> element == false) == undefined)
				return true
			else
				return false
	
		#Helper method for escaping regex input
	
		escapeRegExp = (string) ->
			return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')

		#Method for sorting albums
	  	
		albumSort = (string) ->
			albumList = $("#splash-container")
			albumList.empty()
			switch string
				when "Title"
					if !albumList.hasClass("title-sorted-up") && !albumList.hasClass("title-sorted-down")
						albumList.attr("class", "title-sorted-down")
					if albumList.hasClass("title-sorted-up") then albumList.attr("class", "title-sorted-down") else albumList.attr("class", "title-sorted-up")
					sortedAlbums = albums.sort (a, b) -> 
						compA = a.title.toUpperCase()
						compB = b.title.toUpperCase()
						if albumList.hasClass("title-sorted-up")
							return compA.localeCompare(compB)
						else
							return compB.localeCompare(compA)
					break;
				when "Artist"
					if !albumList.hasClass("artist-sorted-up") && !albumList.hasClass("artist-sorted-down")
						albumList.attr("class", "artist-sorted-down")
					if albumList.hasClass("artist-sorted-up") then albumList.attr("class", "artist-sorted-down") else albumList.attr("class", "artist-sorted-up")
					sortedAlbums = albums.sort (a, b) -> 
						compA = a.romaji_artist.toUpperCase()
						compB = b.romaji_artist.toUpperCase()
						if albumList.hasClass("artist-sorted-up")
							return compA.localeCompare(compB)
						else
							return compB.localeCompare(compA)
					break;
				when "Year"
					if !albumList.hasClass("year-sorted-up") && !albumList.hasClass("year-sorted-down")
						albumList.attr("class", "year-sorted-down")
					if albumList.hasClass("year-sorted-up") then albumList.attr("class", "year-sorted-down") else albumList.attr("class", "year-sorted-up")
					sortedAlbums = albums.sort (a, b) -> 
						compA = parseInt(a.year)
						compB = parseInt(b.year)
						if albumList.hasClass("year-sorted-up")
							return (compA - compB)
						else
							return (compB - compA)
					break;
				when "Flavor"
					if !albumList.hasClass("flavor-sorted-up") && !albumList.hasClass("flavor-sorted-down")
						albumList.attr("class", "flavor-sorted-down")
					if albumList.hasClass("flavor-sorted-up") then albumList.attr("class", "flavor-sorted-down") else albumList.attr("class", "flavor-sorted-up")
					sortedAlbums = albums.sort (a, b) -> 
						compA = a.flavor.toUpperCase()
						compB = b.flavor.toUpperCase()
						if albumList.hasClass("flavor-sorted-up")
							return compA.localeCompare(compB)
						else
							return compB.localeCompare(compA)
					break;
				when "Quality"
					if !albumList.hasClass("quality-sorted-up") && !albumList.hasClass("quality-sorted-down")
						albumList.attr("class", "quality-sorted-down")
					if albumList.hasClass("quality-sorted-up") then albumList.attr("class", "quality-sorted-down") else albumList.attr("class", "quality-sorted-up")
					sortedAlbums = albums.sort (a, b) -> 
						compA = parseInt(a.quality)
						compB = parseInt(b.quality)
						if albumList.hasClass("quality-sorted-up")
							return (compA - compB)
						else
							return (compB - compA)
					break;
					
			loadedAlbums = 0
			toggleAlbum(sibling: undefined)
			if sortedAlbums.length >= 40
				displayAlbum(0, 40)
			else
				displayAlbum(0, albums.length)
				
		#Load more albums on scroll
		
		$(window).scroll -> 
			if $(window).scrollTop() + $(window).height() >= $(document).height()
				albumsToLoad = sortedAlbums.length - loadedAlbums
				if albumsToLoad >= 40
					displayAlbum(loadedAlbums, loadedAlbums + 40, false)
				else
					if albumsToLoad < 40 && albumsToLoad > 0
						displayAlbum(loadedAlbums, loadedAlbums + albumsToLoad, false)
					else
						#console.log("No more albums to load!")
						
		#Handler for clicking YT link
		
		$(".video-stream-img").click ->
			openedAlbum = $(this).closest(".info-container")
			albumID = sortedAlbums[parseInt(openedAlbum.prev(".album-container").attr("id")) - 1]
			album = albumID.title
			artist = albumID.romaji_artist
			url = "https://www.googleapis.com/youtube/v3/search"
			searchResults = {}
			params =
				part: 'snippet'
				key: ytAPIkey
				q: album + artist
				type: "video"
				maxResults: "5"
			success = (result) ->
				setItem = (i, item) ->
					searchResults[i] = item.id.videoId
				setItem(i, item) for item, i in result.items
				sliderItems = openedAlbum.find(".video-slider").find("iframe")
				setSourceVideo = (i, iframe) ->
					$(iframe).attr("src", "https://www.youtube.com/embed/" + searchResults[i.toString()])
				setSourceVideo(i, iframe) for iframe, i in sliderItems
			$.ajax(
				dataType: "json"
				url: url
				data: params
				success: success
			)
			
		#Handlers for stream slider buttons
		
		$(".stream-arrow").click ->
			rightArrow = $(this).hasClass("stream-arrow-right") ? true : false
			firstChild = $(this).siblings(".video-slider").children("iframe:first-child")
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