$(document).on 'turbolinks:load', ->
    if $('body').hasClass('albums submit')
        $('#album-total-count').text(sessionStorage.getItem('albumCount'))
        $('.hint-click').click ->
            $('#submit-wrapper').find('input[type=text], input[type=file]').val('')
            $('#submit-wrapper').find('textarea').val('')
            $('#input-container').toggleClass('left-margin')
        $('.save-btn').click ->
            $('#title-field, #romaji-artist-field').each ->
                if $(this).val() == '' && $('#scraper-textarea').val() == ''
                    $(this).next('.error-msg-container').css('height', '30px')
                    $(this).css('border', '1px red solid')
                    $('#scraper-textarea').css('border', '1px red solid')
                else
                    $(this).next('.error-msg-container').css('height', '0')
                    $(this).css('border', '1px #686868 solid')
                    $('#scraper-textarea').css('border', '1px #686868 solid')
                    $('.submit-msg-container').css('height', '40px')
                    setTimeout( ->
                        $('.submit-msg-container').css('height', '0')
                    , 2000)