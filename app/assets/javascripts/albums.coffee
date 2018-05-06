# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	isOpen = false
	console.log("albums.coffee is running.")
	$(".arrow-container").click ->
		console.log("clicked!")
		sibling = $(this).parent().next(".info-container")
		parent = $(this).parent()
		arrow = $(this).find(".album-arrow")
		if (!isOpen)
			arrow.css("transform", "rotate(180deg)")
			$(parent).css("height", "800px")
			sibling.css("z-index", "3")
			sibling.css("height", "300px")
			isOpen = true
		else
			arrow.css("transform", "rotate(0)")
			$(parent).css("height", "320")
			sibling.css("z-index", "-1")
			sibling.css("height", "0")
			isOpen = false;
		return
	return
