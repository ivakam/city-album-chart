class AlbumsController < ApplicationController
	def contains_cjk?
		!!(self =~ /\p{Han}|\p{Katakana}|\p{Hiragana}|\p{Hangul}/)
	end
	def index
		@albums = Album.all
		@albums.each { | a | a.coverlink = ActionController::Base.helpers.image_url(a.coverlink)}
		puts @albums.first.coverlink
		@tracks = Track.all
		gon.Albums = @albums
		gon.Tracks = @tracks
	end
	def submit
	end
	def create
		@album = Album.create(params[:album].to_unsafe_hash)
		trackString = "[\n"
		trackStringArr = @album.temp_tracklist.split(/\n/)
		trackStringArr.each_with_index do |currentLine, index|
			matchArr = currentLine.split(/", /)
			if matchArr.length == 3
				trackString << "{\n" +
				"title: " + matchArr[0] + "\",\n" +
				"romanization: " + matchArr[1] + "\",\n" + 
				"duration: " + matchArr[2] + "\n" +
				"},\n"
			end
			if matchArr.length == 2
				trackString << "{\n" +
				"title: " + matchArr[0] + "\",\n" + 
				"duration: " + matchArr[1] + "\n" + 
				"},\n"
			end
			if matchArr.length == 1
				trackString << "{\n"
				"title: " + matchArr[0] + "\n" + 
				"},\n"
			end
		end
		albumString = 
			"CreateAlbumWithTracks({\n" +
			"title: \'" + @album.title + "\',\n" +
			"romanization: \'" + @album.romanization + "\',\n" +
			"romaji_artist: \'" + @album.romaji_artist + "\',\n" +
			"japanese_artist: \'" + @album.japanese_artist + "\',\n" +
			"year: \'" + @album.year + "\',\n" +
			"description: \'" + @album.description + "\',\n" +
			"coverlink: \'" + @album.title + ".jpg\',\n" +
			"flavor: \'" + @album.flavor + "\'},\n" + trackString
		if @album.valid?	
			File.open("uploads/" + @album.title + ".txt", "w") do |f|
				f.write(albumString)
			end
		end
	end
end