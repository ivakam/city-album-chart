$(document).on "turbolinks:load", ->

	console.log("albums.coffee is running.")

	#Populate localstorage object

	populateAlbums = ->
		jsonAlbums = JSON.stringify(gon.Albums)
		jsonTracks = JSON.stringify(gon.Tracks)
		localStorage.setItem("Albums", jsonAlbums)
		localStorage.setItem("Tracks", jsonTracks)

	populateAlbums()

	#Global variable declaration

	masterAlbums = JSON.parse(localStorage.getItem("Albums"))
	masterTracks = JSON.parse(localStorage.getItem("Tracks"))
	albums = masterAlbums
	tracks = masterTracks
	albumOpen = false
	delayTimer = null
	loadedAlbums = 40

	#Helper method for opening an info container. Call it as 'sibling: undefined' to reset all info containers.

	toggleAlbum = (title, sibling, parent, arrow) ->
		$(".album-arrow").css("transform", "rotate(0)")
		$(".album-container").css("height", "327px")
		$(".info-wrapper").css("display", "none")
		$(".info-container").css("display", "none")
		$(".info-wrapper").css("height", "0")
		if sibling isnt undefined && !sibling.hasClass("is-open")
			timeout = 0
			timeout = 300 if albumOpen 
			setTimeout( ->
				offset = parent.parent().offset().top + parent.parent().parent().scrollTop() + 140
				arrow.css("transform", "rotate(180deg)")
				parent.css("height", "800px")
				sibling.css("display", "flex")
				sibling.parent().css("display", "block")
				sibling.css("height", "400px")
				$(".offset").css("top", offset)
				sibling.parent().addClass("offset")
				$(".info-wrapper").attr("class", "info-wrapper")
				sibling.addClass("is-open")
				img = sibling.find("img").attr("src")
				sibling.find(".info-background img").css("display", "block")
				trackContainer = sibling.find(".tracklist-container")
				firstChild = trackContainer.children().first()
				newWidth = trackContainer.width() + firstChild.width()
				trackContainer.width(newWidth + 15)
				albumOpen = true
			,
			timeout)
		else 
			albumOpen = false
			$(".info-wrapper").removeClass("is-open")

	#Handler for viewing album-info.

	arrowClick = (e) ->
		title = e.parent().attr("id")
		sibling = e.parent().siblings("#" + title + "-info").find(".info-wrapper")
		parent = e.parent()
		arrow = e.find(".album-arrow")
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

	displayAlbum = (i, refresh = true) ->
		$("#splash-container").toggle() if refresh
		currentAlbum = albums[i]
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
				<div class='arrow-container'><span class='ion-chevron-down album-arrow'></span></div>
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
								<p class='label'>Artist:</p>
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
							<div class='tracklist-wrapper'>
								<h3>Tracklist:</h3>
								<ul class='tracklist-container'>
								</ul>
							</div>
						</div>
					</div>
					<img id='expandable-img' src='" + currentAlbum.coverlink + "'>
				</div>
			</div>
		</li>"

		$("#splash-container").append(albumLi)
		$("#" + albumID + "-info #expandable-img").get()[0].addEventListener("click",(e) -> clickImage($(this)))
		$("#" + albumID + " .arrow-container").get()[0].addEventListener("click", (e) -> arrowClick($(this)))
		if refresh
			$("#splash-container").show(400, ->
				$("#" + albumID + " .text-size-wrapper h2, #" + albumID + " .artist-year-container p").each ->
					fontSize = 20
					padding = 0
					while $(this).width() > $(this).parent().width()
						$(this).css("font-size", fontSize -= 0.5)
						padding = fontSize * 0.5
						#$(this).css("padding-top", padding)
			)

		#Adjusts text size to make sure the titles fit within their containers

		$("#" + albumID + " .text-size-wrapper h2, #" + albumID + " .artist-year-container p").each ->
			fontSize = 20
			while $(this).width() > $(this).parent().width()
				$(this).css("font-size", fontSize -= 0.5)
				padding = Math.pow(fontSize, -fontSize * 0.6)
				$(this).css("padding-top", padding)

		albumTracks.push(track) for track in tracks when track.album_id is albumID

		addTrack = (track, i) -> 
			$("#" + albumID + "-info").find(".tracklist-container").append(
				"
				<li class='track-container'>
					<div class='track-title-container'>
						<p>"+(i+1)+".</p>
						<p>" + track.title + "</p>
						<i>" + track.romanization + "</i>
					</div>
					<p class='duration'>" + track.duration + "</p>
				</li>
				"
				)

		addTrack(track, i) for track, i in albumTracks
		loadedAlbums++

	displayAlbum(i) for i in [0...40]

	$("#album-total-count").text(masterAlbums.length)

	#Handler for 'random' button. Picks an album-container, scrolls to it and then opens it

	$("#random").click (event) ->
		ids = []
		$(".album-container").each ->
			ids.push($(this).attr("id"))
		random = Math.floor(Math.random() * ids.length)
		id = ids[random]
		container = $("#" + id)
		$('#splash-container').animate({
		scrollTop: container.offset().top
		}, 500)
		title = id
		sibling = container.siblings("#" + title + "-info").find(".info-wrapper")
		parent = container
		arrow = container.find(".album-arrow")
		toggleAlbum(title, sibling, parent, arrow)
		
	#Handler for closing the zoom-mode for images

	$("#opaque").click ->
		$("img").removeClass("enlargened")
		$(this).css("background", "rgba(0,0,0,0)")
		$(".bigimage").attr("src", "")
		$(this).css("z-index", "0")

	#Handler for clicking the 'sort' buttons

	$(".sort-btn").click ->
		$("#sort-list li").removeClass("selected")
		$(this).addClass("selected")
		$("#sort-list li").each -> 
			if !$(this).hasClass("selected")
				$(this).find(".ion-chevron-down").removeClass("rotated")
		$(this).find(".ion-chevron-down").toggleClass("rotated")
		albumSort($(this).find("a").text())
		return

	#Handler for expanding the (currently empty) filter menu

	$("#show-filter").click ->
		if !$(".nav-list-container").hasClass("expanded")
			$(".nav-list-container").addClass("expanded")
			$(".nav-list-container").css("height", "250px")
		else
			$(".nav-list-container").removeClass("expanded")
			$(".nav-list-container").css("height", "135px")

	#Handler for toggling regex matching

	$("#regex").click ->
		regex = $(this)
		regex.toggleClass("brightness")
		regex.toggleClass("gray")

	#Search listener

	$("#main-search").on("input", (e) ->
		clearTimeout(delayTimer)
		delayTimer = setTimeout( ->
			search(e.target)
		, 100)
	)

	#Method for searching

	search = (input) -> 
		loadedAlbums = 40
		toggleAlbum(sibling: undefined)
		rawInput = $(input).val()
		inputValues = rawInput.split(/,/)
		inputValues[i] = inputValues[i].trim() for i of inputValues
		albums = masterAlbums
		tracks = masterTracks
		if $(input).data("lastval") isnt rawInput
			$(input).data("lastval", rawInput)
			$("#splash-container").empty()
			if rawInput isnt ""
				doSearch = (album) ->
					albumValues = []
					albumValues.push(val) for val in Object.values(album) when typeof val isnt "number"
					trackValues = []
					trackValues.push(track.title, track.romanization) for track in tracks when track.album_id == album.id
					matchValues = albumValues.concat(trackValues)
					if checkMatch(matchValues, inputValues)
						tempAlbums.push(album)
				tempAlbums = []
				doSearch(album) for album in albums
				albums = tempAlbums
				displayAlbum(i) for i in [0...albums.length]
			else
				displayAlbum(i) for i in [0...40]



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
		$("#splash-container").empty()
		switch string
			when "Title"
				if !albumList.hasClass("title-sorted-up") && !albumList.hasClass("title-sorted-down")
					albumList.attr("class", "title-sorted-down")
				if albumList.hasClass("title-sorted-up") then albumList.attr("class", "title-sorted-down") else albumList.attr("class", "title-sorted-up")
				albums = albums.sort (a, b) -> 
					compA = a.title.toUpperCase()
					compB = b.title.toUpperCase()
					if albumList.hasClass("title-sorted-up")
						return compA.localeCompare(compB)
					else
						return compB.localeCompare(compA)
				displayAlbum(i) for i in [0...loadedAlbums]
				break;
			when "Artist"
				if !albumList.hasClass("artist-sorted-up") && !albumList.hasClass("artist-sorted-down")
					albumList.attr("class", "artist-sorted-down")
				if albumList.hasClass("artist-sorted-up") then albumList.attr("class", "artist-sorted-down") else albumList.attr("class", "artist-sorted-up")
				albums = albums.sort (a, b) -> 
					compA = a.romaji_artist.toUpperCase()
					compB = b.romaji_artist.toUpperCase()
					if albumList.hasClass("artist-sorted-up")
						return compA.localeCompare(compB)
					else
						return compB.localeCompare(compA)
				displayAlbum(i) for i in [0...loadedAlbums]
				break;
			when "Year"
				if !albumList.hasClass("year-sorted-up") && !albumList.hasClass("year-sorted-down")
					albumList.attr("class", "year-sorted-down")
				if albumList.hasClass("year-sorted-up") then albumList.attr("class", "year-sorted-down") else albumList.attr("class", "year-sorted-up")
				albums = albums.sort (a, b) -> 
					compA = parseInt(a.year)
					compB = parseInt(b.year)
					if albumList.hasClass("year-sorted-up")
						return (compA > compB) ? -1 : (compA < compB) ? 1 : 0
					else
						return (compA < compB) ? -1 : (compA > compB) ? 1 : 0
				displayAlbum(i) for i in [0...loadedAlbums]
				break;
			when "Flavor"
				if !albumList.hasClass("flavor-sorted-up") && !albumList.hasClass("flavor-sorted-down")
					albumList.attr("class", "flavor-sorted-down")
				if albumList.hasClass("flavor-sorted-up") then albumList.attr("class", "flavor-sorted-down") else albumList.attr("class", "flavor-sorted-up")
				albums = albums.sort (a, b) -> 
					compA = a.flavor.toUpperCase()
					compB = b.flavor.toUpperCase()
					if albumList.hasClass("flavor-sorted-up")
						return compA.localeCompare(compB)
					else
						return compB.localeCompare(compA)
				displayAlbum(i) for i in [0...loadedAlbums]
				break;
		toggleAlbum(sibling: undefined)

	#Load more albums on scroll

	$("#splash-container").scroll -> 
		if $(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight
			albumsToLoad = albums.length - loadedAlbums
			if albumsToLoad >= 40
				displayAlbum(albumIndex, false) for albumIndex in [loadedAlbums...loadedAlbums + 40]
			else
				if albumsToLoad < 40 && albumsToLoad > 0
					displayAlbum(albumIndex, false) for albumIndex in [loadedAlbums...loadedAlbums + albumsToLoad]
				else
					console.log("No more albums to load!")