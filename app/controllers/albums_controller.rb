require 'json'

class AlbumsController < ApplicationController
	def contains_cjk?
		!!(self =~ /\p{Han}|\p{Katakana}|\p{Hiragana}|\p{Hangul}/)
	end
	def tPop(albums, params)
		if !albums.any?
			render :json => ["Out of albums to render!"]
			return
		end
		albumIDs = ""
		albums.each do | album |
			albumIDs << "'#{album["id"].to_s}', "
		end
		albumIDs = albumIDs.gsub(/,\s+$/, '')
		tracks = Track.find_by_sql("SELECT * FROM tracks WHERE album_id IN (#{albumIDs})")
		albumResult = []
		albums.each_with_index do | album, index |
			albumWithTracks = {}
			album.attributes.each_pair do | key, value |
				albumWithTracks[key] = value
			end
			tempTracks = []
			tracks.each do | track |
				if track["album_id"] == album["id"]
					tempTracks.push(track)
				end
			end
			albumWithTracks["tracklist"] = tempTracks
			albumResult[index] = albumWithTracks
		end
		if params[:total_count] == "true"
			albumResult << @@totalAlbums
		end
		render :json => albumResult
		return
	end
	def show
	end
	def fetch
		@albums = Album.all
		@@totalAlbums = @albums.count
		if params.to_unsafe_hash.size === 2
			@albums = tPop(@albums, params)
			return
		end
		if params[:q] == nil
			params.each do | key, value |
				if key == "title" || key == "romaji_artist" || key == "japanese_artist" || key == "year" || key == "flavor"
					@albums = Album.where("#{key} LIKE ?", '%' + value + '%')
				end
			end
		else
			@albums = Album.where("title LIKE ? OR romanization LIKE ? OR romaji_artist LIKE ? OR japanese_artist LIKE ? OR flavor LIKE ? OR year LIKE ? OR description LIKE ?", '%' + params[:q] + '%', '%' + params[:q] + '%','%' + params[:q] + '%', '%' + params[:q] + '%', '%' + params[:q] + '%', '%' + params[:q] + '%', '%' + params[:q] + '%')
			if params[:q_track]
				tempAlbums = Album.joins(:tracks).where('tracks.title LIKE ? OR tracks.romanization LIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")
				albums = @albums + tempAlbums
				@albums = Album.where(id: albums.map(&:id))
			end
		end
		if params[:sort] != nil
			params[:sort].downcase!
		end
		if params[:sort] == "asc" || params[:sort] == "desc"
			sortType = params[:sort_type].downcase
			if sortType == "artist"
				sortType = "romaji_artist"
			end
			if params[:sort] == "asc"
				@albums = @albums.order(Arel.sql(sortType))
			end
			if params[:sort] == "desc"
				@albums = @albums.order(Arel.sql(sortType)).reverse_order
			end
		else
			@albums = @albums.order(:quality).reverse_order
		end
		if params[:limit]
			@albums = @albums.limit(params[:limit])
		end
		if params[:offset]
			@albums = @albums.offset(params[:offset])
		end
		@albums = tPop(@albums, params)
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
	def update
		paramAlbum = params[:album]
		paramTracks = JSON.parse(params[:tracklist])
		p paramAlbum
		@album = Album.find_by(title: paramAlbum[:title_old], romaji_artist: paramAlbum[:romaji_artist_old])
		@album.update(
			title: paramAlbum[:title],
			romanization: paramAlbum[:romanization],
			japanese_artist: paramAlbum[:japanese_artist],
			romaji_artist: paramAlbum[:romaji_artist],
			year: paramAlbum[:year],
			flavor: paramAlbum[:flavor],
			description: paramAlbum[:description]
		)
		deleteList = params[:delete_list].split(/\+\+\+/)
		deleteList.each do | track |
			toBeNuked = Track.find_by(album_id: @album.id, title: track)
			toBeNuked.destroy
		end
		paramTracks.each do | track |
			realTrack = Track.find_by(album_id: @album.id, title: track['title_old'])
			if realTrack.nil?
				tempTrack = Track.new(title: track['title'], romanization: track['romanization'], duration: track['duration'])
				tempTrack.album = @album
				tempTrack.save
			else
				realTrack.update(
					title: track['title'],
					romanization: track['romanization'],
					duration: track['duration']
				)
			end
		end
	end
	
	private def album_params
		params.permit(:delete_list, :description, :description_old, :tracklist, :romanization, :romanization_old, :duration, :duration_old, :image, :coverlink, :temp_tracklist, :thumbnail, :title, :title_old, :romaji_artist, :romaji_artist_old, :japanese_artist, :japanese_artist_old, :flavor, :flavor_old, :year, :year_old, :q, :offset, :limit, :sort, :sort_type, :q_track, :total_count)
	end
end