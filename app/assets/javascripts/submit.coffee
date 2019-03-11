$(document).on 'turbolinks:load', ->
    window.scraper = {}
    if $('body').hasClass('albums submit')
        $('#album-total-count').text(sessionStorage.getItem('albumCount'))
        $('.track-input-container').arrangeable({
        dragSelector: '.draggable-area'
        })
        
        $('.hint-click').click ->
            $('#submit-wrapper').find('input[type=text], input[type=file], textarea').val('')
            window.scraper.albumObjects = []
            $('#input-container').toggleClass('left-margin')
            $('#scraper-status').html('Waiting for files')
            $('#scraper-form').empty()
            
        $('.save-btn').click ->
            toBreak = false
            $('#title-field, #romaji-artist-field').each ->
                if $(this).val() == '' && $('#scraper-textarea').val() == ''
                    $(this).next('.error-msg-container').css('height', '30px')
                    $(this).css('border', '1px red solid')
                    $('#scraper-textarea').css('border', '1px red solid')
                    toBreak = true
            if !toBreak
                tracklist = {}
                makeTrack = (track, i) -> 
                    return if track.find('.title').val() == ''
                    title = track.find('.title').val()
                    tracklist[title] = {}
                    tracklist[title]['order'] = i + 1
                    track.find('input').each ->
                        tracklist[title][$(this).attr('class')] = $(this).val()
                makeTrack($(track), i) for track, i in $('.tracklist-edit-container').find('.track-input-container')
                $('#hidden-tracklist').attr('value', JSON.stringify(tracklist))
        
        deleteTrackClick = (e) ->
            e = $(e.target)
            e.parent().remove()
        
        addTrackClick = (e) ->
            e = $(e.target)
            $("<div class='track-input-container'>
            <span class='draggable-area'></span>
            <input class='title' placeholder='Title' type='text'>
            <input class='romanization' placeholder='Romanization' type='text'>
            <input class='duration' placeholder='4:54' type='text'>
            <ion-icon name='ios-close' class='track-delete-btn'></ion-icon>
            </div>").insertBefore(e)
            e.parent().find('.track-delete-btn').each ->
                $(this).get()[0].removeEventListener('click', deleteTrackClick)
                $(this).get()[0].addEventListener('click', deleteTrackClick)
            $('.track-input-container').arrangeable({
            dragSelector: '.draggable-area'
            })
        
        trashAlbum = (e) ->
            e = $(e.target)
            e.closest('.album-container').remove()
        
        $('.track-add-btn').click (e) ->
            addTrackClick(e)
        
        $('.track-delete-btn').click ->
            $(this).parent().remove()
            
        objectToFormData = (obj, rootName = '', ignoreList) ->
            formData = new FormData()
            appendFormData = (data, root) ->
                if !ignore(root)
                    root = root || ''
                    if data instanceof File
                        formData.append(root, data)
                    else if Array.isArray(data)
                        appendFormData(data[i], root + '[' + i + ']') for i in [0..data.length]
                    else if typeof data == 'object' && data
                        for key, value of data
                            if (data.hasOwnProperty(key))
                                if (root == '')
                                    appendFormData(data[key], key)
                                else
                                    appendFormData(data[key], root + '.' + key)
                    else
                        if data != null && typeof data != 'undefined'
                            formData.append(root, data)
            ignore = (root) ->
                return Array.isArray(ignoreList) && ignoreList.some((x) -> x == root)
            appendFormData(obj, rootName)
            return formData
        
        $('#scraper-submit-btn').click ->
            e = $(this)
            processedAlbums = []
            $('.album-container').each (index) ->
                c = $(this)
                a = {}
                a.title = c.find('.cover-edit-container .title').val()
                a.romanization = c.find('.cover-edit-container .romanization').val()
                a.japanese_artist = c.find('.input-field-container .japanese-artist').val()
                a.romaji_artist = c.find('.input-field-container .romaji-artist').val()
                a.year = c.find('.input-field-container .year').val()
                a.flavor = c.find('.input-field-container .flavor').val()
                a.description = c.find('.input-field-container .description').val()
                a.cover = c.find('.album-edit-cover')[0].files[0]
                a.cover_base64 = c.find('.album-edit-base64').val()
                a.tracklist = []
                c.find('.track-input-container').each (index) ->
                    t = $(this)
                    a.tracklist[index] = {}
                    a.tracklist[index].title = t.find('.title').val()
                    a.tracklist[index].romanization = t.find('.romanization').val()
                    a.tracklist[index].duration = t.find('.duration').val()
                    a.tracklist[index].order = index
                processedAlbums[index] = a
            if !e.hasClass('transparent')
                formAlbums = objectToFormData(processedAlbums, 'scraper')
                $('#scraper-status').html('Submitting album...')
                $.ajax({
                    url: window.location.href.replace(/submit/, 'create'),
                    type: 'POST',
                    processData: false,
                    contentType: false,
                    dataType: 'json',
                    data: formAlbums,
                    complete: -> 
                        location.reload()
                })
            
        $('#album-cover').change ->
            e = $(this)
            $('#selected-cover').html('Currently selected file: ' + e[0].value.split(/(\\|\/)/g).pop())
        
        scraperAlbumCover = (e) ->
            e = $(this)
            selectedFile = this.files[0]
            reader = new FileReader()
            parent = e.closest('.album-container')
            coverImage = parent.find('.cover-editable')
            reader.onload = (event) ->
                if selectedFile.type == 'image/jpeg'
                    coverImage.attr('src', event.target.result)
                    coverImage.parent().parent().removeClass('invalid')
                parent.find('.size-error').addClass('shrunk')
                parent.find('.type-error').addClass('shrunk')
                if selectedFile.type == 'image/jpeg' && selectedFile.size > 1000000
                    coverImage.parent().parent().addClass('invalid')
                    parent.find('.size-error').removeClass('shrunk')
                if selectedFile.type != 'image/jpeg'
                    coverImage.parent().parent().addClass('invalid')
                    parent.find('.type-error').removeClass('shrunk')
            reader.readAsDataURL(selectedFile)
            parent.find('.selected-cover').html('Currently selected file: ' + this.value.split(/(\\|\/)/g).pop())
        
        countStrBytes = (str) ->
            bytes = 0
            codePoint = null
            len = str.length
            countBytes = (i) ->
                codePoint = str.charCodeAt(i);
                if codePoint >= 0xD800 and codePoint < 0xE000 
                    if codePoint < 0xDC00 and i + 1 < len 
                        next = str.charCodeAt(i + 1)
                        if next >= 0xDC00 and next < 0xE000
                            bytes += 4
                bytes += codePoint < 0x80 ? 1 : (codePoint < 0x800 ? 2 : 3)
            countBytes(i) for i in [0..str.length]
            return bytes
        
        window.scraper.generateScraperUI = () ->
            $('#scraper-submit-btn').removeClass('transparent')
            $('#scraper-status').html('Ready for submission!')
            generateEditTrackStr = (track) ->
                return "<div class='track-input-container'>
                            <span class='draggable-area'></span>
                            <input class='title' placeholder='Title' value='" + track.title.replace("'", '&#39;') + "' type='text'>
                            <input class='romanization' placeholder='Romanization' value='' type='text'>
                            <input class='duration' placeholder='4:54' value='" + track.length + "' type='text'>
                            <ion-icon name='ios-close' class='track-delete-btn'></ion-icon>
                        </div>"
            albumStr = (title, artist, tracklist, year, artwork) ->
                "<div class='album-container'>
                    <ion-icon class='album-trash-btn' name='ios-trash' title='Remove album'></ion-icon>
                    <div class='submit-opacity'></div>
                    <div class='cover-edit-container'>
                        <input class='title' id='#{title.replace("'", '&#39;').replace(/\s+/, '')}-title' placeholder='Title' value='#{title.replace("'", '&#39;')}' type='text' required>
                        <input class='romanization' id='#{title.replace("'", '&#39;').replace(/\s+/, '')}-romanization' placeholder='Romanization' value='' type='text'>
                        <div>
                            <label for='#{title.replace("'", '&#39;').replace(/\s+/, '')}-cover'>
                                <img src='#{artwork}' class='cover-editable'>
                            </label>
                            <input class='album-edit-cover' id='#{title.replace("'", '&#39;').replace(/\s+/, '')}-cover' type='file'>
                            <input class='album-edit-base64' type='text' value='#{artwork}' hidden>
                            <div>
                                <p><b>Update cover</b></p>
                                <p>Max filesize 1MB</p>
                            </div>
                        </div>
                        <p class='size-error shrunk'>Image too large!</p>
                        <p class='type-error shrunk'>Wrong file type! Only jpg</p>
                        <p class='selected-cover'>Using scraped cover</p>
                    </div>
                    <div class='input-field-container'>
                        <input class='japanese-artist' id='#{title.replace("'", '&#39;').replace(/\s+/, '')}-japanese-artist' placeholder='Japanese artist' value='' type='text'>
                        <input class='romaji-artist' id='#{title.replace("'", '&#39;').replace(/\s+/, '')}-romaji-artist' placeholder='Romaji artist' value='#{artist.replace("'", '&#39;')}' type='text' required>
                        <input class='year' id='#{title.replace("'", '&#39;').replace(/\s+/, '')}-year' placeholder='Year' value='#{year}' type='text'>
                        <input class='flavor' id='#{title.replace("'", '&#39;').replace(/\s+/, '')}-flavor' placeholder='Flavor' value='' type='text'>
                        <textarea class='description' id='#{title.replace("'", '&#39;').replace(/\s+/, '')}-description' placeholder='Description'></textarea>
                    </div>
                    <div class='tracklist-submit'>
                        <p>Tracklist</p>
                        <div class='tracklist-edit-container'>
                            #{(generateEditTrackStr(track) for track in tracklist).join('')}
                            <ion-icon name='ios-add-circle' class='track-add-btn'></ion-icon>
                        </div>
                    </div>
                    <input class='tracklist' value='' hidden>
                </div>"
            $('#scraper-form').empty()
            $('#scraper-form').append(albumStr(a.title, a.artist, a.tracklist, a.year, a.artwork)) for a in window.scraper.albumObjects
            $('.album-edit-cover').each ->
                $(this).get()[0].addEventListener('change', scraperAlbumCover)
            $('.track-delete-btn').each ->
                $(this).get()[0].addEventListener('click', deleteTrackClick)
            $('.album-container .track-add-btn').each ->
                $(this).get()[0].addEventListener('click', addTrackClick)
            $('.album-trash-btn').each ->
                $(this).get()[0].addEventListener('click', trashAlbum)
            $('.track-input-container').arrangeable({
            dragSelector: '.draggable-area'
            })
            $('.album-edit-base64').each ->
                if countStrBytes(this.value) > 1000000
                    $(this).parent().addClass('invalid')
                    $(this).closest('.album-container').find('.size-error').removeClass('shrunk')