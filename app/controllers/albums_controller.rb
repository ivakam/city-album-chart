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
			albumWithTracks['contributor'] =  (!album.user_id.nil?) ? User.find_by(id: album.user_id).username : 'Unknown'
			albumWithTracks['upload_date'] = album.created_at.strftime("%d-%m-%Y")
			albumWithTracks['thumbnail'] = album.cover.variant(resize: '200x200').processed.service_url
			albumWithTracks['coverlink'] = album.cover.service_url
			tempTracks = []
			tracks.each do | track |
				if track["album_id"] == album["id"]
					tempTracks.push(track)
				end
			end
			albumWithTracks["tracklist"] = tempTracks
			albumResult[index] = albumWithTracks
		end
		render :json => albumResult
		return
	end
	
	def show
	end
	
	def fetch
		@albums = Album.all
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
            params[:q].split()[1..-1].to_a.each do |q|
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
		if get_user
            if get_user.email_confirmed
				if params[:scraper].present?
					scraperAlbums = params[:scraper]
					scraperAlbums.each do | a |
						a = a[1]
						album = Album.new()
						album.flavor = ''
						album.japanese_artist = ''
						album.description = ''
						album.romanization = ''
						album.title = a[:title]
						album.romaji_artist = a[:artist]
						coverPath = Rails.root.join("app/assets/images/missingcover.jpg")
						album.cover.attach(io: File.open(coverPath), filename: "missingcover.jpg")
						album.year = a[:year]
						album.user_id = get_user.id
						album.tags = "#{album.title} #{album.romaji_artist} #{album.year}"
						album.quality = album.year.present? ? 45 : 35
						album.save
						a[:tracklist].each do | t |
							t = t[1]
							track = Track.new()
							track.title = t[:title]
							track.romanization = ''
							track.duration = t[:length]
							track.album = album
							track.order = t[:trackNumber]
							album.tags << " #{track.title}"
							track.save
						end
					end
					redirect_to '/albums/submit', notice: 'Album submitted!', turbolinks: false
				elsif params[:album][:title].present? && params[:album][:romaji_artist].present?
					@album = Album.new(album_params)
					if !@album.cover.attached?
						coverPath = Rails.root.join("app/assets/images/missingcover.jpg")
						@album.cover.attach(io: File.open(coverPath), filename: "missingcover.jpg")
						p "ERROR: Could not find cover for #{@album.title}"
					else
						p "Successfully attached cover to #{@album.title}"
					end
					@album.tags = "#{params[:album][:title]} #{params[:album][:romanization]} #{params[:album][:romaji_artist]} #{params[:album][:japanese_artist]} #{params[:album][:year]} #{params[:album][:description]} #{params[:album][:flavor].gsub(/,/,'')}"
					tempQuality = 0
					if params[:tracklist] != ''
						    parsedTracks = JSON.parse(params[:tracklist])
					    parsedTracks.each do | t |
						    @album.tags << " #{t[1][:romanization]} #{t[1][:title]}"
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
					@album.user_id = get_user.id
					@album.save
					p "Success!"
					redirect_to '/albums/submit', notice: 'Album submitted!'
				else
				    p 'Invalid parameters for album'
				end
            else
                activation_barrier
            end
		else
			login_barrier
		end
	end
	
	def update
		if get_user && get_user.admin
			paramAlbum = params[:album]
			paramTracks = JSON.parse(params[:tracklist])
			@album = Album.find_by(title: paramAlbum[:title_old], romaji_artist: paramAlbum[:romaji_artist_old])
			@album.update(
				title: paramAlbum[:title],
				romanization: paramAlbum[:romanization],
				japanese_artist: paramAlbum[:japanese_artist],
				romaji_artist: paramAlbum[:romaji_artist],
				year: paramAlbum[:year],
				flavor: paramAlbum[:flavor],
				description: paramAlbum[:description],
				tags: "#{params[:album][:title]} #{params[:album][:romanization]} #{params[:album][:romaji_artist]} #{params[:album][:japanese_artist]} #{params[:album][:year]} #{params[:album][:description]} #{params[:album][:flavor].gsub(/,/,'')}"
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
			@album.tracks.each do | t |
				@album.tags << " #{t.title} #{t.romanization}"
			end
			if paramAlbum[:cover].present?
				if @album.cover.attached?
					@album.cover.purge
					@album.cover.attach(paramAlbum[:cover])
				else
					@album.cover.attach(paramAlbum[:cover])
				end
			end
			redirect_to request.referrer, notice: "Album updated!"
		else
			on_access_denied
		end
	end
	
	def destroy
		if get_user && get_user.admin
			toBeNuked = JSON.parse(params[:album][:serialized_ids])
			toBeNuked.each do | album |
				@album = Album.find_by(id: album)
				@album.destroy
			end
		else
			on_access_denied
		end
	end
	
	def submit
        if !get_user
            login_barrier
        elsif get_user && !get_user.email_confirmed
            activation_barrier
        else
		    render 'submit'
        end
	end
	
	private 
	
	def album_params
		params.require(:album).permit(:description, :romanization, :duration, :image, :coverlink, :title, :romaji_artist, :japanese_artist, :flavor, :year)
	end
end
