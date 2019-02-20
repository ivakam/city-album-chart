window.onload = function() {
    if (document.body.classList.contains('albums') && document.body.classList.contains('submit')) {
        console.log('Scraper is running');
        class Album {
            constructor(title, artist, year, artwork = null) {
                this.title = title;
                this.artist = artist;
                this.year = year;
                this.artwork = artwork;
                this.tracklist = new Array(0);
            }
            equals(inputAlbum) {
                if (inputAlbum.title === this.title && inputAlbum.artist === this.artist && inputAlbum.year === this.year) {
                    return true;
                } else {
                    return false;
                }
            }
        }
        
        class Track {
            constructor(trackNumber, title, artist, length) {
                this.trackNumber = trackNumber;
                this.title = title;
                this.artist = artist;
                this.length = length;
            }
        }
        
        // Declare and instantiate array, counter, and FileList length variables.
        window.scraper = {}
        window.scraper.albumObjects = [];
        let processedFiles = 0;
        let fileListLength = 0;
        let submitBtn = document.getElementById('scraper-submit-btn')
        let fileInputElement = document.getElementById('albums-input');
        let statusDisplay = document.getElementById('scraper-status');
        fileInputElement.addEventListener('change', processFiles)
        
        function processFiles() {
            window.scraper.albumObjects = []
            let files = this.files;
            fileListLength = files.length;
            submitBtn.classList.add('transparent')
            statusDisplay.innerHTML = 'Processing... This may take a few seconds.'
            // files is a FileList object and must be iterated through this way.
            for (let filesIndex = 0; filesIndex < files.length; filesIndex++) {
                if ((files[filesIndex].name.endsWith(".flac")) ||
                    (files[filesIndex].name.endsWith(".m4a")) ||
                    (files[filesIndex].name.endsWith(".mp3"))) {
                    analyzeTags(files[filesIndex]);
                } else {
                    // The file is not able to be analyzed.
                    fileProcessed();
                }
            }
        }
        
        function analyzeTags(inputFile) {
            if (inputFile.name.endsWith(".mp3")) {
                analyzeRegular(inputFile);
            } else if (inputFile.name.endsWith(".m4a")) {
                analyzeM4a(inputFile);
            } else if (inputFile.name.endsWith(".flac")) {
                analyzeFlac(inputFile);
            }
        }
        
        function analyzeRegular(inputFile) {
            jsmediatags.read(inputFile, {
                onSuccess: function (tag) {
                    let artist = '';
                    let year = '';
                    let album = '';
                    let albumArtist = '';
                    let title = '';
                    let lengthSeconds = 0;
                    let length = '';
                    let track = '';
                    //let albumArt = null;
        
                    let audioObjectUrl = URL.createObjectURL(inputFile);
                    let audioFile = new Audio(audioObjectUrl);
                    audioFile.addEventListener('loadeddata', function () {
                        // Read length in seconds once the audio file is loaded.
                        lengthSeconds = audioFile.duration;
                        // Round length in seconds to the nearest second.
                        lengthSeconds = Math.round(lengthSeconds);
                        // Set length string.
                        let lengthHoursPart = Math.floor(lengthSeconds / 3600);
                        let lengthMinutesPart = Math.floor((lengthSeconds / 60) - (lengthHoursPart * 60));
                        let lengthSecondsPart = Math.floor(lengthSeconds % 60);
                        if (lengthHoursPart === 0) {
                            // Track length is less than one hour.
                            length = lengthMinutesPart + ':' + lengthSecondsPart.toString().padStart(2, '0');
                        } else {
                            // Track length is one hour or greater.
                            length = lengthHoursPart + ':' + lengthMinutesPart.toString().padStart(2, '0') + ':' + lengthSecondsPart.toString().padStart(2, '0');
                        }
        
                        // Read year.
                        year = tag.tags.year;
                        // Condition for extra data: set to year only as long as a year exists.
                        if (typeof year === 'string' && year.length > 4) {
                            year = year.substring(0, 4);
                        }
        
                        // Read artist.
                        artist = tag.tags.artist;
        
                        // Read album.
                        album = tag.tags.album;
        
                        // Read album artist.
                        albumArtist = tag.tags.albumArtist;
                        // Condition if album artist does not exist: set to artist.
                        if (typeof albumArtist === 'undefined') {
                            albumArtist = artist;
                        }
        
                        // Read title.
                        title = tag.tags.title;
        
                        // Read track number.
                        track = tag.tags.track;
                        // Remove all extraneous data from the track number.
                        if (typeof track === 'string') {
                            track = track.replace(/^0+/, '');
                            track = track.replace(/\/[0-9]*/, '');
                        }
        
                        // Read album artwork.
                        //albumArt = tag.tags.picture;
        
                        // After processing, ensure that year and track are both integers.
                        year = parseInt(year);
                        track = parseInt(track);
        
                        // Create a new album object and add the current track to its tracklist if no other songs from the album have been processed.
                        // Otherwise, find the object for the current album and add the current track to its tracklist.
                        let currentAlbum = new Album(album, albumArtist, year);
                        let currentTrack = new Track(track, title, artist, length);
                        if (albumExists(currentAlbum)) {
                            window.scraper.albumObjects[currentAlbumIndex(currentAlbum)].tracklist.push(currentTrack);
                        } else {
                            window.scraper.albumObjects.push(currentAlbum);
                            window.scraper.albumObjects[window.scraper.albumObjects.length - 1].tracklist.push(currentTrack);
                        }
                        fileProcessed();
                    });
                },
                onError: function (error) {
                    console.log('Error analyzing tags of ' + inputFile.name + '.');
                    fileProcessed();
                }
            });
        }
        
        function analyzeM4a(inputFile) {
            // Get hexadecimal offset 00000190 of the input .m4a file.
            // For ALAC files, this row will read "Halac" somewhere.
            // AAC-encoded audio will not have this property.
            let m4aBlob = inputFile.slice(401, 417);
            let fileReader = new FileReader();
            fileReader.onload = function (evt) {
                let m4aBlobString = evt.target.result;
                // m4aBlobString now stores the text representation of the row 00000190.
                if (m4aBlobString.includes('Halac')) {
                    // ALAC is not supported in browsers, so it must be analyzed separately without determining track length.
                    analyzeAlac(inputFile);
                } else {
                    // AAC is supported in browsers, so use jsmediatags and determine track length.
                    analyzeRegular(inputFile);
                }
            }
            fileReader.readAsText(m4aBlob);
        }
        
        function analyzeFlac(inputFile) {
            musicmetadata(inputFile, function (err, result) {
                // Necessary by musicmetadata API.
                if (err) {
                    fileProcessed();
                    throw err;
                }
        
                let artist = '';
                let year = '';
                let album = '';
                let albumArtist = '';
                let title = '';
                let lengthSeconds = 0;
                let length = '';
                let track = '';
                //let albumArt = null;
        
                // Read length in seconds once the audio file is loaded.
                lengthSeconds = result.duration;
                // Round length in seconds to the nearest second.
                lengthSeconds = Math.round(lengthSeconds);
                // Set length string.
                let lengthHoursPart = Math.floor(lengthSeconds / 3600);
                let lengthMinutesPart = Math.floor((lengthSeconds / 60) - (lengthHoursPart * 60));
                let lengthSecondsPart = Math.floor(lengthSeconds % 60);
                if (lengthHoursPart === 0) {
                    // Track length is less than one hour.
                    length = lengthMinutesPart + ':' + lengthSecondsPart.toString().padStart(2, '0');
                } else {
                    // Track length is one hour or greater.
                    length = lengthHoursPart + ':' + lengthMinutesPart.toString().padStart(2, '0') + ':' + lengthSecondsPart.toString().padStart(2, '0');
                }
        
                // Read year.
                year = result.year;
                // Condition for extra data: set to year only as long as a year exists.
                if (typeof year === 'string' && year.length > 4) {
                    year = year.substring(0, 4);
                }
        
                // Read artist.
                artist = result.artist[0];
        
                // Read album.
                album = result.album;
        
                // Read album artist.
                albumArtist = result.albumartist[0];
                // Condition if album artist does not exist: set to artist.
                if (typeof albumArtist === 'undefined') {
                    albumArtist = artist;
                }
        
                // Read title.
                title = result.title;
        
                // Read track number.
                // The musicmetadata result format has no extraneous data.
                track = result.track.no;
        
                // Read album artwork.
                //albumArt = result.picture;
        
                // After processing, ensure that year and track are both integers.
                year = parseInt(year);
                track = parseInt(track);
        
                // Create a new album object and add the current track to its tracklist if no other songs from the album have been processed.
                // Otherwise, find the object for the current album and add the current track to its tracklist.
                let currentAlbum = new Album(album, albumArtist, year);
                let currentTrack = new Track(track, title, artist, length);
                if (albumExists(currentAlbum)) {
                    window.scraper.albumObjects[currentAlbumIndex(currentAlbum)].tracklist.push(currentTrack);
                } else {
                    window.scraper.albumObjects.push(currentAlbum);
                    window.scraper.albumObjects[window.scraper.albumObjects.length - 1].tracklist.push(currentTrack);
                }
                fileProcessed();
            });
        }
        
        function analyzeAlac(inputFile) {
            jsmediatags.read(inputFile, {
                onSuccess: function (tag) {
                    let artist = '';
                    let year = '';
                    let album = '';
                    let albumArtist = '';
                    let title = '';
                    let lengthSeconds = 0;
                    let length = 'ALAC length not supported.';
                    let track = '';
                    //let albumArt = null;
        
                    // Read year.
                    year = tag.tags.year;
                    // Condition for extra data: set to year only as long as a year exists.
                    if (typeof year === 'string' && year.length > 4) {
                        year = year.substring(0, 4);
                    }
        
                    // Read artist.
                    artist = tag.tags.artist;
        
                    // Read album.
                    album = tag.tags.album;
        
                    // Read album artist.
                    albumArtist = tag.tags.albumArtist;
                    // Condition if album artist does not exist: set to artist.
                    if (typeof albumArtist === 'undefined') {
                        albumArtist = artist;
                    }
        
                    // Read title.
                    title = tag.tags.title;
        
                    // Read track number.
                    track = tag.tags.track;
                    // Remove all extraneous data from the track number.
                    if (typeof track === 'string') {
                        track = track.replace(/^0+/, '');
                        track = track.replace(/\/[0-9]*/, '');
                    }
        
                    // Read album artwork.
                    //albumArt = tag.tags.picture;
        
                    // After processing, ensure that year and track are both integers.
                    year = parseInt(year);
                    track = parseInt(track);
        
                    // Create a new album object and add the current track to its tracklist if no other songs from the album have been processed.
                    // Otherwise, find the object for the current album and add the current track to its tracklist.
                    let currentAlbum = new Album(album, albumArtist, year);
                    let currentTrack = new Track(track, title, artist, length);
                    if (albumExists(currentAlbum)) {
                        window.scraper.albumObjects[currentAlbumIndex(currentAlbum)].tracklist.push(currentTrack);
                    } else {
                        window.scraper.albumObjects.push(currentAlbum);
                        window.scraper.albumObjects[window.scraper.albumObjects.length - 1].tracklist.push(currentTrack);
                    }
                    fileProcessed();
                },
                onError: function (error) {
                    console.log('Error analyzing tags of ' + inputFile.name + '.');
                    fileProcessed();
                }
            });
        }
        
        function albumExists(inputAlbumObject) {
            if (window.scraper.albumObjects.length === 0) {
                return false;
            } else {
                if (window.scraper.albumObjects[window.scraper.albumObjects.length - 1].equals(inputAlbumObject)) {
                    return true;
                } else {
                    for (let albumIndex = 0; albumIndex < window.scraper.albumObjects.length; albumIndex++) {
                        if (window.scraper.albumObjects[albumIndex].equals(inputAlbumObject)) {
                            return true;
                        }
                    }
                    return false;
                }
            }
        }
        
        function currentAlbumIndex(inputAlbumObject) {
            for (let albumIndex = 0; albumIndex < window.scraper.albumObjects.length; albumIndex++) {
                if (window.scraper.albumObjects[albumIndex].equals(inputAlbumObject)) {
                    return albumIndex;
                }
            }
        }
        
        function fileProcessed() {
            processedFiles++;
            if (processedFiles === fileListLength) {
                // All files have been processed. Sort tracklists and clear track numbers.
                sortTracklists();
                console.log('All files have been processed.');
                submitBtn.classList.remove('transparent')
                statusDisplay.innerHTML = 'Ready for submission!'
                console.log(window.scraper.albumObjects);
            }
        }
        
        function sortTracklists() {
            for (let albumIndex = 0; albumIndex < window.scraper.albumObjects.length; albumIndex++) {
                window.scraper.albumObjects[albumIndex].tracklist.sort(function (a, b) {
                    if (a.trackNumber < b.trackNumber) {
                        return -1;
                    } else if (a.trackNumber > b.trackNumber) {
                        return 1;
                    } else {
                        return 0;
                    }
                });
            }
        }
        
        function exportData() {
            return window.scraper.albumObjects;
        }
    }
}