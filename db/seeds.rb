# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
albums = Album.create([
	{ title: "Album 1", artist: "Artist 1", year: "1971", description: "Desc. 1"},
	{ title: "Album 2", artist: "Artist 2", year: "1972", description: "Desc. 2"},
	{ title: "Album 3", artist: "Artist 3", year: "1973", description: "Desc. 3"},
	{ title: "Album 4", artist: "Artist 4", year: "1974", description: "Desc. 4"},
	{ title: "Album 5", artist: "Artist 5", year: "1975", description: "Desc. 5"},
	{ title: "Album 6", artist: "Artist 6", year: "1976", description: "Desc. 6"}])