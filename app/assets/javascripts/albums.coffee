$(document).on "turbolinks:load", ->
    backgrounds = $("#albums-bg-container").children()
    chosenAlbum = 0
    backgrounds.first().css("opacity", "1")
    window.setInterval( ->
        if chosenAlbum < backgrounds.length
            chosenAlbum++
        else
            chosenAlbum = 1
        backgrounds.css("opacity", "0")
        $("#albums-bg-container img:nth-child(" + chosenAlbum + ")").css("opacity", "1")
    , 120000)
    