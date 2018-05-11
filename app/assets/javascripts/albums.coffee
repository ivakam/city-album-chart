$(document).on "turbolinks:load", ->

	console.log("albums.coffee is running.")
	# $("#splash-container").show("normal")
	# $("#splash-container").css("display", "flex")

	#Global variable declaration

	albumContainerWidth = $(".text-size-wrapper").width()
	albumHeight = "327px"

	#Adjusts text size to make sure the titles fit within their containers

	$(".text-size-wrapper h2, .album-text-container p").each -> 
		fontSize = 20
		padding = 0
		while ($(this).width() > albumContainerWidth)
			$(this).css("font-size", fontSize -= 0.5)
			$(this).css("padding-top", padding += 0.5)

	#Adjust text color of info-container based on background color

	$(".info-wrapper").each ->
		div = $(this)
		img = div.find(".info-background img").attr("src")
		
		#TURN THIS ON IN PRODUCTION
		###
		RGBaster.colors(img,
			{exclude: ["rgb(255, 255, 255)", "rgb(0, 0, 0"],
			success: (payload) ->
				colorSplit = payload.secondary.split(/rgb\(|,|\)/)
				console.log(parseInt(colorSplit[1]))
				tempColors = [
					color: "r"
					hue: parseInt(colorSplit[1])
				,
				 	color: "g"
				 	hue: parseInt(colorSplit[2])
				,
				 	color: "b"
				 	hue: parseInt(colorSplit[3])
				]
				# console.log("tempColors[1].hue: " + tempColors[1].hue)
				# console.log(colorSplit)
				# console.log(tempColors)
				tempColors.sort (a, b) ->
					if (a.hue < b.hue)
   						return -1
  					if (a.hue > b.hue)
    					return 1
  					return
				overflow = (tempColors[0].hue + tempColors[1].hue + tempColors[2].hue) - 400
				distribute = (i) -> 
				  	overflowPortion = Math.min(tempColors[i].hue, Math.ceil(overflow/(3-i)))
  					tempColors[i].hue -= overflowPortion
  					overflow -= overflowPortion
				distribute(i) for i in [0...3] if overflow > 0
				console.log(tempColors)
				combinedColor = tempColors[0].hue + tempColors[1].hue + tempColors[2].hue
				tempTextColor = (765 - combinedColor) 
				if tempTextColor > 765 / 2
					tempTextColor = 230
				else 
					tempTextColor = 10
				# r = tempColors.findIndex (element) ->
				# 	return element.color == "r" 
				# g = tempColors.findIndex (element) ->
				# 	return element.color == "g" 
				# b = tempColors.findIndex (element) ->
				# 	return element.color == "b" 
				# console.log("r: " + r)
				# console.log("g: " + g)
				# console.log("b: " + b)
				textColor = "rgb(" + tempTextColor + "," + tempTextColor + "," + tempTextColor + ")"
				# color = "rgb(" + tempColors[r].hue + "," + tempColors[g].hue + "," + tempColors[b].hue + ")"
				div.find("p, h2, h3, i").css("color", textColor)
				# div.css("background", color)
				})
				###

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
		scrollTop: container.offset().top
		}, 500)
		title = id
		sibling = container.siblings("#" + title + "-info").find(".info-wrapper")
		parent = container
		arrow = container.find(".album-arrow")
		offset = parent.offset().top + parent.parent().scrollTop() + 170
		if !sibling.hasClass("is-open")

			$(".album-arrow").css("transform", "rotate(0)")
			$(".album-container").css("height", albumHeight)
			$(".info-wrapper").css("display", "none")
			$(".info-container").css("display", "none")
			$(".info-wrapper").css("height", "0")

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
		offset = parent.offset().top + parent.parent().scrollTop() + 170
		if !sibling.hasClass("is-open")

			$(".album-arrow").css("transform", "rotate(0)")
			$(".album-container").css("height", albumHeight)
			$(".info-wrapper").css("display", "none")
			$(".info-container").css("display", "none")
			$(".info-wrapper").css("height", "0")

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

		else
			arrow.css("transform", "rotate(0)")
			parent.css("height", albumHeight)
			sibling.css("display", "none")
			sibling.parent().toggle()
			sibling.css("height", "0")
			sibling.removeClass("is-open")
		return

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
		#console.log("Hello world")
		$(".album-arrow").css("transform", "rotate(0)")
		$(".album-container").css("height", albumHeight)
		$(".info-wrapper").css("display", "none")
		$(".info-container").css("display", "none")
		$(".info-wrapper").css("height", "0")
		inputVal = $(this).val()
		albumContainer = $(".album-container")
		if $(this).data("lastval") isnt inputVal
			$(this).data("lastval",inputVal)
			#console.log(inputVal)
			container = $(".info-container, .album-container")
			
			if inputVal isnt ""
				container.each -> 
					bufferCheck = false
					text = $(this).find("p,h2")
					#console.log(albumContainer)
					albumContainer = $(this)
					if !albumContainer.hasClass("album-container")
						id = $(this).attr("id").replace("-info", "")
						albumContainer = $("#" + id)
					#console.log(albumContainer)
					text.each ->
						if !$(this).hasClass("label")
							test = checkMatch($(this).text(), inputVal)
							if !bufferCheck
								if !test
									albumContainer.css("width", "0")
									albumContainer.css("margin", "0")
							if test
								#console.log("match!")
								albumContainer.css("width", "200px")
								albumContainer.css("margin", "8px")
								bufferCheck = true
			else
				albumContainer.css("width", "200px")
				albumContainer.css("margin", "8px")
			)

	#Helper method for checking if 'condition' matches the selected text

	checkMatch = (value, condition) ->
		#console.log(condition)
		if $("#regex").hasClass("brightness")
			compCondition = new RegExp(condition)
			#console.log(compCondition)
			if value.match(compCondition) != null
			#console.log("checkmatch: true")
				return true
			else
				#console.log("checkmatch: false")
				return false
		else
			compValue = escapeRegExp(value).toUpperCase()
			compCondition = escapeRegExp(condition).toUpperCase()
			#console.log("value: " + compValue, "condition: " + compCondition)
			if compValue.match(compCondition) != null
				#console.log("checkmatch: true")
				return true
			else
				#console.log("checkmatch: false")
				return false

	#Helper method for escaping regex input

	escapeRegExp = (string) ->
  		return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')

  	#Helper method for sorting albums

	albumSort = (string) ->
		albumList = $("#splash-container")
		albums = albumList.children(".album-container").get()
		albumList.css("display", "none")
		switch string
			when "Title"
				if !albumList.hasClass("title-sorted-up") && !albumList.hasClass("title-sorted-down")
					albumList.attr("class", "title-sorted-down")
				if albumList.hasClass("title-sorted-up") then albumList.attr("class", "title-sorted-down") else albumList.attr("class", "title-sorted-up")
				albums.sort (a, b) -> 
					compA = $(a).find("div h2").text().toUpperCase()
					compB = $(b).find("div h2").text().toUpperCase()
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
					compA = $(a).find("div .artist-year-container .artist").text().toUpperCase()
					compB = $(b).find("div .artist-year-container .artist").text().toUpperCase()
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
					compA = Number($(a).find("div .artist-year-container .year").text())
					compB = Number($(b).find("div .artist-year-container .year").text())
					if albumList.hasClass("year-sorted-up")
						return (compA > compB) ? -1 : (compA < compB) ? 1 : 0
					else
						return (compA < compB) ? -1 : (compA > compB) ? 1 : 0						
				$.each(albums, e = (idx, itm) -> albumList.append(itm))
				break;
			when "Placeholder1"
				break;
		$(".album-arrow").css("transform", "rotate(0)")
		$(".album-container").css("height", albumHeight)
		$(".info-wrapper").css("display", "none")
		$(".info-container").css("display", "none")
		$(".info-wrapper").css("height", "0")
		albumList.show("normal")
		albumList.css("display", "flex")