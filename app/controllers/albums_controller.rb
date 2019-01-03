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
		tracks = tracks.sort_by(&:order)
		albumResult = []
		albums.each_with_index do | album, index |
			albumWithTracks = {}
			album.attributes.each_pair do | key, value |
				albumWithTracks[key] = value
			end
			albumWithTracks['contributor'] = User.find_by(id: album.user_id).username
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
		if params[:q] == nil || params[:q] == ''
			params.each do | key, value |
				if key == "title" || key == "romaji_artist" || key == "japanese_artist" || key == "year" || key == "flavor"
					@albums = Album.where("#{key} LIKE ?", '%' + value + '%')
				end
			end
		else
            querystr = "tags LIKE '%#{params[:q].split.empty? ? '' : params[:q].split[0] }%'"
            params[:q].split()[1..-1].each do |q|
                querystr << " AND tags LIKE '%#{q}%'"
            end
            @albums = Album.where(querystr)
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
		if !@album.cover.attached?
			coverPath = Rails.root.join("app/assets/images/missingcover.jpg")
			@album.cover.attach(io: File.open(coverPath), filename: "missingcover.jpg")
			p "ERROR: Could not find cover for #{@album.title}"
		else
			p "Successfully attached cover to #{@album.title}"
		end
		@album.coverlink = @album.rails_blob_url(@album.cover)
		@album.thumbnail = @album.rails_representation_url(@album.cover.variant(resize: "200x200"))
		@album.tags = "#{params[:album][:title]} #{params[:album][:romanization]} #{params[:album][:romaji_artist]} #{params[:album][:japanese_artist]} #{params[:album][:year]} #{params[:album][:description]} #{params[:album][:flavor].gsub(/,/,'')}"
		tempQuality = 0
		if params[:tracklist] != ''
				parsedTracks = JSON.parse(params[:tracklist])
			parsedTracks.each do | t |
				@album.tags << " #{t[1][:romanization]} #{t[1][:romanization]}"
			end
			trackDurationCount = 0
			parsedTracks.each_with_index do | t, i |
				t[1][:order] = i + 1
			end
			parsedTracks.each do | t |
				if t[1]['duration'].present?
					trackDurationCount += 1
				end
			end
			@album.tracks = parsedTracks.map { | t | Track.new(t[1])}
		else
			parsedTracks = []
		end
		hasTracks = parsedTracks.empty?
		if  @album.description.present?
			tempQuality += 5
		end
		if  @album.year.present?
			tempQuality += 10
		end
		if  @album.flavor.present?
			tempQuality += 5
		end
		if hasTracks
			tempQuality += 30
		end
		if trackDurationCount == parsedTracks.length
			tempQuality += 5
		end
		if @album.cover.present?
			tempQuality += 10
		end
		@album.quality = tempQuality
		@album.save
		p "Success!"
		redirect_to '/albums/submit', notice: 'Album submitted!'
	end
	def update
		#Change this to admin-only
		if !helpers.fetch_user
			return
		end
		paramAlbum = params[:album]
		paramTracks = JSON.parse(params[:album][:tracklist])
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
		paramTracks.each_with_index do | track, i |
			track['order'] = i + 1
			realTrack = Track.find_by(album_id: @album.id, title: track['title_old'])
			if realTrack.nil?
				tempTrack = Track.new(title: track['title'], romanization: track['romanization'], duration: track['duration'], order: track['order'])
				tempTrack.album = @album
				tempTrack.save
			else
				realTrack.update(
					title: track['title'],
					romanization: track['romanization'],
					duration: track['duration'],
					order: track['order']
				)
			end
		end
	end
	def destroy
		begin
			if User.find(session[:user_id]).admin
				toBeNuked = JSON.parse(params[:user][:serialized_ids])
				p toBeNuked
				toBeNuked.each do | album |
					@album = Album.find_by(id: album)
					@album.destroy
				end
				return
			end
			rescueHandler('401', true)
		rescue StandardError => e
			rescueHandler('401', true, e)
		end
	end
	def submit
		if session[:user_id]
			render 'submit'
		else
			rescueHandler('login_barrier', true)
		end
	end
	private def album_params
		params.permit(:delete_list, :description, :description_old, :tracklist, :romanization, :romanization_old, :duration, :duration_old, :image, :coverlink, :thumbnail, :title, :title_old, :romaji_artist, :romaji_artist_old, :japanese_artist, :japanese_artist_old, :flavor, :flavor_old, :year, :year_old, :q, :offset, :limit, :sort, :sort_type, :q_track, :total_count, album: {})
	end
end
