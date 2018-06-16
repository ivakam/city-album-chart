$(document).on "turbolinks:load", ->
    if $("body").hasClass("albums submit")
        $(".hint-click").click ->
            $("#submit-wrapper").find("input[type=text], input[type=file]").val("")
            $("#submit-wrapper").find("textarea").val("")
            $("#input-container").toggleClass("left-margin")