$(document).on 'turbolinks:load', ->
    $('#album-total-count').text(sessionStorage.getItem('albumCount'))