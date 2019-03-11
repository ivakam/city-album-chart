$(document).on "turbolinks:load", ->
    backgrounds = $("#albums-bg-container").children()
    chosenAlbum = 0
    backgrounds.first().addClass('selected')
    window.setInterval( ->
        if chosenAlbum < backgrounds.length
            chosenAlbum++
        else
            chosenAlbum = 1
        backgrounds.removeClass('selected')
        $("#albums-bg-container img:nth-child(" + chosenAlbum + ")").addClass('selected')
    ,120000)
    