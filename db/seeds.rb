def CreateAlbumWithTracks(albumParam, tracks)
	a = Album.create(albumParam)
	a.save
	t = Track.create(tracks).each do | t |
		t.album = a
		t.save
	end
end

CreateAlbumWithTracks({
title: "Big Wave",
romanization: "",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "1984",
description: "Big Wave is Tatsuro Yamashita's soundtrack to the 1984 movie of the same name.",
coverlink: "bigwave.jpg"
},
[{
title: "The Theme from Big Wave",
romanization: "",
duration: "3:38"
},	
{
title: "Jody",
romanization: "",
duration: "3:50"
},	
{
title: "Only with You",
romanization: "",
duration: "3:43"
},	
{
title: "Magic Ways",
romanization: "",
duration: "4:48"
},	
{
title: "Your Eyes",
romanization: "",
duration: "3:14"
},	
{
title: "I Love You (Part 2)",
romanization: "",
duration: "2:05"
},	
{
title: "Girls on the Beach",
romanization: "",
duration: "2:46"
},	
{
title: "Please let me Wonder",
romanization: "",
duration: "3:08"
},	
{
title: "Darlin'",
romanization: "",
duration: "3:29"
},	
{
title: "Guess I'm Dumb",
romanization: "",
duration: "3:14"
},	
{
title: "This could be the Night",
romanization: "",
duration: "4:02"
},	
{
title: "I Love You (Part 1)",
romanization: "",
duration: "2:05"}]
)








