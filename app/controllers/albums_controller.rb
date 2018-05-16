class AlbumsController < ApplicationController
	def index
		@albums = Album.all
		@albums.each { | a | a.coverlink = ActionController::Base.helpers.image_url(a.coverlink)}
		puts @albums.first.coverlink
		@tracks = Track.all
		gon.Albums = @albums
		gon.Tracks = @tracks
	end
end
