class AlbumsController < ApplicationController
	def contains_cjk?
		!!(self =~ /\p{Han}|\p{Katakana}|\p{Hiragana}|\p{Hangul}/)
	end
	def index
		@albums = Album.all
		@albums.each { | a | a.coverlink = ActionController::Base.helpers.image_url(a.coverlink)}
		@tracks = Track.all
		gon.Albums = @albums
		gon.Tracks = @tracks
	end
	def create
		@album = Album.new(params[:album].to_unsafe_hash)
		if @album.scraper != ""
			artistStr = "noImg"
			unless @album.image.file == nil
				artistStr = @album.image.file.filename
			end
			File.open("uploads/" + artistStr + "-scraper.txt", "w") do |f|
				f.write(@album.scraper)
			end
		else
			trackString = "[\n"
			trackStringArr = @album.temp_tracklist.split(/\n/)
			trackStringArr.each_with_index do |currentLine, index|
				matchArr = currentLine.split(/", /)
				if matchArr.length == 3
					trackString << "{\n" +
					"title: " + matchArr[0] + "\",\n" +
					"romanization: " + matchArr[1] + "\",\n" + 
					"duration: \"" + matchArr[2] + "\"\n" +
					"},\n"
				end
				if matchArr.length == 2
					trackString << "{\n" +
					"title: " + matchArr[0] + "\",\n" +
					"romanization: " + "\"" + "\",\n" + 
					"duration: \"" + matchArr[1] + "\"\n" +
					"},\n"
				end
				if matchArr.length == 1
					trackString << "{\n"
					"title: " + matchArr[0] + "\",\n" +
					"romanization: \"\",\n" + 
					"duration: \"\"\n" +
					"},\n"
				end
			end
			trackString << "])"
			coverString = @album.title.downcase
			coverString = coverString.gsub(/\s+|\W|\_/, "")
			coverString = coverString + ".jpg"
			albumString = 
				"CreateAlbumWithTracks({\n" +
				"title: \'" + @album.title + "\',\n" +
				"romanization: \'" + @album.romanization + "\',\n" +
				"romaji_artist: \'" + @album.romaji_artist + "\',\n" +
				"japanese_artist: \'" + @album.japanese_artist + "\',\n" +
				"year: \'" + @album.year + "\',\n" +
				"description: \'" + @album.description + "\',\n" +
				"coverlink: \'" + coverString + "\',\n" +
				"flavor: \'" + @album.flavor + "\'},\n" + trackString
			if @album.valid?	
				File.open("uploads/" + @album.title + ".txt", "w") do |f|
					f << albumString
				end
			end
		end
	end
end