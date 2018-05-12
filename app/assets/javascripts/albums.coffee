$(document).on "turbolinks:load", ->

	console.log("albums.coffee is running.")
	# $("#splash-container").show("normal")
	# $("#splash-container").css("display", "flex")

	#Global variable declaration

	albumContainerWidth = $(".text-size-wrapper").width()
	albumHeight = "327px"
	albumOpen = false
	blackList = []
	delayTimer = null

	#Adjusts text size to make sure the titles fit within their containers

	$(".text-size-wrapper h2, .album-text-container p").each -> 
		fontSize = 20
		padding = 0
		while ($(this).width() > albumContainerWidth)
			$(this).css("font-size", fontSize -= 0.5)
			$(this).css("padding-top", padding += 0.5)

	$("#album-total-count").text($("#splash-container").children().length)

	#Handler for 'random' button. Picks an album-container, scrolls to it and then opens it

	$("#random").click (event) ->
		ids = []
		$(".album-container").each ->
			ids.push($(this).attr("id"))
		random = Math.floor(Math.random() * ids.length)
		id = ids[random]
		console.log(id)
		container = $("#" + id)
		$('#splash-container').animate({
		scrollTop: container.offset().top + 100
		}, 500)
		title = id
		sibling = container.siblings("#" + title + "-info").find(".info-wrapper")
		parent = container
		arrow = container.find(".album-arrow")
		toggleAlbum(title, sibling, parent, arrow)
		
	#Handler for image click-zoom

	$(".info-wrapper img").click ->
		opacity = $("#opaque")
		img = $(".bigimage")
		imgsrc = $(this).attr("src")
		if !img.hasClass("enlargened")
			img.addClass("enlargened")
			img.attr("src", imgsrc)
			#console.log(img.width())
			offset = img.width() / 2
			#console.log(offset)
			$(".enlargened").css("left", ($(window).width() / 2) - offset)
			$(".enlargened").css("top", ($(window).height() / 2) - offset)
			opacity.css("background", "rgba(0, 0, 0, 0.6")
			opacity.css("z-index", "4")

	#Handler for closing the zoom-mode for images

	$("#opaque").click ->
		$("img").removeClass("enlargened")
		$(this).css("background", "rgba(0,0,0,0)")
		$(".bigimage").attr("src", "")
		$(this).css("z-index", "0")

	#Handler for viewing album-info.

	$(".arrow-container").click ->
		title = $(this).parent().attr("id")
		sibling = $(this).parent().siblings("#" + title + "-info").find(".info-wrapper")
		parent = $(this).parent()
		arrow = $(this).find(".album-arrow")
		toggleAlbum(title, sibling, parent, arrow)

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
		, 120)
	)

	search = (input) -> 
		toggleAlbum(sibling: undefined)
		rawInput = $(input).val()
		inputValues = rawInput.split(/,/)
		inputValues[i] = inputValues[i].trim() for i of inputValues
		#console.log(inputValues)
		albumContainer = $(".album-container")
		if $(input).data("lastval") isnt rawInput
			$(input).data("lastval", rawInput)
			#console.log(inputVal)
			container = $("#splash-container > li")
			if rawInput isnt ""
				container.each -> 
					blackList = []
					conditionCount = []
					conditionCount.push(false) for val in inputValues
					text = $(this).find("p,h2")
					text.each ->
						albumContainer = $(this).closest(".album-container")
						if !albumContainer.hasClass("album-container")
							id = $(this).closest(".info-container").attr("id").replace("-info", "")
							albumContainer = $("#" + id)
						textVal = $(this).text()
						if !$(this).hasClass("label") && blackList.findIndex((element) -> element == textVal) == -1
							test = checkMatch(textVal, inputValues)
							if test
								conditionCount[conditionCount.findIndex((element) -> element == false)] = true
								#console.log(conditionCount)
					#console.log(blackList)
					if conditionCount.findIndex((element) -> element == false) != -1
						#console.log("no match!")
						albumContainer.css("width", "0")
						albumContainer.css("margin", "0")
					if conditionCount.findIndex((element) -> element == false) == -1
						#console.log("match!")
						albumContainer.css("width", "200px")
						albumContainer.css("margin", "8px")
			else
				albumContainer.css("width", "200px")
				albumContainer.css("margin", "8px")


	#Helper method for checking if any 'conditions' match the selected text

	checkMatch = (value, conditions) ->
		#console.log("conditions",conditions)
		#console.log("values:",value)
		matchBool = false
		match = (value, condition) ->
			if !matchBool
				if $("#regex").hasClass("brightness")
					compCondition = new RegExp(condition)
					#console.log(compCondition)
					#console.log("blacklist check:",blackList.find((element) -> element == compCondition.source))
					if compCondition.test(value) && blackList.find((element) -> element == compCondition.source) == undefined
						#console.log("checkmatch: true")
						blackList.push(compCondition.source)
						matchBool = true
				else
					compValue = escapeRegExp(value).toUpperCase()
					compCondition = escapeRegExp(condition).toUpperCase()
					#console.log("value: " + compValue, "condition: " + compCondition)
					if compValue.match(compCondition) != null && blackList.find((element) -> element == compCondition) == undefined
						#console.log("checkmatch: true")
						blackList.push(compCondition)
						matchBool = true
		match(value, cond) for cond in conditions
		#console.log("matching...")
		return matchBool

	#Helper method for escaping regex input

	escapeRegExp = (string) ->
  		return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')

  	#Helper method for sorting albums

	albumSort = (string) ->
		albumList = $("#splash-container")
		albums = albumList.children("li").get()
		albumList.css("display", "none")
		switch string
			when "Title"
				if !albumList.hasClass("title-sorted-up") && !albumList.hasClass("title-sorted-down")
					albumList.attr("class", "title-sorted-down")
				if albumList.hasClass("title-sorted-up") then albumList.attr("class", "title-sorted-down") else albumList.attr("class", "title-sorted-up")
				albums.sort (a, b) -> 
					compA = $(a).find(".text-size-wrapper h2").text().toUpperCase()
					compB = $(b).find(".text-size-wrapper h2").text().toUpperCase()
					if albumList.hasClass("title-sorted-up")
						return (compA > compB) ? -1 : (compA < compB) ? 1 : 0
					else
						return (compA < compB) ? -1 : (compA > compB) ? 1 : 0						
				$.each(albums, e = (idx, itm) -> albumList.append(itm))
				break;
			when "Artist"
				if !albumList.hasClass("artist-sorted-up") && !albumList.hasClass("artist-sorted-down")
					albumList.attr("class", "artist-sorted-down")
				if albumList.hasClass("artist-sorted-up") then albumList.attr("class", "artist-sorted-down") else albumList.attr("class", "artist-sorted-up")
				albums.sort (a, b) ->
					compA = $(a).find(".artist-year-container .artist").text().toUpperCase()
					compB = $(b).find(".artist-year-container .artist").text().toUpperCase()
					#console.log(compA + " and " + compB)
					if albumList.hasClass("artist-sorted-up")
						return (compA > compB) ? -1 : (compA < compB) ? 1 : 0
					else
						return (compA < compB) ? -1 : (compA > compB) ? 1 : 0						
				$.each(albums, e = (idx, itm) -> albumList.append(itm))
				break;
			when "Year"
				if !albumList.hasClass("year-sorted-up") && !albumList.hasClass("year-sorted-down")
					albumList.attr("class", "year-sorted-down")
				if albumList.hasClass("year-sorted-up") then albumList.attr("class", "year-sorted-down") else albumList.attr("class", "year-sorted-up")
				albums.sort (a, b) -> 
					compA = Number($(a).find(".artist-year-container .year").text())
					compB = Number($(b).find(".artist-year-container .year").text())
					if albumList.hasClass("year-sorted-up")
						return (compA > compB) ? -1 : (compA < compB) ? 1 : 0
					else
						return (compA < compB) ? -1 : (compA > compB) ? 1 : 0						
				$.each(albums, e = (idx, itm) -> albumList.append(itm))
				break;
			when "Flavor"
				if !albumList.hasClass("flavor-sorted-up") && !albumList.hasClass("flavor-sorted-down")
					albumList.attr("class", "flavor-sorted-down")
				if albumList.hasClass("flavor-sorted-up") then albumList.attr("class", "flavor-sorted-down") else albumList.attr("class", "flavor-sorted-up")
				albums.sort (a, b) ->
					infoA = $(a).children(".info-container")
					infoB = $(b).children(".info-container")
					compA = $(infoA).find(".flavor-value").text().toUpperCase()
					compB = $(infoB).find(".flavor-value").text().toUpperCase()
					#console.log(compA + " and " + compB)
					if albumList.hasClass("flavor-sorted-up")
						return (compA > compB) ? -1 : (compA < compB) ? 1 : 0
					else
						return (compA < compB) ? -1 : (compA > compB) ? 1 : 0						
				$.each(albums, e = (idx, itm) -> albumList.append(itm))
				break;
		albumList.show("normal")
		albumList.css("display", "flex")
		toggleAlbum(sibling: undefined)

	#Helper method for opening an info container. Call it as 'sibling: undefined' to reset all info containers.

	toggleAlbum = (title, sibling, parent, arrow) ->
		$(".album-arrow").css("transform", "rotate(0)")
		$(".album-container").css("height", albumHeight)
		$(".info-wrapper").css("display", "none")
		$(".info-container").css("display", "none")
		$(".info-wrapper").css("height", "0")
		console.log(sibling)
		if sibling isnt undefined && !sibling.hasClass("is-open")
			timeout = 0
			timeout = 300 if albumOpen 
			#console.log(timeout)
			setTimeout( ->
				offset = parent.parent().offset().top + parent.parent().parent().scrollTop() + 170
				#console.log("Album closed")
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
				albumOpen = true
			,
			timeout)
		else 
			console.log("closed")
			albumOpen = false
			$(".info-wrapper").removeClass("is-open")

