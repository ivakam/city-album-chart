class AlbumsController < ApplicationController
	def index
		@albums = Album.all
		@tracks = Track.all
		gon.Albums = @albums
		gon.Tracks = @tracks
	end
end