# {
# title: "Seychelles",
# romanization: "",
# romaji_artist: "Masayoshi Takanaka",
# japanese_artist: "虹伝説",
# year: "1976",
# description: "blah",
# coverlink: "seychelles.jpg",
# },	
# {
# title: "Adventure",
# romanization: "",
# romaji_artist: "Momoko Kikuchi",
# japanese_artist: "菊池桃子",
# year: "1986",
# description: "blah",
# coverlink: "adventure.png",
# },	
# {
# title: "Cologne",
# romanization: "",
# romaji_artist: "Kaoru Akimoto",
# japanese_artist: "秋元薫",
# year: "1986",
# description: "blah",
# coverlink: "cologne.jpg",
# },	
# {
# title: "Vitamin EPO",
# romanization: "",
# romaji_artist: "EPO",
# japanese_artist: "",
# year: "1983",
# description: "blah",
# coverlink: "EPO.jpg",
# },	
# {
# title: "Miss M.",
# romanization: "",
# romaji_artist: "Mariya Takeuchi",
# japanese_artist: "竹内まりや",
# year: "1980",
# description: "blah",
# coverlink: "missm.jpg",
# },	
# {
# title: "Big Wave",
# romanization: "",
# romaji_artist: "Tatsuro Yamashita",
# japanese_artist: "山下達郎",
# year: "1984",
# description: "Big Wave is Tatsuro Yamashita's soundtrack to the 1984 movie of the same name.",
# coverlink: "bigwave.jpg",
# },	
# {
# title: "For You",
# romanization: "",
# romaji_artist: "Tatsuro Yamashita",
# japanese_artist: "山下達郎",
# year: "1982",
# description: "",
# coverlink: "foryou.jpg",
# },	
# {
# title: "Melodies",
# romanization: "",
# romaji_artist: "Tatsuro Yamashita",
# japanese_artist: "山下達郎",
# year: "1983",
# description: "",
# coverlink: "melodies.jpg",
# },	
# {
# title: "Pocket Music",
# romanization: "",
# romaji_artist: "Tatsuro Yamashita",
# japanese_artist: "山下達郎",
# year: "1986",
# description: "",
# coverlink: "pocketmusic.jpg",
# },	
# {
# title: "Artisan",
# romanization: "",
# romaji_artist: "Tatsuro Yamashita",
# japanese_artist: "山下達郎",
# year: "1991",
# description: "",
# coverlink: "artisan.jpg",
# },	
# {
# title: "Cheer Up! The Summer",
# romanization: "",
# romaji_artist: "Tatsuro Yamashita",
# japanese_artist: "山下達郎",
# year: "2016",
# description: "",
# coverlink: "cheerupthesummer.jpg",
# },	
# {
# title: "Come Along 3",
# romanization: "",
# romaji_artist: "Tatsuro Yamashita",
# japanese_artist: "山下達郎",
# year: "2017",
# description: "",
# coverlink: "comealong3.jpg",
# },	
# {
# title: "Cozy",
# romanization: "",
# romaji_artist: "Tatsuro Yamashita",
# japanese_artist: "山下達郎",
# year: "1998",
# description: "",
# coverlink: "cozy.jpg",
# },	
# {
# title: "Reborn",
# romanization: "",
# romaji_artist: "Tatsuro Yamashita",
# year: "2017",
# japanese_artist: "山下達郎",
# description: "",
# coverlink: "reborn.jpg",
# },	
# {
# title: "Season's Greetings",
# romanization: "",
# romaji_artist: "Tatsuro Yamashita",
# japanese_artist: "山下達郎",
# year: "1993",
# description: "Tatsuro Christmas album.",
# coverlink: "seasonsgreetings.jpg",
# },	
# {
# title: "Treasures",
# romanization: "",
# romaji_artist: "Tatsuro Yamashita",
# japanese_artist: "山下達郎",
# year: "1995",
# description: "",
# coverlink: "treasures.jpg",
# },	
# {
# title: "僕の中の少年",
# romanization: "Boku no Naka no Shounen",
# romaji_artist: "Tatsuro Yamashita",
# japanese_artist: "山下達郎",
# year: "1988",
# description: "",
# coverlink: "僕の中の少年.jpg",
# },	
# {
# title: "光と君へのレクイエム",
# romanization: "Hikari to Kimi e no Requiem",
# romaji_artist: "Tatsuro Yamashita",
# japanese_artist: "山下達郎",
# year: "2013",
# description: "",
# coverlink: "光と君へのレクイエム.jpg",
# },	
# {
# title: "Surf & Snow",
# romanization: "",
# romaji_artist: "Yumi Matsutoya",
# japanese_artist: "松任谷由実",
# year: "1980",
# description: "",
# coverlink: "surfsnow.jpg",
# },	
# {
# title: "On the Street Corner 1",
# romanization: "",
# romaji_artist: "Tatsuro Yamashita",
# japanese_artist: "山下達郎",
# year: "1986",
# description: "Tatsuro acapella album.",
# coverlink: "onthestreetcorner1.jpg",
# },	
# {
# title: "On the Street Corner 2",
# romanization: "",
# romaji_artist: "Tatsuro Yamashita",
# japanese_artist: "山下達郎",
# year: "1986",
# description: "Tatsuro acapella album.",
# coverlink: "onthestreetcorner2.jpg",
# },	
# {
# title: "On the Street Corner 3",
# romanization: "",
# romaji_artist: "Tatsuro Yamashita",
# japanese_artist: "山下達郎",
# year: "1999",
# description: "Tatsuro acapella album.",
# coverlink: "onthestreetcorner3.jpg",
# },	
# {
# title: "Tatsuro Songs from L.A.",
# romanization: "",
# romaji_artist: "Various Artists",
# japanese_artist: "",
# year: "1990",
# description: "English covers of Tatsuro songs.",
# coverlink: "tatsurosongsfromla.jpg",
# },	
# {
# title: "Tatsuro Songs from L.A. 2",
# romanization: "",
# romaji_artist: "Various Artists",
# japanese_artist: "",
# year: "1991",
# description: "English covers of Tatsuro songs.",
# coverlink: "tatsurosongsfromla2.jpg",
# },	
# {
# title: "Jody",
# romanization: "",
# romaji_artist: "L.A. Unit",
# japanese_artist: "",
# year: "1990",
# description: "English covers of Tatsuro songs.",
# coverlink: "jody.jpg"}






# {
# title: "The Theme from Big Wave",
# romanization: "",
# duration: "3:38",
# },	
# {
# title: "Jody",
# romanization: "",
# duration: "3:50",
# },	
# {
# title: "Only with You",
# romanization: "",
# duration: "3:43",
# },	
# {
# title: "Magic Ways",
# romanization: "",
# duration: "4:48",
# },	
# {
# title: "Your Eyes",
# romanization: "",
# duration: "3:14",
# },	
# {
# title: "I Love You (Part 2)",
# romanization: "",
# duration: "",
# },	
# {
# title: "Girls on the Beach",
# romanization: "",
# duration: "2:46",
# },	
# {
# title: "Please let me Wonder",
# romanization: "",
# duration: "3:08",
# },	
# {
# title: "Darlin'",
# romanization: "",
# duration: "3:29",
# },	
# {
# title: "Guess I'm Dumb",
# romanization: "",
# duration: "3:14",
# },	
# {
# title: "This could be the Night"
# romanization: "",
# duration: "4:02",
# },	
# {
# title: "I Love You (Part 1)",
# romanization: "",
# duration: "2:05"}

