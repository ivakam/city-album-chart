# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	isOpen = false
	albumList = $("#splash-container")
	albums = albumList.children(" ")
	console.log("albums.coffee is running.")
	$(".arrow-container").click ->
		console.log("clicked!")
		title = $(this).parent().attr("id")
		console.log(title)
		sibling = $(this).parent().next("#" + title + "-info")
		parent = $(this).parent()
		arrow = $(this).find(".album-arrow")
		offset = parent.offset().top + parent.parent().scrollTop() + 220
		if !isOpen
			arrow.css("transform", "rotate(180deg)")
			parent.css("height", "800px")
			sibling.css("z-index", "2")
			sibling.css("max-height", "400px")
			$(".offset").css("top", offset)
			sibling.addClass("offset")
			isOpen = true
		else
			arrow.css("transform", "rotate(0)")
			parent.css("height", "320")
			sibling.css("z-index", "-1")
			sibling.css("max-height", "0")
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
				console.log("match")
				$(this).find(".ion-chevron-down").removeClass("rotated")
		$(this).find(".ion-chevron-down").toggleClass("rotated")
		return
