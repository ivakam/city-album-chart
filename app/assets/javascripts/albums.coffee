# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	isOpen = false
	console.log("albums.coffee is running.")
	# $("#splash-container").show("normal")
	# $("#splash-container").css("display", "flex")
	$(".arrow-container").click ->
		console.log("clicked!")
		title = $(this).parent().attr("id")
		console.log(title)
		sibling = $(this).parent().siblings("#" + title + "-info").find(".info-wrapper")
		parent = $(this).parent()
		arrow = $(this).find(".album-arrow")
		offset = parent.offset().top + parent.parent().scrollTop() + 220
		if !isOpen
			arrow.css("transform", "rotate(180deg)")
			parent.css("height", "800px")
			sibling.css("display", "flex")
			sibling.parent().css("display", "block")
			sibling.css("height", "400px")
			$(".offset").css("top", offset)
			sibling.parent().addClass("offset")
			isOpen = true
		else
			arrow.css("transform", "rotate(0)")
			parent.css("height", "320")
			sibling.css("display", "none")
			sibling.parent().toggle()
			sibling.css("height", "0")
			isOpen = false;
		return

	$(".nav-btn .title-wrapper").click ->
		parent = $(this).parent()
		arrow = parent.find(".nav-arrow")
		if parent.find(".nav-list-container").hasClass("hide-list")
			arrow.css("transform", "rotate(180deg)")
			parent.find(".nav-list-container").toggleClass("hide-list")
			parent.css("height", "200px")
		else
			parent.find(".nav-list-container").toggleClass("hide-list")
			parent.css("height", "50px")
			arrow.css("transform", "rotate(0)")
		return

	$(".filter-btn").click ->
		$("#filter-list li").removeClass("selected")
		$(this).addClass("selected")
		$("#filter-list li").each -> 
			if !$(this).hasClass("selected")
				$(this).find(".ion-chevron-down").removeClass("rotated")
		$(this).find(".ion-chevron-down").toggleClass("rotated")
		albumSort($(this).find("a").text())
		return

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
				if albumList.hasClass("artist-sorted-up") then albumList.attr("class", "artist-sorted-down") else albumList.attr("class", "artistsorted-up")
				albums.sort (a, b) -> 
					compA = $(a).find("div .artist").text().toUpperCase()
					compB = $(b).find("div .artist").text().toUpperCase()
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
					compA = Number($(a).find("div .year").text())
					compB = Number($(b).find("div .year").text())
					if albumList.hasClass("year-sorted-up")
						return (compA > compB) ? -1 : (compA < compB) ? 1 : 0
					else
						return (compA < compB) ? -1 : (compA > compB) ? 1 : 0						
				$.each(albums, e = (idx, itm) -> albumList.append(itm))
				break;
			when "Placeholder1"
				break;
		albumList.show("normal")
		albumList.css("display", "flex")

