require 'faker'
require 'yaml'
# Faker::UniqueGenerator.clear
# (0..50).each do | i |
# 	user = User.new()
# 	user.username = Faker::Internet.unique.username
# 	user.email = Faker::Internet.unique.email
# 	user.password = Faker::Internet.password(8, 16)
# 	user.karma = rand(-5000..5000)
# 	user.admin = rand(0..50) > 47 ? true : false
# 	if user.admin
# 		user.account_type = 'Administrator'
# 	else
# 		user.account_type = 'Member'
# 	end
# 	user.banned = false
# 	user.gender = rand(0..1) == 1 ? 'Male' : 'Female'
# 	user.birth_year = rand(1900..2019)
# 	user.location = Faker::Address.country
# 	user.bio = Faker::MostInterestingManInTheWorld.quote
# 	user.signature = Faker::Dota.quote
# 	badgeArr = ['Admin ', 'VIP ', 'Honorary ', 'Funk_master ', 'Oldie ']
# 	user.badges = ''
# 	badgeArr.each do | b |
# 		if rand(0..2) == 1
# 			user.badges << b
# 		end
# 	end
# 	user.save
# 	p "User #{i} generated"
# end

# @usercount = User.all.length

# (0..5).each do | i |
# 	thread = ForumThread.new()
# 	thread.title = Faker::Book.title
# 	thread.category = 'rules'
# 	thread.score = rand(-50000..50000)
# 	thread.stickied = true
# 	thread.archived = false
# 	thread.locked = false
# 	thread.user = User.find(rand(1..@usercount))
# 	thread.body = Faker::HitchhikersGuideToTheGalaxy.quote
# 	thread.save
# 	p "Thread #{i} generated"
# end

# (0..50).each do | i |
# 	thread = ForumThread.new()
# 	thread.title = Faker::Book.title
# 	thread.category = 'rules'
# 	thread.score = rand(-50000..50000)
# 	thread.stickied = false
# 	thread.archived = false
# 	thread.locked = false
# 	thread.user = User.find(rand(1..@usercount))
# 	thread.body = Faker::HitchhikersGuideToTheGalaxy.quote
# 	thread.save
# 	p "Thread #{i} generated"
# end

# ForumThread.all.each_with_index do | parentThread, i |
# 	(1..rand(5..20)).each do | i |
# 		reply = Post.new()
# 		reply.user = User.find(rand(1..@usercount))
# 		reply.forum_thread = parentThread
# 		reply.body = Faker::HitchhikersGuideToTheGalaxy.quote
# 		reply.score = rand(-5000..5000)
# 		reply.save
# 	end
# 	p "Thread #{i.to_s + ' ' + parentThread.title} populated"
# end

def CreateAlbumWithTracks(albumParam, tracks = [])
	album = { albumParam[:title] => { :album_info => albumParam, :tracks => tracks } }
	yml = File.open('albums.yml', 'a')
	yml << album.to_yaml
	return
	currentAlbum = Album.new(albumParam)
	coverName = currentAlbum.title.downcase.gsub(/[^[\u3000-\u303F][\u3040-\u309F][\u30A0-\u30FF][\uFF00-\uFFEF][\u4E00-\u9FAF][\u2605-\u2606][\u2190-\u2195]\u203B\p{L}\d]/, '')
	coverPath = Dir.glob(Rails.root.join("app/assets/images/#{coverName}.*")).first
	p "Album Title: " + currentAlbum.title
	p "Cover name: " + coverName
	if coverPath == nil
		coverPath = Rails.root.join("app/assets/images/missingcover.jpg")
		currentAlbum.cover.attach(io: File.open(coverPath), filename: "missingcover.jpg")
		p "ERROR: Could not find cover for #{currentAlbum.title}"
	else
		currentAlbum.cover.attach(io: File.open(coverPath), filename: coverPath[/(#{coverName})\..+$/, 0])
	end
	#p "Cover path: " + coverPath 
	currentAlbum.coverlink = currentAlbum.rails_blob_url(currentAlbum.cover)
	currentAlbum.thumbnail = currentAlbum.rails_representation_url(currentAlbum.cover.variant(resize: "200x200"))
    currentAlbum.tags = "#{albumParam[:title]} #{albumParam[:romanization]} #{albumParam[:romaji_artist]} #{albumParam[:japanese_artist]} #{albumParam[:year]} #{albumParam[:description]} #{albumParam[:flavor].gsub(/,/,'')}"
    if albumParam[:user_id].present?
    	currentAlbum.user_id = albumParam[:user_id]
    else
    	currentAlbum.user_id = 1
    end
    tracks.each do |t|
        currentAlbum.tags << " #{t[:title]} #{t[:romanization]}"
    end
	tempQuality = 0
	trackDurationCount = 0
	tracks.each_with_index do | t, i |
		t['order'] = i + 1
	end
	hasTracks = (tracks == []) ? false : true
	currentAlbum.tracks = tracks.map { | t | Track.new(t)}
	tracks.each do | t |
		if t["duration"].present?
			trackDurationCount += 1
		end
	end
	if currentAlbum.description.present?
		tempQuality += 5
	end
	if currentAlbum.year.present?
		tempQuality += 10
	end
	if currentAlbum.flavor.present?
		tempQuality += 5
	end
	if hasTracks
		tempQuality += 30
	end
	if trackDurationCount == tracks.length
		tempQuality += 5
	end
	if currentAlbum.coverlink.present?
		tempQuality += 10
	end
	currentAlbum.quality = tempQuality
	currentAlbum.save
	p "Success!"
end

CreateAlbumWithTracks({
title: "Big Wave",
romanization: "",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "1984",
description: "Big Wave is Tatsuro Yamashita's soundtrack to the 1984 movie of the same name.",
flavor: "Dreamy, Ballad"
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

CreateAlbumWithTracks({
title: "Grey Skies",
romanization: "",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "1976",
description: "",
flavor: "Soul, Jazz"
},
[{
title: "時の始まり",
romanization: "",
duration: "3:56"
},
{
title: "約束",
romanization: "",
duration: "3:51"
},
{
title: "One's Love",
romanization: "",
duration: "3:58"
},
{
title: "午后の休息",
romanization: "",
duration: "4:17"
},
{
title: "愛は幻",
romanization: "",
duration: "4:50"
},
{
title: "Wander Lust",
romanization: "",
duration: "3:05"
},
{
title: "街",
romanization: "",
duration: "3:55"
},
{
title: "いつでも そばに",
romanization: "",
duration: "4:09"
},
{
title: "When I Met The Grey Sky",
romanization: "",
duration: "5:50"
},
{
title: "Breakin' Blue",
romanization: "",
duration: "5:39"
},
]
)
CreateAlbumWithTracks({
title: "Sunshower",
romanization: "",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "1977",
description: "",flavor: "Jazz"
},
[{
title: "Summer Connection",
romanization: "",
duration: "4:30"
},
{
title: "くすりをたくさん",
romanization: "",
duration: "4:09"
},
{
title: "何もいらない",
romanization: "",
duration: "4:02"
},
{
title: "都会",
romanization: "",
duration: "5:10"
},
{
title: "からっぽの椅子",
romanization: "",
duration: "5:34"
},
{
title: "Law Of Nature",
romanization: "",
duration: "3:49"
},
{
title: "誰のために",
romanization: "",
duration: "5:30"
},
{
title: "Silent Screamer",
romanization: "",
duration: "3:35"
},
{
title: "Sargasso Sea",
romanization: "",
duration: "2:49"
},
{
title: "振子の山羊",
romanization: "",
duration: "5:43"
},
{
title: "サマー.コネクション",
romanization: "",
duration: "4:13"
},
{
title: "部屋",
romanization: "",
duration: "3:27"
},
{
title: "荒涼",
romanization: "",
duration: "3:45"
},
]
)
CreateAlbumWithTracks({
title: "Romantique",
romanization: "",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "1980",
description: "",
flavor: "Electronic, Euro"
},
[{
title: "Carnaval",
romanization: "",
duration: "4:47"
},
{
title: "ディケイド.ナイト",
romanization: "",
duration: "3:46"
},
{
title: "雨の夜明け",
romanization: "",
duration: "4:33"
},
{
title: "若き日の望楼",
romanization: "",
duration: "3:55"
},
{
title: "Bohemian",
romanization: "",
duration: "4:09"
},
{
title: "果てなき旅情",
romanization: "",
duration: "4:44"
},
{
title: "ふたり",
romanization: "",
duration: "3:49"
},
{
title: "軽蔑",
romanization: "",
duration: "3:41"
},
{
title: "新しいシャツ",
romanization: "",
duration: "4:02"
},
{
title: "蜃気楼の街",
romanization: "",
duration: "2:49"
},
{
title: "愛にすくわれたい",
romanization: "",
duration: "3:11"
},
]
)
CreateAlbumWithTracks({
title: "Mignonne",
romanization: "",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "1978",
description: "",
flavor: "Funk, Ballad"
},
[{
title: "じゃじゃ馬娘",
romanization: "",
duration: "4:37"
},
{
title: "横顔",
romanization: "",
duration: "3:26"
},
{
title: "黄昏れ",
romanization: "",
duration: "3:43"
},
{
title: "空をとべたら",
romanization: "",
duration: "3:42"
},
{
title: "風のオルガン",
romanization: "",
duration: "3:22"
},
{
title: "言い出せなくて",
romanization: "",
duration: "3:53"
},
{
title: "4_00 A.M.",
romanization: "",
duration: "5:37"
},
{
title: "突然の贈りもの",
romanization: "",
duration: "5:04"
},
{
title: "海と少年",
romanization: "",
duration: "3:23"
},
{
title: "あこがれ",
romanization: "",
duration: "5:54"
},
]
)
CreateAlbumWithTracks({
title: "Cliche",
romanization: "",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "1982",
description: "",
flavor: "Electronic, Euro"
},
[{
title: "黒のクレール",
romanization: "",
duration: "4:59"
},
{
title: "色彩都市",
romanization: "",
duration: "3:34"
},
{
title: "ピーターラビットとわたし",
romanization: "",
duration: "3:11"
},
{
title: "Labyrinth",
romanization: "",
duration: "4:37"
},
{
title: "風の道",
romanization: "",
duration: "3:33"
},
{
title: "光のカーニバル",
romanization: "",
duration: "3:17"
},
{
title: "つむじかぜ (Tourbillon)",
romanization: "",
duration: "3:11"
},
{
title: "憶ひ出 (Memoire)",
romanization: "",
duration: "3:42"
},
{
title: "夏色の服",
romanization: "",
duration: "3:11"
},
{
title: "黒のクレール (Reprise) [Instrumental]",
romanization: "",
duration: "3:10"
},
]
)
CreateAlbumWithTracks({
title: "Aventure",
romanization: "",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "1981",
description: "",
flavor: "Electronic, Euro"
},
[{
title: "恋人達の明日",
romanization: "",
duration: "4:08"
},
{
title: "Samba De Mar",
romanization: "",
duration: "4:09"
},
{
title: "愛の行方",
romanization: "",
duration: "3:39"
},
{
title: "アヴァンチュリエール",
romanization: "",
duration: "4:44"
},
{
title: "テルミネ",
romanization: "",
duration: "3:22"
},
{
title: "チャンス",
romanization: "",
duration: "4:23"
},
{
title: "グランプリ",
romanization: "",
duration: "3:42"
},
{
title: "La Mer, Le Ciel",
romanization: "",
duration: "3:44"
},
{
title: "ブリーカー.ストリートの青春",
romanization: "",
duration: "3:42"
},
{
title: "最後の日付",
romanization: "",
duration: "3:28"
},
]
)
CreateAlbumWithTracks({
title: "大貫妙子トリビュート・アルバム",
romanization: "Tribute to Taeko Ohnuki",
romaji_artist: "Various Artists",
japanese_artist: "",
year: "2013",
description: "",
flavor: "Tribute"
},
[{
title: "都会",
romanization: "",
duration: "4:49"
},
{
title: "Labyrinth",
romanization: "",
duration: "4:36"
},
{
title: "ピーターラビットとわたし",
romanization: "",
duration: "3:46"
},
{
title: "黒のクレール",
romanization: "",
duration: "6:08"
},
{
title: "Happy-go-Lucky",
romanization: "",
duration: "3:56"
},
{
title: "What to do 'cause love you",
romanization: "",
duration: "6:09"
},
{
title: "夏色の服",
romanization: "",
duration: "3:14"
},
{
title: "Rain",
romanization: "",
duration: "5:32"
},
{
title: "突然の贈りもの",
romanization: "",
duration: "5:05"
},
{
title: "色彩都市",
romanization: "",
duration: "3:43"
},
{
title: "突然の贈りもの",
romanization: "",
duration: "5:06"
},
{
title: "風の道",
romanization: "",
duration: "4:01"
},
{
title: "海と少年",
romanization: "",
duration: "3:44"
},
{
title: "横顔",
romanization: "",
duration: "3:52"
},
{
title: "色彩都市",
romanization: "",
duration: "3:51"
},
{
title: "夏に恋する女たち",
romanization: "",
duration: "4:14"
},
{
title: "蜃気楼の街",
romanization: "",
duration: "3:48"
},
{
title: "色彩都市",
romanization: "",
duration: "3:48"
},
{
title: "都会",
romanization: "",
duration: "6:53"
},
{
title: "突然の贈り物",
romanization: "",
duration: "4:59"
},
{
title: "3びきのくま",
romanization: "",
duration: "4:37"
},
])



#Sato, Minako, So Nice, Sugar Babe, Pacific



CreateAlbumWithTracks({
title: "Pacific",
romanization: "",
romaji_artist: "Haruomi Hosono, Shigeru Suzuki & Tatsuro Yamashita",
japanese_artist: "",
year: "1978",
description: "",
flavor: "Jazz"
},
[{
title: "最後の楽園",
romanization: "",
duration: "4:03"
},
{
title: "コーラル・リーフ",
romanization: "",
duration: "3:44"
},
{
title: "ノスタルジア・オブ・アイランド～パート1:バード・ウィンド, パート2:ウォーキング・オン・ザ・ビーチ",
romanization: "",
duration: "9:36"
},
{
title: "スラック・キー・ルンバ",
romanization: "",
duration: "3:01"
},
{
title: "パッション・フラワー",
romanization: "",
duration: "3:34"
},
{
title: "ノアノア",
romanization: "",
duration: "4:09"
},
{
title: "キスカ",
romanization: "",
duration: "5:25"
},
{
title: "Cosmic Surfin'",
romanization: "",
duration: "5:02"
},
]
)
CreateAlbumWithTracks({
title: "Niagara Triangle Vol. 1",
romanization: "",
romaji_artist: "Niagara Triangle",
japanese_artist: "",
year: "1976",
description: "",
flavor: "Rock"
},
[{
title: "ドリーミング・デイ",
romanization: "",
duration: "4:25"
},
{
title: "パレード",
romanization: "",
duration: "5:17"
},
{
title: "遅すぎた別れ",
romanization: "",
duration: "4:25"
},
{
title: "日射病",
romanization: "",
duration: "3:53"
},
{
title: "ココナツ・ホリデイ’76",
romanization: "",
duration: "7:14"
},
{
title: "幸せにさよなら",
romanization: "",
duration: "4:28"
},
{
title: "新無頼横丁",
romanization: "",
duration: "4:43"
},
{
title: "フライング・キッド",
romanization: "",
duration: "4:00"
},
{
title: "Fussa Strut Part-I",
romanization: "",
duration: "4:59"
},
{
title: "夜明け前の浜辺",
romanization: "",
duration: "4:26"
},
{
title: "ナイアガラ音頭",
romanization: "",
duration: "3:16"
},
]
)
CreateAlbumWithTracks({
title: "Niagara Triangle Vol. 2",
romanization: "",
romaji_artist: "Niagara Triangle",
japanese_artist: "",
year: "1991",
description: "",
flavor: "Rock"
},
[{
title: "A面で恋をして",
romanization: "",
duration: "3:11"
},
{
title: "彼女はデリケート",
romanization: "",
duration: "3:33"
},
{
title: "Bye Bye C-Boy",
romanization: "",
duration: "3:22"
},
{
title: "マンハッタンブリッヂにたたずんで",
romanization: "",
duration: "3:49"
},
{
title: "Nobody",
romanization: "",
duration: "2:30"
},
{
title: "ガールフレンド",
romanization: "",
duration: "3:19"
},
{
title: "夢みる渚",
romanization: "",
duration: "3:46"
},
{
title: "Love Her",
romanization: "",
duration: "3:53"
},
{
title: "週末の恋人たち",
romanization: "",
duration: "3:55"
},
{
title: "オリーブの午后",
romanization: "",
duration: "3:42"
},
{
title: "白い港",
romanization: "",
duration: "4:13"
},
{
title: "Water Color",
romanization: "",
duration: "4:11"
},
{
title: "ハートじかけのオレンジ",
romanization: "",
duration: "3:11"
},
{
title: "A面で恋をして (Choアリ)",
romanization: "",
duration: "3:11"
},
]
)
CreateAlbumWithTracks({
title: "Love",
romanization: "",
romaji_artist: "So Nice",
japanese_artist: "",
year: "1979",
description: "",
flavor: "Jazz"
},
[{
title: "So Nice",
romanization: "",
duration: "1:33"
},
{
title: "光速道路",
romanization: "",
duration: "4:10"
},
{
title: "Last Kiss",
romanization: "",
duration: "5:12"
},
{
title: "陽だまり",
romanization: "",
duration: "4:57"
},
{
title: "Tight Night",
romanization: "",
duration: "5:48"
},
{
title: "Love Sick",
romanization: "",
duration: "4:52"
},
{
title: "かけぬける風",
romanization: "",
duration: "7:04"
},
{
title: "Earth Mover",
romanization: "",
duration: "5:56"
},
{
title: "別離 (わかれ)",
romanization: "",
duration: "6:01"
},
{
title: "Dancing All Night Long",
romanization: "",
duration: "4:22"
},
]
)
CreateAlbumWithTracks({
title: "Songs",
romanization: "",
romaji_artist: "Sugar Babe",
japanese_artist: "",
year: "1975",
description: "",
flavor: "Jazz, Rock"
},
[{
title: "Ｓｈｏｗ",
romanization: "",
duration: "3:28"
},
{
title: "Down Town",
romanization: "",
duration: "4:25"
},
{
title: "蜃気楼の街",
romanization: "",
duration: "3:02"
},
{
title: "風の世界",
romanization: "",
duration: "3:32"
},
{
title: "ためいきばかり",
romanization: "",
duration: "4:23"
},
{
title: "いつも通り",
romanization: "",
duration: "3:37"
},
{
title: "すてきなメロディー",
romanization: "",
duration: "2:38"
},
{
title: "今日はなんだか",
romanization: "",
duration: "4:32"
},
{
title: "雨は手のひらにいっぱい",
romanization: "",
duration: "3:50"
},
{
title: "過ぎ去りし日々 60's Dream)",
romanization: "",
duration: "3:34"
},
{
title: "Sugar",
romanization: "",
duration: "5:57"
},
]
)
CreateAlbumWithTracks({
title: "Super Market",
romanization: "",
romaji_artist: "Hiroshi Sato",
japanese_artist: "佐藤博",
year: "1976",
description: "",
flavor: "Folk, Rock"
},
[{
title: "私の彼氏は200歳",
romanization: "",
duration: "2:14"
},
{
title: "レインボー・シーライン",
romanization: "",
duration: "3:53"
},
{
title: "F.W.Y.",
romanization: "",
duration: "5:18"
},
{
title: "用意はいいかな",
romanization: "",
duration: "3:38"
},
{
title: "NIGHT IN L.A.",
romanization: "",
duration: "4:24"
},
{
title: "HIGH TIMES",
romanization: "",
duration: "8:13"
},
{
title: "いとしのマリー",
romanization: "",
duration: "3:28"
},
{
title: "スーパー・マーケット",
romanization: "",
duration: "1:54"
},
{
title: "パラダイスへ",
romanization: "",
duration: "3:31"
},
{
title: "FOR JUN",
romanization: "",
duration: "2:57"
},
]
)
CreateAlbumWithTracks({
title: "Time",
romanization: "",
romaji_artist: "Hiroshi Sato",
japanese_artist: "佐藤博",
year: "1977",
description: "",
flavor: "Funk, Jazz"
},
[{
title: "タイム",
romanization: "",
duration: "0:54"
},
{
title: "ジョイント",
romanization: "",
duration: "4:16"
},
{
title: "南回帰線",
romanization: "",
duration: "4:21"
},
{
title: "チョイト",
romanization: "",
duration: "2:44"
},
{
title: "山手ホテル",
romanization: "",
duration: "4:02"
},
{
title: "バッド・ジャンキー・ブルース",
romanization: "",
duration: "3:51"
},
{
title: "芽覚め",
romanization: "",
duration: "0:29"
},
{
title: "茜雲の街",
romanization: "",
duration: "3:06"
},
{
title: "ブラック・コーヒー",
romanization: "",
duration: "3:27"
},
{
title: "アイランド ふぁんたじい",
romanization: "",
duration: "2:44"
},
{
title: "影に向かって",
romanization: "",
duration: "5:25"
},
{
title: "最後の手品",
romanization: "",
duration: "3:45"
},
{
title: "メリー・ゴー・ラウンド",
romanization: "",
duration: "2:47"
},
]
)
CreateAlbumWithTracks({
title: "Orient",
romanization: "",
romaji_artist: "Hiroshi Sato",
japanese_artist: "佐藤博",
year: "1979",
description: "",
flavor: "Electronic"
},
[{
title: "カリンバナイト",
romanization: "",
duration: "4:25"
},
{
title: "孫悟空",
romanization: "",
duration: "4:18"
},
{
title: "月の子の名前はレオ",
romanization: "",
duration: "4:14"
},
{
title: "ドンカマ",
romanization: "",
duration: "2:40"
},
{
title: "浄土",
romanization: "",
duration: "4:53"
},
{
title: "空飛ぶじゅうたん",
romanization: "",
duration: "3:35"
},
{
title: "ピクニック",
romanization: "",
duration: "3:43"
},
{
title: "ひかる風",
romanization: "",
duration: "3:39"
},
]
)
CreateAlbumWithTracks({
title: "Awakening",
romanization: "",
romaji_artist: "Hiroshi Sato",
japanese_artist: "佐藤博",
year: "1982",
description: "",
flavor: "Synth"
},
[{
title: "Awakening (覚醒)",
romanization: "",
duration: "2:28"
},
{
title: "You're My Baby",
romanization: "",
duration: "3:49"
},
{
title: "Blue and Moody Music",
romanization: "",
duration: "4:38"
},
{
title: "Only a Love Affair",
romanization: "",
duration: "4:55"
},
{
title: "Love and Peace",
romanization: "",
duration: "4:39"
},
{
title: "From Me To You",
romanization: "",
duration: "3:52"
},
{
title: "I Can't Wait",
romanization: "",
duration: "4:18"
},
{
title: "It Isn't Easy",
romanization: "",
duration: "4:32"
},
{
title: "Awakening",
romanization: "",
duration: "3:42"
},
{
title: "Say Goodbye",
romanization: "",
duration: "3:26"
},
]
)
CreateAlbumWithTracks({
title: "This Boy",
romanization: "",
romaji_artist: "Hiroshi Sato",
japanese_artist: "佐藤博",
year: "1985",
description: "",
flavor: "Synth"
},
[{
title: "Shiny Lady",
romanization: "",
duration: "4:28"
},
{
title: "Kioku No Naka No Mirai Kara",
romanization: "",
duration: "4:28"
},
{
title: "Sweet Inspiration '85",
romanization: "",
duration: "4:04"
},
{
title: "I Can't Wait",
romanization: "",
duration: "4:15"
},
{
title: "Sun Glow",
romanization: "",
duration: "3:42"
},
{
title: "Love Is Happening",
romanization: "",
duration: "3:50"
},
{
title: "Always",
romanization: "",
duration: "4:10"
},
{
title: "Gemini",
romanization: "",
duration: "4:23"
},
{
title: "Say Goodbye",
romanization: "",
duration: "3:23"
},
{
title: "Angelina",
romanization: "",
duration: "4:14"
},
{
title: "This Boy",
romanization: "",
duration: "3:04"
},
]
)
CreateAlbumWithTracks({
title: "扉の冬",
romanization: "Winter's Door",
romaji_artist: "Minako Yoshida",
japanese_artist: "吉田美奈子",
year: "1973",
description: "",
flavor: "Soul, Ballad"
},
[{
title: "外はみんな...",
romanization: "",
duration: "2:57"
},
{
title: "待ちぼうけ",
romanization: "",
duration: "4:40"
},
{
title: "扉の冬",
romanization: "",
duration: "2:45"
},
{
title: "ねこ",
romanization: "",
duration: "3:10"
},
{
title: "綱渡り",
romanization: "",
duration: "3:57"
},
{
title: "変奏",
romanization: "",
duration: "3:14"
},
{
title: "かびん",
romanization: "",
duration: "4:16"
},
{
title: "ひるさがり",
romanization: "",
duration: "3:17"
},
{
title: "週末",
romanization: "",
duration: "3:52"
},
]
)

CreateAlbumWithTracks({
title: "Flapper",
romanization: "",
romaji_artist: "Minako Yoshida",
japanese_artist: "吉田美奈子",
year: "1976",
description: "",
flavor: "Funk, Soul"
},
[{
title: "愛は彼方",
romanization: "",
duration: "4:06"
},
{
title: "かたおもい",
romanization: "",
duration: "4:31"
},
{
title: "朝は君へ",
romanization: "",
duration: "4:40"
},
{
title: "ケッペキにいさん",
romanization: "",
duration: "1:40"
},
{
title: "ラムはお好き？",
romanization: "",
duration: "4:40"
},
{
title: "夢で逢えたら",
romanization: "",
duration: "3:53"
},
{
title: "チョッカイ",
romanization: "",
duration: "4:02"
},
{
title: "忘れかけてた季節へ",
romanization: "",
duration: "5:05"
},
{
title: "ラスト・ステップ",
romanization: "",
duration: "2:53"
},
{
title: "永遠に",
romanization: "",
duration: "5:04"
},
]
)
CreateAlbumWithTracks({
title: "Minako",
romanization: "",
romaji_artist: "Minako Yoshida",
japanese_artist: "吉田美奈子",
year: "1975",
description: "",
flavor: "Funk"
},
[{
title: "移りゆくすべてに",
romanization: "Utsuriyuku Subete Ni",
duration: "8:03"
},
{
title: "レインボー・シー・ライン",
romanization: "Rainbow Sea Line",
duration: "4:01"
},
{
title: "住みなれた部屋で",
romanization: "Suminareta Heya De",
duration: "4:45"
},
{
title: "わたし",
romanization: "Watashi",
duration: "3:22"
},
{
title: "夢を追って",
romanization: "Yume O Otte",
duration: "6:04"
},
{
title: "チャイニーズ・スープ",
romanization: "Chinese Soup",
duration: "2:35"
},
{
title: "パラダイスへ",
romanization: "Paradise E",
duration: "2:52"
},
{
title: "時の中へ",
romanization: "Toki No Naka E",
duration: "5:38"
},
{
title: "ろっかばいまいべいびい",
romanization: "Rock-A-Bye My Baby",
duration: "5:28"
},
]
)
CreateAlbumWithTracks({
title: "Minako II",
romanization: "",
romaji_artist: "Minako Yoshida",
japanese_artist: "吉田美奈子",
year: "1975",
description: "",
flavor: "Funk"
},
[{
title: "Once You Get Started",
romanization: "",
duration: "1:48"
},
{
title: "外はみんな",
romanization: "",
duration: "1:47"
},
{
title: "扉の冬",
romanization: "",
duration: "1:22"
},
{
title: "かびん",
romanization: "",
duration: "1:36"
},
{
title: "ふうらい坊",
romanization: "",
duration: "1:14"
},
{
title: "明日天気になれ",
romanization: "",
duration: "1:52"
},
{
title: "週末",
romanization: "",
duration: "3:11"
},
{
title: "Apple Knocker",
romanization: "",
duration: "4:57"
},
{
title: "Good Morning Heartache",
romanization: "",
duration: "3:16"
},
{
title: "The Way We Are",
romanization: "",
duration: "3:42"
},
{
title: "Precious Lord, Take My Hand, Yo",
romanization: "",
duration: "4:52"
},
{
title: "Ain't No Mountain High Enough",
romanization: "",
duration: "7:20"
},
{
title: "Someone To Watch Over Me",
romanization: "",
duration: "2:31"
},
{
title: "Apple Knocker",
romanization: "",
duration: "1:38"
},
]
)
CreateAlbumWithTracks({
title: "Twilight Zone",
romanization: "",
romaji_artist: "Minako Yoshida",
japanese_artist: "吉田美奈子",
year: "1977",
description: "",
flavor: "Funk"
},
[{
title: "Twilight Zone 'Overture'",
romanization: "",
duration: "1:42"
},
{
title: "恋 - Love",
romanization: "",
duration: "8:03"
},
{
title: "駆けてきたたそがれ - Runner",
romanization: "",
duration: "4:20"
},
{
title: "Melody",
romanization: "",
duration: "6:11"
},
{
title: "恋は流星 - Shooting Star Of Love",
romanization: "",
duration: "6:46"
},
{
title: "Uptown",
romanization: "",
duration: "3:52"
},
{
title: "Raspberry Slope",
romanization: "",
duration: "3:27"
},
{
title: "さよなら - Say Just Good-By",
romanization: "",
duration: "6:21"
},
{
title: "Twilight Zone",
romanization: "",
duration: "7:44"
},
]
)
CreateAlbumWithTracks({
title: "Let's Do It",
romanization: "",
romaji_artist: "Minako Yoshida",
japanese_artist: "吉田美奈子",
year: "1978",
description: "",
flavor: "Funk"
},
[{
title: "愛は思うまま",
romanization: "",
duration: "4:52"
},
{
title: "恋の手ほどき",
romanization: "",
duration: "4:10"
},
{
title: "時よ",
romanization: "",
duration: "3:35"
},
{
title: "海",
romanization: "",
duration: "3:58"
},
{
title: "アイッド・ラーザー・リーヴ・ホワイル・アイム・イン・ラヴ",
romanization: "",
duration: "3:05"
},
{
title: "愛の炎",
romanization: "",
duration: "4:07"
},
{
title: "猫",
romanization: "",
duration: "4:48"
},
{
title: "雲のゆくえに",
romanization: "",
duration: "4:51"
},
{
title: "影になりたい",
romanization: "",
duration: "5:12"
},
]
)
CreateAlbumWithTracks({
title: "Minako Favorites",
romanization: "",
romaji_artist: "Minako Yoshida",
japanese_artist: "吉田美奈子",
year: "1978",
description: "",
flavor: "Funk"
},
[{
title: "移りゆくすべてに",
romanization: "",
duration: "8:05"
},
{
title: "愛は彼方",
romanization: "",
duration: "4:07"
},
{
title: "夢で逢えたら",
romanization: "",
duration: "3:51"
},
{
title: "駆けてきたたそがれ",
romanization: "",
duration: "4:19"
},
{
title: "永遠に",
romanization: "",
duration: "5:00"
},
{
title: "トワイライト・ゾーン",
romanization: "",
duration: "7:45"
},
{
title: "レインボー・シー・ライン",
romanization: "",
duration: "3:59"
},
{
title: "恋は流星",
romanization: "",
duration: "6:46"
},
{
title: "ラズベリー・スロープ",
romanization: "",
duration: "3:25"
},
{
title: "ラスト・ステップ",
romanization: "",
duration: "2:49"
},
]
)
CreateAlbumWithTracks({
title: "Monsters In Town",
romanization: "",
romaji_artist: "Minako Yoshida",
japanese_artist: "吉田美奈子",
year: "1981",
description: "",
flavor: "Funk"
},
[{
title: "Town",
romanization: "",
duration: "6:19"
},
{
title: "Lovin' You",
romanization: "",
duration: "5:58"
},
{
title: "Nights In Her Eyes",
romanization: "",
duration: "1:26"
},
{
title: "Black Eye Lady",
romanization: "",
duration: "5:18"
},
{
title: "Monster Stomp",
romanization: "",
duration: "5:17"
},
{
title: "Knock Knock",
romanization: "",
duration: "4:59"
},
{
title: "Moment Of Twilight",
romanization: "",
duration: "5:43"
},
{
title: "Back In Town",
romanization: "",
duration: "3:05"
},
])
CreateAlbumWithTracks({
title: "Monochrome",
romanization: "",
romaji_artist: "Minako Yoshida",
japanese_artist: "吉田美奈子",
year: "1980",
description: "",
flavor: "Funk, Soul"
},
[{
title: "Tornado",
romanization: "",
duration: "5:46"
},
{
title: "Rainy Day",
romanization: "",
duration: "5:22"
},
{
title: "Black Moon",
romanization: "",
duration: "4:39"
},
{
title: "Sunset",
romanization: "",
duration: "7:51"
},
{
title: "Airport",
romanization: "",
duration: "6:37"
},
{
title: "Mirage",
romanization: "",
duration: "4:14"
},
{
title: "Midnight Driver",
romanization: "",
duration: "7:36"
},
{
title: "Afternoon",
romanization: "",
duration: "4:44"
},
]
)
CreateAlbumWithTracks({
title: "Light'n Up",
romanization: "",
romaji_artist: "Minako Yoshida",
japanese_artist: "吉田美奈子",
year: "1982",
description: "",
flavor: "Funk"
},
[{
title: "Light'n Up",
romanization: "",
duration: "5:48"
},
{
title: "頬に夜の灯",
romanization: "",
duration: "5:42"
},
{
title: "Love Shower",
romanization: "",
duration: "3:15"
},
{
title: "风",
romanization: "",
duration: "6:54"
},
{
title: "Morning Prayer",
romanization: "",
duration: "3:59"
},
{
title: "斜阳 (Reflection)",
romanization: "",
duration: "5:41"
},
{
title: "时の向こう",
romanization: "",
duration: "5:06"
},
{
title: "Alcoholler",
romanization: "",
duration: "6:33"
},
]
)
CreateAlbumWithTracks({
title: "Bells",
romanization: "",
romaji_artist: "Minako Yoshida",
japanese_artist: "吉田美奈子",
year: "1986",
description: "",
flavor: "Funk, Ballad"
},
[{
title: "Wind",
romanization: "",
duration: "2:08"
},
{
title: "Christmas Tree",
romanization: "",
duration: "7:39"
},
{
title: "Pavement of Light",
romanization: "",
duration: "2:31"
},
{
title: "Shadows Are the Thoughts (of the Radiance)",
romanization: "",
duration: "7:13"
},
{
title: "Thanks to You",
romanization: "",
duration: "1:56"
},
{
title: "Dreaming",
romanization: "",
duration: "6:52"
},
{
title: "もみの木",
romanization: "",
duration: "4:25"
},
])


#Takanaka


CreateAlbumWithTracks({
title: "Seychelles",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1976",
description: "",
flavor: "Fusion"
},
[{
title: "Oh! Tengo Suerte",
romanization: "",
duration: "4:13"
},
{
title: "Tokyo Leggy",
romanization: "",
duration: "4:20"
},
{
title: "Shinkiro No Shima E (To Mirage Island)",
romanization: "",
duration: "3:38"
},
{
title: "Akogare No Seychelles Shoto (Dreaming Of Seychelles)",
romanization: "",
duration: "6:10"
},
{
title: "Funkee Mah-Chan",
romanization: "",
duration: "5:02"
},
{
title: "Sayonara.... Fuji-San (Goodbye Mt. Fuji)",
romanization: "",
duration: "4:28"
},
{
title: "Bird Island Kyuko (Bird Island Express)",
romanization: "",
duration: "3:42"
},
{
title: "Tropic Birds",
romanization: "",
duration: "8:50"
},
]
)
CreateAlbumWithTracks({
title: "An Insatiable High",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1977",
description: "",
flavor: "Fusion"
},
[{
title: "Sexy Dance",
romanization: "",
duration: "5:54"
},
{
title: "Malibu",
romanization: "",
duration: "6:15"
},
{
title: "An Insatiable High",
romanization: "",
duration: "10:12"
},
{
title: "E.S.P.",
romanization: "",
duration: "4:11"
},
{
title: "M5",
romanization: "",
duration: "4:21"
},
{
title: "Sundrops",
romanization: "",
duration: "5:10"
},
{
title: "Good (Bad?) Old Days",
romanization: "",
duration: "5:26"
},
]
)
CreateAlbumWithTracks({
title: "Takanaka",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1977",
description: "",
flavor: "Fusion"
},
[{
title: "Summer Breeze",
romanization: "",
duration: "4:53"
},
{
title: "Mambo No. 5 (Disco Dango)",
romanization: "",
duration: "4:01"
},
{
title: "Sweet Agnes",
romanization: "",
duration: "4:43"
},
{
title: "Mambo Magic",
romanization: "",
duration: "6:04"
},
{
title: "I Remember You",
romanization: "",
duration: "5:29"
},
{
title: "Gascon Cocktail",
romanization: "",
duration: "3:43"
},
{
title: "Ready To Fly",
romanization: "",
duration: "7:00"
},
{
title: "April Wave",
romanization: "",
duration: "4:01"
},
]
)
CreateAlbumWithTracks({
title: "Brasilian Skies",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1978",
description: "",
flavor: "Fusion, Latin"
},
[{
title: "Beleza Pula",
romanization: "",
duration: "7:58"
},
{
title: "Brasilian Skies",
romanization: "",
duration: "5:57"
},
{
title: "Nights",
romanization: "",
duration: "4:57"
},
{
title: "I Remember Clifford",
romanization: "",
duration: "5:28"
},
{
title: "Star Wars Samba",
romanization: "",
duration: "3:49"
},
{
title: "Disco B",
romanization: "",
duration: "6:43"
},
{
title: "Funky Holo Holo Bird",
romanization: "",
duration: "6:18"
},
{
title: "伊豆甘夏納豆売り",
romanization: "",
duration: "6:51"
},
]
)
CreateAlbumWithTracks({
title: "All Of Me",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1979",
description: "",
flavor: "Fusion, Latin, Compilation"
},
[{
title: "Oh! Tengo Suerte",
romanization: "",
duration: "4:12"
},
{
title: "Tokyo Reggy",
romanization: "",
duration: "4:20"
},
{
title: "Sweet Agnes",
romanization: "",
duration: "4:39"
},
{
title: "Akogareno Seychelles Shoto",
romanization: "",
duration: "6:07"
},
{
title: "I Remember You",
romanization: "",
duration: "5:28"
},
{
title: "Izu Amanatsu Natto Uri",
romanization: "",
duration: "6:49"
},
{
title: "Tropic Birds",
romanization: "",
duration: "8:51"
},
{
title: "Brasilian Skies",
romanization: "",
duration: "5:52"
},
{
title: "Mambo No. 5",
romanization: "",
duration: "3:58"
},
{
title: "E.S.P.",
romanization: "",
duration: "4:10"
},
{
title: "Star Wars Samba",
romanization: "",
duration: "3:45"
},
{
title: "Sexy Dance",
romanization: "",
duration: "5:49"
},
{
title: "Malibu",
romanization: "",
duration: "6:13"
},
{
title: "Ready To Fly",
romanization: "",
duration: "6:55"
},
]
)
CreateAlbumWithTracks({
title: "Bacco Cha Cha Me",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1979",
description: "",
flavor: "Rock"
},
[{
title: "High Ace",
romanization: "",
duration: "3:18"
},
{
title: "Tokyo Lady",
romanization: "",
duration: "4:32"
},
{
title: "Cha Cha Me",
romanization: "",
duration: "5:06"
},
{
title: "Seventeen And Blue",
romanization: "",
duration: "8:25"
},
{
title: "Gettin' Lost Down On 8th Street",
romanization: "",
duration: "4:24"
},
{
title: "Just Another Boy In The Hand",
romanization: "",
duration: "6:09"
},
{
title: "Kid Kind",
romanization: "",
duration: "5:08"
},
{
title: "Stand By Me",
romanization: "",
duration: "3:50"
},
]
)
CreateAlbumWithTracks({
title: "Jolly Jive",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1979",
description: "",
flavor: "Fusion"
},
[{
title: "Blue Lagoon",
romanization: "",
duration: "5:05"
},
{
title: "Radio Rio",
romanization: "",
duration: "5:06"
},
{
title: "Explosion",
romanization: "",
duration: "2:26"
},
{
title: "珊瑚礁の妖精",
romanization: "",
duration: "4:11"
},
{
title: "Taj Mahal",
romanization: "",
duration: "5:08"
},
{
title: "Bamboo Vender",
romanization: "",
duration: "3:30"
},
{
title: "パラレル・ターン",
romanization: "",
duration: "3:53"
},
{
title: "Rainy Day Blue",
romanization: "",
duration: "4:05"
},
]
)
CreateAlbumWithTracks({
title: "Alone",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1980",
description: "",
flavor: "Fusion"
},
[{
title: "Speed Of Love",
romanization: "",
duration: "5:17"
},
{
title: "Feedback's Feel",
romanization: "",
duration: "5:51"
},
{
title: "Alone",
romanization: "",
duration: "5:41"
},
{
title: "The Night Delay",
romanization: "",
duration: "6:18"
},
{
title: "She's Rain",
romanization: "",
duration: "6:21"
},
{
title: "リオの夢",
romanization: "",
duration: "7:36"
},
{
title: "はいやぁ～っ!",
romanization: "",
duration: "4:24"
},
{
title: "Penguin Dancer",
romanization: "",
duration: "5:15"
},
]
)
CreateAlbumWithTracks({
title: "The Rainbow Goblins",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1981",
description: "",
flavor: "Fusion"
},
[{
title: "Prologue",
romanization: "",
duration: "3:15"
},
{
title: "Once Upon A Song",
romanization: "",
duration: "5:09"
},
{
title: "Seven Goblins",
romanization: "",
duration: "3:11"
},
{
title: "The Sunset Valley",
romanization: "",
duration: "4:19"
},
{
title: "The Moon Rose",
romanization: "",
duration: "5:37"
},
{
title: "Soon",
romanization: "",
duration: "6:25"
},
{
title: "Magical Night Light",
romanization: "",
duration: "0:33"
},
{
title: "Rainbow Paradise",
romanization: "",
duration: "6:21"
},
{
title: "Thunderstorm",
romanization: "",
duration: "3:11"
},
{
title: "Rising Arch",
romanization: "",
duration: "4:48"
},
{
title: "Just Chuckle",
romanization: "",
duration: "3:41"
},
{
title: "Rainbow Was Reborn",
romanization: "",
duration: "5:55"
},
{
title: "Plumed Bird",
romanization: "",
duration: "7:32"
},
{
title: "You Can Never Come To This Place",
romanization: "",
duration: "8:03"
},
]
)
CreateAlbumWithTracks({
title: "Ocean Breeze",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1982",
description: "",
flavor: "Fusion, Compilation"
},
[{
title: "Medley",
romanization: "",
duration: "7:42"
},
{
title: "Plastic Tears",
romanization: "",
duration: "5:09"
},
{
title: "Thunder Storm",
romanization: "",
duration: "5:09"
},
{
title: "Soon",
romanization: "",
duration: "6:13"
},
{
title: "Finger Dancin'",
romanization: "",
duration: "4:06"
},
{
title: "Heartache",
romanization: "",
duration: "5:41"
},
{
title: "Tropic Birds",
romanization: "",
duration: "6:32"
},
]
)
CreateAlbumWithTracks({
title: "Can I Sing?",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1983",
description: "",
flavor: "Fusion"
},
[{
title: "Tokyo...Singin' In The City",
romanization: "",
duration: "3:19"
},
{
title: "我ら星の子",
romanization: "",
duration: "3:39"
},
{
title: "Sail On Fire",
romanization: "",
duration: "4:24"
},
{
title: "Straight From Your Heart",
romanization: "",
duration: "3:42"
},
{
title: "Jumping Take Off",
romanization: "",
duration: "4:16"
},
{
title: "Santigo Bay Rendez-vous",
romanization: "",
duration: "4:26"
},
{
title: "Funk 'n' Roll Train",
romanization: "",
duration: "2:53"
},
{
title: "Cry Baby Cry",
romanization: "",
duration: "4:19"
},
{
title: "Noon",
romanization: "",
duration: "3:07"
},
{
title: "Can I Sing...For You",
romanization: "",
duration: "4:36"
},
]
)
CreateAlbumWithTracks({
title: "Saudade",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1983",
description: "",
flavor: "Fusion"
},
[{
title: "A Fair Wind",
romanization: "",
duration: "4:33"
},
{
title: "Saudade",
romanization: "",
duration: "3:43"
},
{
title: "Eona",
romanization: "",
duration: "5:37"
},
{
title: "Breakin' Loose",
romanization: "",
duration: "4:50"
},
{
title: "Ride'em High",
romanization: "",
duration: "3:51"
},
{
title: "Chill Me Out",
romanization: "",
duration: "4:35"
},
{
title: "New York Strut",
romanization: "",
duration: "5:37"
},
{
title: "The Forest of My Heart",
romanization: "",
duration: "4:53"
},
{
title: "Manifestation",
romanization: "",
duration: "6:08"
},
]
)
CreateAlbumWithTracks({
title: "夏・全・開",
romanization: "Open all Summer",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1983",
description: "",
flavor: "Fusion"
},
[{
title: "ようこそ、夏の王国へ",
romanization: "",
duration: "4:02"
},
{
title: "Paradizzy",
romanization: "",
duration: "2:53"
},
{
title: "Eyelands",
romanization: "",
duration: "3:55"
},
{
title: "Cuban Heels",
romanization: "",
duration: "4:24"
},
{
title: "大航海時代",
romanization: "",
duration: "5:18"
},
{
title: "Dancing To Cat Guitar",
romanization: "",
duration: "3:57"
},
{
title: "Summertime Blues",
romanization: "",
duration: "4:37"
},
{
title: "Return Ace",
romanization: "",
duration: "4:21"
},
{
title: "Neptune",
romanization: "",
duration: "5:08"
},
{
title: "Oyasumi",
romanization: "",
duration: "1:52"
},
]
)
CreateAlbumWithTracks({
title: "Traumatic",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1985",
description: "",
flavor: "Fusion"
},
[{
title: "Teaser",
romanization: "",
duration: "4:53"
},
{
title: "China",
romanization: "",
duration: "5:12"
},
{
title: "Line Is Busy",
romanization: "",
duration: "5:04"
},
{
title: "渚モデラート",
romanization: "",
duration: "4:41"
},
{
title: "Traumatic",
romanization: "",
duration: "4:23"
},
{
title: "Jackie's Trail",
romanization: "",
duration: "4:25"
},
{
title: "Chase",
romanization: "",
duration: "4:13"
},
{
title: "Struttin' on Broadway",
romanization: "",
duration: "3:02"
},
{
title: "Lagoon Music",
romanization: "",
duration: "4:57"
},
]
)
CreateAlbumWithTracks({
title: "Jungle Jane",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1986",
description: "",
flavor: "Fusion"
},
[{
title: "Jungle Jane",
romanization: "",
duration: "5:41"
},
{
title: "Exotica",
romanization: "",
duration: "3:58"
},
{
title: "Warm summer woman",
romanization: "",
duration: "3:35"
},
{
title: "Shake it",
romanization: "",
duration: "5:11"
},
{
title: "Illusion",
romanization: "",
duration: "4:59"
},
{
title: "Sonna Bahama",
romanization: "",
duration: "4:56"
},
{
title: "Bay street fix",
romanization: "",
duration: "5:36"
},
{
title: "When you're near me",
romanization: "",
duration: "5:44"
},
{
title: "Ra-ku-da",
romanization: "",
duration: "5:29"
},
]
)
CreateAlbumWithTracks({
title: "Hot Pepper",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1988",
description: "",
flavor: "Fusion"
},
[{
title: "Positive Touch",
romanization: "",
duration: "4:01"
},
{
title: "Hold On",
romanization: "",
duration: "4:20"
},
{
title: "Godzilla Dream",
romanization: "",
duration: "5:16"
},
{
title: "Shady Lady",
romanization: "",
duration: "4:42"
},
{
title: "Turn It Up",
romanization: "",
duration: "4:16"
},
{
title: "Pimienta (Hot Pepper)",
romanization: "",
duration: "3:45"
},
{
title: "Biscayne Blue",
romanization: "",
duration: "4:28"
},
{
title: "Heart Beat",
romanization: "",
duration: "4:33"
},
{
title: "You're Everything I See",
romanization: "",
duration: "3:17"
},
]
)
CreateAlbumWithTracks({
title: "Gaps!",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1989",
description: "",
flavor: "Fusion"
},
[{
title: "The Party's Just Begun",
romanization: "",
duration: "3:51"
},
{
title: "Tell It Like It Is",
romanization: "",
duration: "4:24"
},
{
title: "Out Of Touch",
romanization: "",
duration: "4:23"
},
{
title: "Mesa Boogie",
romanization: "",
duration: "3:27"
},
{
title: "Colada",
romanization: "",
duration: "4:54"
},
{
title: "Give It Up",
romanization: "",
duration: "4:41"
},
{
title: "City Is A Jungle",
romanization: "",
duration: "3:36"
},
{
title: "Say Scratch",
romanization: "",
duration: "3:53"
},
{
title: "So Excited",
romanization: "",
duration: "4:12"
},
{
title: "Suite Keys",
romanization: "",
duration: "6:14"
},
]
)
CreateAlbumWithTracks({
title: "The Party's Just Begun",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1989",
description: "",
flavor: "Fusion, Compilation"
},
[{
title: "Prologue (City Is A Jungle)",
romanization: "",
duration: "1:45"
},
{
title: "The Party's Just Begun",
romanization: "",
duration: "3:58"
},
{
title: "Say Scratch",
romanization: "",
duration: "3:45"
},
{
title: "タイムマシ-ンにおねがい",
romanization: "",
duration: "4:13"
},
{
title: "Mesa Boogie",
romanization: "",
duration: "3:53"
},
{
title: "Tell It Like It Is",
romanization: "",
duration: "4:16"
},
{
title: "Midi Guitar",
romanization: "",
duration: "2:08"
},
{
title: "Shake It",
romanization: "",
duration: "5:18"
},
{
title: "Turn It Up",
romanization: "",
duration: "4:20"
},
{
title: "Bad Chicken",
romanization: "",
duration: "4:40"
},
{
title: "Nagisa Moderato",
romanization: "",
duration: "8:18"
},
{
title: "Out Of Touch",
romanization: "",
duration: "5:09"
},
{
title: "Give It Up",
romanization: "",
duration: "4:58"
},
{
title: "伊豆甘夏納豆売り / 珊瑚礁の妖精",
romanization: "",
duration: "1:55"
},
{
title: "黒船",
romanization: "",
duration: "3:31"
},
{
title: "Blue Lagoon '89",
romanization: "",
duration: "5:25"
},
]
)
CreateAlbumWithTracks({
title: "One Night Gig",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1991",
description: "",
flavor: "Fusion, Live"
},
[{
title: "Shake it",
romanization: "",
duration: "8:29"
},
{
title: "Ready to fly",
romanization: "",
duration: "10:05"
},
{
title: "Nagisa Moderato",
romanization: "",
duration: "8:01"
},
{
title: "Blue lagoon",
romanization: "",
duration: "5:26"
},
{
title: "Listen to me",
romanization: "",
duration: "6:11"
},
{
title: "Give me a chance",
romanization: "",
duration: "4:24"
},
{
title: "One more night",
romanization: "",
duration: "7:49"
},
{
title: "Voyage",
romanization: "",
duration: "6:41"
},
{
title: "Godzilla dream",
romanization: "",
duration: "6:22"
},
{
title: "Say you're my baby",
romanization: "",
duration: "5:16"
},
{
title: "Dancin' In Jamaica",
romanization: "",
duration: "4:45"
},
]
)
CreateAlbumWithTracks({
title: "Aquaplanet",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1993",
description: "",
flavor: "Fusion"
},
[{
title: "Prologue ~Why?~",
romanization: "",
duration: "1:13"
},
{
title: "Aquaplanet",
romanization: "",
duration: "5:27"
},
{
title: "Blue Stripe",
romanization: "",
duration: "4:49"
},
{
title: "Napoleon Funk",
romanization: "",
duration: "4:17"
},
{
title: "Europe 哀愁のヨーロッパ",
romanization: "",
duration: "4:32"
},
{
title: "Soldierfish",
romanization: "",
duration: "5:07"
},
{
title: "夢色",
romanization: "",
duration: "4:41"
},
{
title: "Hawaiian Wedding Song",
romanization: "",
duration: "4:44"
},
{
title: "Triggerfish",
romanization: "",
duration: "4:25"
},
{
title: "Poison",
romanization: "",
duration: "4:40"
},
{
title: "The Last Fish",
romanization: "",
duration: "5:10"
},
{
title: "Epilogue",
romanization: "",
duration: "2:40"
},
]
)
CreateAlbumWithTracks({
title: "The Lover",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "1993",
description: "",
flavor: "Fusion"
},
[{
title: "Nagisa '91",
romanization: "",
duration: "5:12"
},
{
title: "China",
romanization: "",
duration: "4:28"
},
{
title: "Alone",
romanization: "",
duration: "6:01"
},
{
title: "Voyage",
romanization: "",
duration: "6:05"
},
{
title: "Shake It More",
romanization: "",
duration: "5:23"
},
{
title: "Shady Lady",
romanization: "",
duration: "5:10"
},
{
title: "Dancin' In Jamaica",
romanization: "",
duration: "4:15"
},
{
title: "Once In A Blue Moon",
romanization: "",
duration: "5:30"
},
{
title: "Tell It Like It Is",
romanization: "",
duration: "4:25"
},
{
title: "Cause We've Ended As Lovers",
romanization: "",
duration: "6:14"
},
{
title: "Illusion",
romanization: "",
duration: "5:00"
},
{
title: "My Love",
romanization: "",
duration: "4:33"
},
{
title: "Suite Keys",
romanization: "",
duration: "6:14"
},
]
)
CreateAlbumWithTracks({
title: "The Man With The Guitar",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "2001",
description: "",
flavor: "Fusion, Compilation"
},
[{
title: "Shake It",
romanization: "",
duration: "5:09"
},
{
title: "Nagisa Moderato",
romanization: "",
duration: "6:11"
},
{
title: "Saudade",
romanization: "",
duration: "4:27"
},
{
title: "Ready To Fly",
romanization: "",
duration: "8:50"
},
{
title: "Finger Dancin'",
romanization: "",
duration: "5:29"
},
{
title: "An Insatiable High",
romanization: "",
duration: "8:28"
},
{
title: "One More Night",
romanization: "",
duration: "5:31"
},
{
title: "Blue Lagoon",
romanization: "",
duration: "5:11"
},
]
)
CreateAlbumWithTracks({
title: "The Brilliant Best",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "2004",
description: "",
flavor: "Fusion, Compilation"
},
[{
title: "Blue Lagoon",
romanization: "",
duration: "5:08"
},
{
title: "Ready To Fly",
romanization: "",
duration: "6:57"
},
{
title: "Nagisa Moderato",
romanization: "",
duration: "4:40"
},
{
title: "Alone",
romanization: "",
duration: "6:02"
},
{
title: "Saudade",
romanization: "",
duration: "3:42"
},
{
title: "Shake It",
romanization: "",
duration: "5:13"
},
{
title: "The Party's Just Begun",
romanization: "",
duration: "3:50"
},
{
title: "My Love",
romanization: "",
duration: "4:33"
},
{
title: "Oh! Tengo Suerte",
romanization: "",
duration: "4:34"
},
{
title: "Blue Stripe",
romanization: "",
duration: "4:49"
},
{
title: "China",
romanization: "",
duration: "5:12"
},
{
title: "Guitar Wonder",
romanization: "",
duration: "4:09"
},
{
title: "Woodchopper's Ball",
romanization: "",
duration: "4:12"
},
{
title: "Into The Sky (Album Version)",
romanization: "",
duration: "5:44"
},
{
title: "Jungle Jane",
romanization: "",
duration: "5:41"
},
]
)
CreateAlbumWithTracks({
title: "Natsudo",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "2009",
description: "",
flavor: "Fusion"
},
[{
title: "甘夏時間",
romanization: "",
duration: "5:49"
},
{
title: "はじくぜ！ Baby",
romanization: "",
duration: "5:51"
},
{
title: "哀愁の宇宙人",
romanization: "",
duration: "5:00"
},
{
title: "一番好きな海の色",
romanization: "",
duration: "5:08"
},
{
title: "空飛ぶ夢",
romanization: "",
duration: "5:00"
},
{
title: "夏道",
romanization: "",
duration: "5:05"
},
{
title: "Blues Birds",
romanization: "",
duration: "4:44"
},
{
title: "Noguhissos",
romanization: "",
duration: "5:38"
},
{
title: "Talk Lesson",
romanization: "",
duration: "7:53"
},
]
)
CreateAlbumWithTracks({
title: "Karuizawa Daydream",
romanization: "",
romaji_artist: "Masayoshi Takanaka",
japanese_artist: "虹伝説",
year: "2010",
description: "",
flavor: "Fusion"
},
[{
title: "風がいいよね",
romanization: "",
duration: "5:45"
},
{
title: "Tono",
romanization: "",
duration: "4:58"
},
{
title: "月と金星",
romanization: "",
duration: "4:37"
},
{
title: "Winding Road",
romanization: "",
duration: "4:28"
},
{
title: "卒業 ~蜃気楼の山へ~",
romanization: "",
duration: "5:18"
},
{
title: "Blue Lagoon (Surf 2010 Version)",
romanization: "",
duration: "4:23"
},
{
title: "Mystery の小經",
romanization: "",
duration: "5:38"
},
{
title: "キツツキ",
romanization: "",
duration: "5:38"
},
{
title: "BBQ",
romanization: "",
duration: "4:32"
},
{
title: "Lagoon Daydream",
romanization: "",
duration: "5:44"
},
])


#New batch (Mariya Takeuchi)


CreateAlbumWithTracks({
title: "Love Songs",
romanization: "",
romaji_artist: "Mariya Takeuchi",
japanese_artist: "竹内まりや",
year: "1980",
description: "",
flavor: "Ballad"
},
[{
title: "Fly Away",
romanization: "",
duration: "3:20"
},
{
title: "さよならの夜明け",
romanization: "",
duration: "4:10"
},
{
title: "磁気岚",
romanization: "",
duration: "4:06"
},
{
title: "象牙海岸",
romanization: "",
duration: "4:07"
},
{
title: "五线纸",
romanization: "",
duration: "3:31"
},
{
title: "Lonely Wind",
romanization: "",
duration: "4:13"
},
{
title: "恋の終わりに",
romanization: "",
duration: "3:33"
},
{
title: "待っているわ",
romanization: "",
duration: "3:39"
},
{
title: "September",
romanization: "",
duration: "4:39"
},
{
title: "不思议なピーチパイ",
romanization: "",
duration: "4:20"
},
{
title: " Little Lullaby",
romanization: "",
duration: "2:19"
},
]
)
CreateAlbumWithTracks({
title: "Miss M",
romanization: "",
romaji_artist: "Mariya Takeuchi",
japanese_artist: "竹内まりや",
year: "1980",
description: "",
flavor: "Soul"
},
[{
title: "Sweetest Music",
romanization: "",
duration: "3:13"
},
{
title: "Every Night",
romanization: "",
duration: "3:32"
},
{
title: "Morning Glory",
romanization: "",
duration: "3:24"
},
{
title: "Secret Love",
romanization: "",
duration: "3:47"
},
{
title: "Heart To Heart",
romanization: "",
duration: "4:07"
},
{
title: "二人のバカンス",
romanization: "",
duration: "4:17"
},
{
title: "遠く離れて (When You're So Far Away)",
romanization: "",
duration: "4:31"
},
{
title: "雨のドライヴ",
romanization: "",
duration: "4:20"
},
{
title: "Farewell Call",
romanization: "",
duration: "5:58"
},
]
)
CreateAlbumWithTracks({
title: "Variety",
romanization: "",
romaji_artist: "Mariya Takeuchi",
japanese_artist: "竹内まりや",
year: "1984",
description: "",
flavor: "Ballad"
},
[{
title: "もう一度",
romanization: "",
duration: "4:10"
},
{
title: "Plastic Love",
romanization: "",
duration: "4:54"
},
{
title: "本気でオンリーユー (Let’s Get Married)",
romanization: "",
duration: "3:55"
},
{
title: "One Night Stand",
romanization: "",
duration: "4:01"
},
{
title: "Broken Heart",
romanization: "",
duration: "3:59"
},
{
title: "アンフィシアターの夜",
romanization: "",
duration: "3:36"
},
{
title: "とどかぬ想い",
romanization: "",
duration: "3:37"
},
{
title: "マージービートで唄わせて",
romanization: "",
duration: "3:20"
},
{
title: "水とあなたと太陽と",
romanization: "",
duration: "3:31"
},
{
title: "ふたりはステディ",
romanization: "",
duration: "3:30"
},
{
title: "シェットランドに頬をうずめて",
romanization: "",
duration: "3:49"
},
{
title: "赤のエナメル [Previously Unreleased]",
romanization: "",
duration: "2:55"
},
]
)

CreateAlbumWithTracks({
title: "Request",
romanization: "",
romaji_artist: "Mariya Takeuchi",
japanese_artist: "竹内まりや",
year: "1987",
description: "",
flavor: "Ballad"
},
[{
title: "恋の嵐",
romanization: "",
duration: "4:37"
},
{
title: "OH NO，OH YES!",
romanization: "",
duration: "5:19"
},
{
title: "けんかをやめて",
romanization: "",
duration: "4:45"
},
{
title: "消息",
romanization: "",
duration: "3:50"
},
{
title: "元気を出して",
romanization: "",
duration: "4:48"
},
{
title: "駅",
romanization: "",
duration: "5:01"
},
{
title: "テコのテーマ",
romanization: "",
duration: "4:24"
},
{
title: "色・ホワイトブレンド",
romanization: "",
duration: "4:04"
},
{
title: "夢の続き",
romanization: "",
duration: "5:22"
},
{
title: "時空の旅人",
romanization: "",
duration: "4:26"
},
]
)
CreateAlbumWithTracks({
title: "Quiet Life",
romanization: "",
romaji_artist: "Mariya Takeuchi",
japanese_artist: "竹内まりや",
year: "1992",
description: "",
flavor: "Ballad"
},
[{
title: "家に帰ろう（マイ・スイート・ホーム）",
romanization: "",
duration: "4:53"
},
{
title: "マンハッタン・キス",
romanization: "",
duration: "4:44"
},
{
title: "FOREVER FRIENDS",
romanization: "",
duration: "4:23"
},
{
title: "COOL DOWN",
romanization: "",
duration: "4:45"
},
{
title: "AFTER YEARS",
romanization: "",
duration: "3:32"
},
{
title: "THE CHRISTMAS SONG",
romanization: "",
duration: "3:46"
},
{
title: "告白",
romanization: "",
duration: "4:56"
},
{
title: "コンビニ・ラヴァー",
romanization: "",
duration: "3:56"
},
{
title: "ロンサム・シーズン",
romanization: "",
duration: "4:20"
},
{
title: "幸せの探し方",
romanization: "",
duration: "3:53"
},
{
title: "シングル・アゲイン",
romanization: "",
duration: "4:24"
},
{
title: "QUIET LIFE",
romanization: "",
duration: "5:02"
},
]
)
CreateAlbumWithTracks({
title: "Bon Appetit!",
romanization: "",
romaji_artist: "Mariya Takeuchi",
japanese_artist: "竹内まりや",
year: "2001",
description: "",
flavor: "Ballad"
},
[{
title: "Everyday Is A Special Day",
romanization: "",
duration: "4:56"
},
{
title: "Midnight Nightingale",
romanization: "",
duration: "5:18"
},
{
title: "Still Seventeen In My Heart",
romanization: "",
duration: "4:24"
},
{
title: "Bewildered (Tomadoi)",
romanization: "",
duration: "5:00"
},
{
title: "Looking For My Soulmate",
romanization: "",
duration: "4:22"
},
{
title: "Nostalgia",
romanization: "",
duration: "4:48"
},
{
title: "Dream Seeker",
romanization: "",
duration: "2:58"
},
{
title: "Camouflage",
romanization: "",
duration: "5:29"
},
{
title: "Winter Lovers",
romanization: "",
duration: "5:07"
},
{
title: "Happy Happy Holidays",
romanization: "",
duration: "4:38"
},
{
title: "Sigh Of An Angel",
romanization: "",
duration: "5:14"
},
{
title: "A Cup Of Tea",
romanization: "",
duration: "2:24"
},
]
)
CreateAlbumWithTracks({
title: "Denim",
romanization: "",
romaji_artist: "Mariya Takeuchi",
japanese_artist: "竹内まりや",
year: "2007",
description: "",
flavor: "Ballad"
},
[{
title: "君住む街角(On The Street Where You Live)",
romanization: "",
duration: "2:53"
},
{
title: "スロー・ラヴ",
romanization: "",
duration: "4:37"
},
{
title: "返信",
romanization: "",
duration: "4:44"
},
{
title: "みんなひとり",
romanization: "",
duration: "4:29"
},
{
title: "シンクロニシティ(素敵な偶然)",
romanization: "",
duration: "5:15"
},
{
title: "哀しい恋人",
romanization: "",
duration: "4:56"
},
{
title: "Never Cry Butterfly",
romanization: "",
duration: "4:58"
},
{
title: "ラス���・デイト",
romanization: "",
duration: "4:37"
},
{
title: "クリスマスは一緒に",
romanization: "",
duration: "5:43"
},
{
title: "終楽章",
romanization: "",
duration: "4:42"
},
{
title: "明日のない恋",
romanization: "",
duration: "3:47"
},
{
title: "人生の扉",
romanization: "",
duration: "5:48"
},
{
title: "Hey! Baby",
romanization: "",
duration: "3:48"
},
{
title: "夜景",
romanization: "",
duration: "4:04"
},
{
title: "約束",
romanization: "",
duration: "3:54"
},
{
title: "ミラクル・ラブ",
romanization: "",
duration: "4:15"
},
{
title: "真冬のデイト",
romanization: "",
duration: "3:40"
},
{
title: "トライアングル",
romanization: "",
duration: "3:19"
},
]
)
CreateAlbumWithTracks({
title: "Trad",
romanization: "",
romaji_artist: "Mariya Takeuchi",
japanese_artist: "竹内まりや",
year: "2014",
description: "",
flavor: "Ballad"
},
[{
title: "縁の糸",
romanization: "",
duration: "4:34"
},
{
title: "それぞれの夜",
romanization: "",
duration: "4:00"
},
{
title: "アロハ式恋愛指南",
romanization: "",
duration: "4:40"
},
{
title: "ウイスキーが、お好きでしょ",
romanization: "",
duration: "3:53"
},
{
title: "Dear Angie ~あなたは負けない",
romanization: "",
duration: "3:19"
},
{
title: "最後のタンゴ",
romanization: "",
duration: "3:40"
},
{
title: "輝く女性よ!",
romanization: "",
duration: "4:38"
},
{
title: "夏のモンタージュ",
romanization: "",
duration: "4:17"
},
{
title: "リユニオン",
romanization: "",
duration: "4:41"
},
{
title: "特別な恋人",
romanization: "",
duration: "4:54"
},
{
title: "たそがれダイアリー",
romanization: "",
duration: "4:14"
},
{
title: "深秋",
romanization: "",
duration: "4:02"
},
{
title: "静かな伝説",
romanization: "",
duration: "5:00"
},
{
title: "Your Eyes",
romanization: "",
duration: "3:11"
},
{
title: "いのちの歌",
romanization: "",
duration: "4:43"
},
])


#New batch (Anri)


CreateAlbumWithTracks({
title: "Apricot Jam",
romanization: "",
romaji_artist: "Anri",
japanese_artist: "杏里",
year: "1978",
description: "",
flavor: "Soul, Funk"
},
[{
title: "オリビアを?きながら",
romanization: "",
duration: "4:39"
},
{
title: "ラプソディ?",
romanization: "",
duration: "4:00"
},
{
title: "そぞろ寒",
romanization: "",
duration: "4:01"
},
{
title: "西日うすれて",
romanization: "",
duration: "3:41"
},
{
title: "So Long",
romanization: "",
duration: "3:20"
},
{
title: "Flying 午前10時?",
romanization: "",
duration: "5:20"
},
{
title: "中?人形",
romanization: "",
duration: "3:26"
},
{
title: "キ?ワ?ドを探せ",
romanization: "",
duration: "3:12"
},
{
title: "Blue City",
romanization: "",
duration: "3:37"
},
{
title: "フェイド?アウト",
romanization: "",
duration: "4:24"
},
]
)
CreateAlbumWithTracks({
title: "Feelin'",
romanization: "",
romaji_artist: "Anri",
japanese_artist: "杏里",
year: "1979",
description: "",
flavor: "Funk"
},
[{
title: "コルトバの踊り子",
romanization: "",
duration: "3:40"
},
{
title: "九月の砂",
romanization: "",
duration: "4:41"
},
{
title: "ブルー・ムーン",
romanization: "",
duration: "3:39"
},
{
title: "スリップアウェイ",
romanization: "",
duration: "4:26"
},
{
title: "マホガニータウン",
romanization: "",
duration: "4:05"
},
{
title: "地中海ドリーム",
romanization: "",
duration: "3:11"
},
{
title: "モーニング・フライト",
romanization: "",
duration: "4:09"
},
{
title: "悲しみは窓の向こう",
romanization: "",
duration: "2:54"
},
{
title: "ときめき",
romanization: "",
duration: "3:47"
},
{
title: "めぐり来る季節のように",
romanization: "",
duration: "3:57"
},
{
title: "海辺から",
romanization: "",
duration: "4:20"
},
]
)
CreateAlbumWithTracks({
title: "Heaven Beach",
romanization: "",
romaji_artist: "Anri",
japanese_artist: "杏里",
year: "1982",
description: "",
flavor: "Funk"
},
[{
title: "二番目のaffair",
romanization: "",
duration: "4:40"
},
{
title: "Last Summer Whisper",
romanization: "",
duration: "4:59"
},
{
title: "Lonely Driving",
romanization: "",
duration: "3:21"
},
{
title: "Resolution",
romanization: "",
duration: "4:26"
},
{
title: "Fly By Day",
romanization: "",
duration: "4:33"
},
{
title: "Flashback Memories",
romanization: "",
duration: "4:07"
},
{
title: "Honesty Man",
romanization: "",
duration: "4:08"
},
{
title: "Memorial Story",
romanization: "",
duration: "4:04"
},
{
title: "夏に背を向けて",
romanization: "",
duration: "4:22"
},
{
title: "Heaven Beach",
romanization: "",
duration: "6:01"
},
{
title: "Kaze No Naka De Loving You",
romanization: "",
duration: "4:16"
},
]
)
CreateAlbumWithTracks({
title: "Bi・Ki・Ni",
romanization: "",
romaji_artist: "Anri",
japanese_artist: "杏里",
year: "1983",
description: "",
flavor: "Funk, Disco"
},
[{
title: "Good Bye Boogie Dance",
romanization: "",
duration: "4:32"
},
{
title: "Dancin’ Blue",
romanization: "",
duration: "3:15"
},
{
title: "September Walkin’",
romanization: "",
duration: "3:51"
},
{
title: "Lady Sunshine",
romanization: "",
duration: "3:42"
},
{
title: "Yes I’m In Love",
romanization: "",
duration: "5:07"
},
{
title: "Surf City",
romanization: "",
duration: "4:22"
},
{
title: "Just Be Yourself",
romanization: "",
duration: "5:03"
},
{
title: "Beach Boy In My Heart",
romanization: "",
duration: "4:05"
},
{
title: "Summer Focus",
romanization: "",
duration: "3:16"
},
{
title: "Affection",
romanization: "",
duration: "4:34"
},
]
)
CreateAlbumWithTracks({
title: "Timely!!",
romanization: "",
romaji_artist: "Anri",
japanese_artist: "杏里",
year: "1983",
description: "",
flavor: "Funk, Disco"
},
[{
title: "Cat's Eye",
romanization: "",
duration: "3:09"
},
{
title: "Windy Summer",
romanization: "",
duration: "4:06"
},
{
title: "Stay By Me",
romanization: "",
duration: "3:37"
},
{
title: "A Hope From Sad Street",
romanization: "",
duration: "4:19"
},
{
title: "You Are Not Alone",
romanization: "",
duration: "4:03"
},
{
title: "悲しみがとまらない",
romanization: "",
duration: "4:23"
},
{
title: "Shyness Boy",
romanization: "",
duration: "3:16"
},
{
title: "Lost Love in the Rain",
romanization: "",
duration: "4:19"
},
{
title: "Driving My Love",
romanization: "",
duration: "4:51"
},
{
title: "Good-night for You",
romanization: "",
duration: "5:20"
},
{
title: "Remember Summer Days",
romanization: "",
duration: "4:55"
},
]
)
CreateAlbumWithTracks({
title: "Coool",
romanization: "",
romaji_artist: "Anri",
japanese_artist: "杏里",
year: "1984",
description: "",
flavor: "Disco, Ballad"
},
[{
title: "Bring Me to the Dancenight? Gone with the Sadness",
romanization: "",
duration: "6:22"
},
{
title: "ままにReflection",
romanization: "",
duration: "3:56"
},
{
title: "I Can't ever Change Your Love for Me",
romanization: "",
duration: "4:35"
},
{
title: "Silly City Girl",
romanization: "",
duration: "3:00"
},
{
title: "Morning Highway",
romanization: "",
duration: "3:56"
},
{
title: "Surprise of Summer",
romanization: "",
duration: "4:14"
},
{
title: "Flashin' Night",
romanization: "",
duration: "3:41"
},
{
title: "水銀燈",
romanization: "",
duration: "5:41"
},
{
title: "He's My Music",
romanization: "",
duration: "3:13"
},
{
title: "Maui",
romanization: "",
duration: "3:21"
},
]
)
CreateAlbumWithTracks({
title: "Wave",
romanization: "",
romaji_artist: "Anri",
japanese_artist: "杏里",
year: "1985",
description: "",
flavor: "Funk, Disco"
},
[{
title: "City fiction",
romanization: "",
duration: "3:46"
},
{
title: "夜明けのSoldier",
romanization: "",
duration: "4:41"
},
{
title: "Into the Body",
romanization: "",
duration: "4:14"
},
{
title: "Long Island Beach",
romanization: "",
duration: "4:13"
},
{
title: "Wave",
romanization: "",
duration: "4:44"
},
{
title: "Take It",
romanization: "",
duration: "4:20"
},
{
title: "Loversnight",
romanization: "",
duration: "4:21"
},
{
title: "16(Sixteen)Beat",
romanization: "",
duration: "4:43"
},
{
title: "Oversea Call",
romanization: "",
duration: "4:22"
},
{
title: "瞳は永远の香り",
romanization: "",
duration: "4:25"
},
]
)
CreateAlbumWithTracks({
title: "哀しみの孔雀",
romanization: "Peacock of Sadness",
romaji_artist: "Anri",
japanese_artist: "杏里",
year: "1981",
description: "",
flavor: "Ballad, Folk"
},
[{
title: "異?の出?事",
romanization: "",
duration: "3:30"
},
{
title: "エスプレッソで眠れない",
romanization: "",
duration: "2:53"
},
{
title: "Face Face Face",
romanization: "",
duration: "3:37"
},
{
title: "白いヨット",
romanization: "",
duration: "3:58"
},
{
title: "セシルカット",
romanization: "",
duration: "2:38"
},
{
title: "リビエラからの手紙",
romanization: "",
duration: "2:35"
},
{
title: "ヘッドライト",
romanization: "",
duration: "4:09"
},
{
title: "シルエット　オブロマンス",
romanization: "",
duration: "2:49"
},
{
title: "Am I Afraid?",
romanization: "",
duration: "3:19"
},
{
title: "いつの日か Happy End",
romanization: "",
duration: "3:20"
},
{
title: "さよならは夜明けの夢に",
romanization: "",
duration: "3:30"
},
{
title: "哀しみの孔雀",
romanization: "",
duration: "3:46"
},
])


#New batch (Terao, Narumin, Kaoru, Takako, Makoto Matsushita)


CreateAlbumWithTracks({
title: "Reflections",
romanization: "",
romaji_artist: "Akira Terao",
japanese_artist: "寺尾聰",
year: "1981",
description: "",
flavor: "Rock"
},
[{
title: "Habana Express",
romanization: "",
duration: "4:13"
},
{
title: "渚のカンパリ・ソーダ",
romanization: "Nagisa No Campari Soda",
duration: "4:31"
},
{
title: "喜望峰",
romanization: "Kiboho",
duration: "4:11"
},
{
title: "二季物語",
romanization: "Niki monogatari",
duration: "8:07"
},
{
title: "ルビーの指環",
romanization: "Ruby No Yubiwa",
duration: "4:17"
},
{
title: "Shadow City",
romanization: "",
duration: "4:23"
},
{
title: "予期せぬ出来事",
romanization: "Yokisenu Dekigoto",
duration: "4:19"
},
{
title: "ダイヤルM",
romanization: "Dial M",
duration: "3:48"
},
{
title: "北ウィング",
romanization: "Kita Wing",
duration: "4:51"
},
{
title: "出航",
romanization: "Sasurai",
duration: "4:05"
},
]
)
CreateAlbumWithTracks({
title: "Atmosphere",
romanization: "",
romaji_artist: "Akira Terao",
japanese_artist: "寺尾聰",
year: "1983",
description: "",
flavor: "Rock"
},
[{
title: "飛行少年",
romanization: "",
duration: "2:32"
},
{
title: "Long Distance Call",
romanization: "",
duration: "4:42"
},
{
title: "砂の迷路",
romanization: "",
duration: "7:00"
},
{
title: "まさか・Tokyo",
romanization: "",
duration: "4:08"
},
{
title: "砂の迷路",
romanization: "",
duration: "7:00"
},
{
title: "夏嵐",
romanization: "",
duration: "3:55"
},
{
title: "今夜でピリオド",
romanization: "",
duration: "4:38"
},
{
title: "回転扉",
romanization: "",
duration: "6:36"
},
{
title: "終着駅",
romanization: "",
duration: "4:45"
},
{
title: "Passing Summer",
romanization: "",
duration: "4:55"
},
]
)
CreateAlbumWithTracks({
title: "Thru Traffic",
romanization: "",
romaji_artist: "Narumin & Etsu",
japanese_artist: "東北新幹線",
year: "1982",
description: "",
flavor: "Funk"
},
[{
title: "Summer Touches You",
romanization: "",
duration: "4:37"
},
{
title: "Up And Down",
romanization: "",
duration: "4:40"
},
{
title: "心のままに",
romanization: "",
duration: "3:52"
},
{
title: "ストレンジ・ワイン",
romanization: "",
duration: "5:46"
},
{
title: "September Vallentine",
romanization: "",
duration: "5:04"
},
{
title: "月に寄りそって",
romanization: "",
duration: "5:20"
},
{
title: "Cloudy",
romanization: "",
duration: "4:35"
},
{
title: "Spell",
romanization: "",
duration: "4:35"
},
{
title: "ラスト・メッセージ",
romanization: "",
duration: "4:36"
},
]
)
CreateAlbumWithTracks({
title: "First Light",
romanization: "",
romaji_artist: "Makoto Matsushita",
japanese_artist: "松下誠",
year: "1982",
description: "",
flavor: "Jazz"
},
[{
title: "First Light",
romanization: "",
duration: "4:31"
},
{
title: "One Hot Love",
romanization: "",
duration: "4:18"
},
{
title: "Resort For Blue",
romanization: "",
duration: "1:23"
},
{
title: "September Rain",
romanization: "",
duration: "4:28"
},
{
title: "Lazy Night",
romanization: "",
duration: "4:47"
},
{
title: "This Is All I Have For You",
romanization: "",
duration: "5:05"
},
{
title: "I Know",
romanization: "",
duration: "1:58"
},
{
title: "Love Was Really Gone",
romanization: "",
duration: "5:46"
},
{
title: "Sunset",
romanization: "",
duration: "8:15"
},
]
)
CreateAlbumWithTracks({
title: "The Pressures And The Pleasures",
romanization: "",
romaji_artist: "Makoto Matsushita",
japanese_artist: "松下誠",
year: "1982",
description: "",
flavor: "Jazz"
},
[{
title: "The Pressures And The Pleasures",
romanization: "",
duration: "10:13"
},
{
title: "Business Man (Part 1)",
romanization: "",
duration: "3:46"
},
{
title: "The Bridge",
romanization: "",
duration: "3:20"
},
{
title: "Business Man (Part 2)",
romanization: "",
duration: "3:06"
},
{
title: "The Garden Of Walls",
romanization: "",
duration: "7:33"
},
{
title: "Carnaval",
romanization: "",
duration: "5:20"
},
{
title: "The Quiet Storm",
romanization: "",
duration: "2:06"
},
{
title: "Morning Blue",
romanization: "",
duration: "6:15"
},
]
)
CreateAlbumWithTracks({
title: "Quiet Skies",
romanization: "",
romaji_artist: "Makoto Matsushita",
japanese_artist: "松下誠",
year: "1983",
description: "",
flavor: "Jazz"
},
[{
title: "Sight of the Dawn",
romanization: "",
duration: "10:10"
},
{
title: "Views from Fire Mountain",
romanization: "",
duration: "5:01"
},
{
title: "Lucky Guy",
romanization: "",
duration: "6:24"
},
{
title: "Going Home",
romanization: "",
duration: "7:32"
},
{
title: "The Feather Heart",
romanization: "",
duration: "5:42"
},
{
title: "Cage of Dreams",
romanization: "",
duration: "6:34"
},
]
)
CreateAlbumWithTracks({
title: "Cologne",
romanization: "",
romaji_artist: "Kaoru Akimoto",
japanese_artist: "秋元薫",
year: "1986",
description: "",
flavor: "Ballad"
},
[{
title: "Beginning",
romanization: "",
duration: "0:56"
},
{
title: "ナルシスト",
romanization: "",
duration: "4:44"
},
{
title: "Dress Down",
romanization: "",
duration: "4:32"
},
{
title: "Two Call",
romanization: "",
duration: "4:05"
},
{
title: "夜が終る時",
romanization: "",
duration: "5:20"
},
{
title: "嘆きのPuzzle",
romanization: "",
duration: "3:45"
},
{
title: "我がままなハイヒール",
romanization: "",
duration: "5:03"
},
{
title: "今日はひとりきり",
romanization: "",
duration: "4:01"
},
{
title: "Love Letter",
romanization: "",
duration: "4:20"
},
{
title: "月夜（作詞",
romanization: "",
duration: "4:53"
},
]
)
CreateAlbumWithTracks({
title: "瞳に映して",
romanization: "In Your Eyes",
romaji_artist: "Kaoru Akimoto",
japanese_artist: "秋元薫",
year: "1991",
description: "",
flavor: "Ballad"
},
[{
title: "瞳に映して",
romanization: "",
duration: "4:40"
},
{
title: "さよならの吐息~Hold me tight",
romanization: "",
duration: "6:36"
},
]
)
CreateAlbumWithTracks({
title: "Love Trip",
romanization: "",
romaji_artist: "Takako Mamiya",
japanese_artist: "間宮貴子",
year: "1982",
description: "",
flavor: "Ballad"
},
[{
title: "Love Trip",
romanization: "",
duration: "3:48"
},
{
title: "チャイニーズ・レストラン",
romanization: "",
duration: "3:50"
},
{
title: "真夜中のジョーク",
romanization: "",
duration: "4:52"
},
{
title: "哀しみは夜の向こう",
romanization: "",
duration: "3:58"
},
{
title: "All Or Nothing",
romanization: "",
duration: "4:08"
},
{
title: "渚でダンス",
romanization: "",
duration: "4:16"
},
{
title: "One More Night",
romanization: "",
duration: "3:52"
},
{
title: "モーニング・フライト",
romanization: "",
duration: "4:07"
},
{
title: "たそがれは銀箔の…",
romanization: "",
duration: "4:23"
},
{
title: "What A Broken Heart Can Do",
romanization: "",
duration: "4:01"
},
])


#New batch (Tatsu)


CreateAlbumWithTracks({
title: "Jody",
romanization: "",
romaji_artist: "L.A. Unit",
japanese_artist: "",
year: "1990",
description: "",
flavor: "Cover, Tribute"
},
[{
title: "悲しみのJODY ~She Was Crying~",
romanization: "",
duration: "7:09"
},
{
title: "Get Back in Love",
romanization: "",
duration: "6:08"
},
{
title: "クリスマス・イブ",
romanization: "",
duration: "5:37"
},
{
title: "YOUR EYES",
romanization: "",
duration: "4:06"
},
{
title: "愛を描いて ~Let's Kiss the Sun~",
romanization: "",
duration: "5:30"
},
{
title: "Down Town",
romanization: "",
duration: "4:46"
},
{
title: "Loveland, Island",
romanization: "",
duration: "5:34"
},
{
title: "Ride on Time",
romanization: "",
duration: "5:37"
},
{
title: "高気圧ガール",
romanization: "",
duration: "4:31"
},
{
title: "潮騒 ~The Whispering Sea~",
romanization: "",
duration: "5:29"
},
]
)
CreateAlbumWithTracks({
title: "Artisan",
romanization: "",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "1991",
description: "",
flavor: "Funk"
},
[{
title: "アトムの子",
romanization: "",
duration: "4:26"
},
{
title: "さよなら夏の日",
romanization: "",
duration: "4:35"
},
{
title: "ターナーの汽罐車",
romanization: "",
duration: "4:33"
},
{
title: "片想い",
romanization: "",
duration: "4:39"
},
{
title: "Tokyo's a Lonely Town",
romanization: "",
duration: "2:40"
},
{
title: "飛遊人 -Human-",
romanization: "",
duration: "1:48"
},
{
title: "Splendor",
romanization: "",
duration: "5:24"
},
{
title: "Mighty Smile (魔法の微笑)",
romanization: "",
duration: "3:13"
},
{
title: '"Queen of Hype" Blues',
romanization: "",
duration: "5:14"
},
{
title: "Endless Game",
romanization: "",
duration: "4:10"
},
{
title: "Groovin'",
romanization: "",
duration: "3:20"
},
]
)
CreateAlbumWithTracks({
title: "Cheer up! The summer",
romanization: "",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "2016",
description: "",
flavor: "Single, Dreamy"
},
[{
title: "CHEER UP! THE SUMMER",
romanization: "",
duration: "4:19"
},
]
)
CreateAlbumWithTracks({
title: "Come Along 3",
romanization: "",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "2017",
description: "",
flavor: "Funk, Compilation"
},
[{
title: "Keoki la Molokai Kid 偉大なサーファー伝説?!",
romanization: "",
duration: "3:13"
},
{
title: "Cheer Up! The Summer",
romanization: "",
duration: "4:11"
},
{
title: "高気圧ガール",
romanization: "",
duration: "4:09"
},
{
title: "悲しみのJODY (She Was Crying)",
romanization: "",
duration: "3:38"
},
{
title: "踊ろよ、フィッシュ",
romanization: "",
duration: "5:12"
},
{
title: "I Love You... (Part 1)",
romanization: "",
duration: "2:32"
},
{
title: "さよなら夏の日",
romanization: "",
duration: "4:27"
},
{
title: "ドーナツ・ソング",
romanization: "",
duration: "4:58"
},
{
title: "僕らの夏の夢",
romanization: "",
duration: "4:58"
},
{
title: "The Theme from Big Wave",
romanization: "",
duration: "3:22"
},
{
title: "新・東京ラプソディー",
romanization: "",
duration: "5:06"
},
{
title: "JUVENILEのテーマ~瞳の中のRAINBOW~",
romanization: "",
duration: "4:47"
},
{
title: "Southbound #9",
romanization: "",
duration: "5:01"
},
]
)
CreateAlbumWithTracks({
title: "Cozy",
romanization: "",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "1998",
description: "",
flavor: "Dreamy, Funk"
},
[{
title: "氷のマニキュア",
romanization: "",
duration: "5:05"
},
{
title: "ヘロン",
romanization: "",
duration: "4:42"
},
{
title: "FRAGILE",
romanization: "",
duration: "5:28"
},
{
title: "DONUT SONG",
romanization: "",
duration: "4:22"
},
{
title: "月の光",
romanization: "",
duration: "5:35"
},
{
title: "群青の炎 -Ultramarine Fire-",
romanization: "",
duration: "5:03"
},
{
title: "Boomerang Baby",
romanization: "",
duration: "2:27"
},
{
title: "夏のコラージュ",
romanization: "",
duration: "4:21"
},
{
title: "LAI-LA -邂逅-",
romanization: "",
duration: "4:22"
},
{
title: "セールスマンズ・ロンリネス",
romanization: "",
duration: "5:27"
},
{
title: "Southbound #9",
romanization: "",
duration: "5:01"
},
]
)
CreateAlbumWithTracks({
title: "For You",
romanization: "",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "1982",
description: "",
flavor: "Funk, Dreamy"
},
[{
title: "Sparkle",
romanization: "",
duration: "4:14"
},
{
title: "Music Book",
romanization: "",
duration: "5:10"
},
{
title: "Morning Glory",
romanization: "",
duration: "3:51"
},
{
title: "Futari",
romanization: "",
duration: "6:07"
},
{
title: "Loveland, Island",
romanization: "",
duration: "4:29"
},
{
title: "Love Talkin' (Honey it's You)",
romanization: "",
duration: "6:07"
},
{
title: "Hey Reporter!",
romanization: "",
duration: "5:33"
},
{
title: "Your Eyes",
romanization: "",
duration: "3:31"
},
]
)
CreateAlbumWithTracks({
title: "Melodies",
romanization: "",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "1986",
description: "",
flavor: "Funk, Dreamy"
},
[{
title: "悲しみのJODY (She Was Crying)",
romanization: "",
duration: "3:53"
},
{
title: "高気圧ガール",
romanization: "",
duration: "4:23"
},
{
title: "夜翔 (Night-Fly)",
romanization: "",
duration: "4:26"
},
{
title: "Guess I'm Dumb",
romanization: "",
duration: "3:15"
},
{
title: "ひととき",
romanization: "",
duration: "4:03"
},
{
title: "メリー・ゴー・ラウンド",
romanization: "",
duration: "6:22"
},
{
title: "Blue Midnight",
romanization: "",
duration: "4:18"
},
{
title: "あしおと",
romanization: "",
duration: "3:57"
},
{
title: "黙想",
romanization: "",
duration: "1:33"
},
{
title: "クリスマス・イブ",
romanization: "",
duration: "4:15"
},
]
)
CreateAlbumWithTracks({
title: "On the Street Corner 1",
romanization: "",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "1986",
description: "",
flavor: "Acappella"
},
[{
title: "You Belong to Me",
romanization: "",
duration: "2:58"
},
{
title: "Close Your Eyes",
romanization: "",
duration: "2:32"
},
{
title: "Spanish Harlem",
romanization: "",
duration: "3:38"
},
{
title: "Alone",
romanization: "",
duration: "2:47"
},
{
title: "Most of All",
romanization: "",
duration: "3:25"
},
{
title: "Remember Me Baby",
romanization: "",
duration: "3:00"
},
{
title: "Blue Velvet",
romanization: "",
duration: "2:37"
},
{
title: "Wind",
romanization: "",
duration: "2:13"
},
{
title: "Drip Drop",
romanization: "",
duration: "3:18"
},
{
title: "That's My Desire",
romanization: "",
duration: "3:47"
},
]
)
CreateAlbumWithTracks({
title: "On the Street Corner 2",
romanization: "",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "1986",
description: "",
flavor: "Acappella"
},
[{
title: "Amapola",
romanization: "",
duration: "3:26"
},
{
title: "Ten Commandments of Love",
romanization: "",
duration: "3:39"
},
{
title: "So Much in Love",
romanization: "",
duration: "2:27"
},
{
title: "Make It Easy on Yourself",
romanization: "",
duration: "2:40"
},
{
title: "My Memories of You",
romanization: "",
duration: "3:18"
},
{
title: "Chapel of Dreams",
romanization: "",
duration: "2:56"
},
{
title: "You Make Me Feel Brand New",
romanization: "",
duration: "5:07"
},
{
title: "I Only Have Eyes for You",
romanization: "",
duration: "3:35"
},
{
title: "Silent Night",
romanization: "",
duration: "1:10"
},
{
title: "White Christmas",
romanization: "",
duration: "2:26"
},
]
)
CreateAlbumWithTracks({
title: "On the Street Corner 3",
romanization: "",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "1999",
description: "",
flavor: "Acappella"
},
[{
title: "Dedicated to the One I Love",
romanization: "",
duration: "2:24"
},
{
title: "Stand by Me",
romanization: "",
duration: "3:11"
},
{
title: "Gloria",
romanization: "",
duration: "2:45"
},
{
title: "Angel",
romanization: "",
duration: "3:08"
},
{
title: "Dream Girl",
romanization: "",
duration: "2:40"
},
{
title: "Their Hearts were Full of Spring",
romanization: "",
duration: "2:29"
},
{
title: "Don't Ask Me to be Lonely",
romanization: "",
duration: "2:24"
},
{
title: "Love You So",
romanization: "",
duration: "3:30"
},
{
title: "Love T.K.O.",
romanization: "",
duration: "5:04"
},
{
title: "Why do Fools Fall in Love",
romanization: "",
duration: "1:51"
},
{
title: "Heavenly Feather",
romanization: "",
duration: "2:45"
},
]
)
CreateAlbumWithTracks({
title: "Pocket Music",
romanization: "",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "1986",
description: "",
flavor: "Dreamy, Ballad"
},
[{
title: "土曜日の恋人",
romanization: "",
duration: "3:01"
},
{
title: "ポケット・ミュージック",
romanization: "",
duration: "5:22"
},
{
title: "MERMAID",
romanization: "",
duration: "4:29"
},
{
title: "十字路",
romanization: "",
duration: "3:46"
},
{
title: "メロディー、君の為に",
romanization: "",
duration: "5:15"
},
{
title: "The War Song",
romanization: "",
duration: "5:05"
},
{
title: "シャンプー",
romanization: "",
duration: "4:14"
},
{
title: "ムーンライト",
romanization: "",
duration: "3:00"
},
{
title: "Lady Blue",
romanization: "",
duration: "4:04"
},
{
title: "風の回廊",
romanization: "",
duration: "3:57"
},
]
)
CreateAlbumWithTracks({
title: "Reborn",
romanization: "",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "2017",
description: "",
flavor: "Dreamy, Compilation"
},
[{
title: "REBORN",
romanization: "",
duration: "6:11"
},
{
title: "REBORN",
romanization: "",
duration: "5:33"
},
]
)
CreateAlbumWithTracks({
title: "Season's Greetings",
romanization: "",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "1993",
description: "",
flavor: "Christmas"
},
[{
title: "Acappella Variation on a Theme by Gluck",
romanization: "",
duration: "0:51"
},
{
title: "Bella Notte",
romanization: "",
duration: "3:51"
},
{
title: "Be My Love",
romanization: "",
duration: "3:41"
},
{
title: "Angels We Have Heard on High",
romanization: "",
duration: "1:01"
},
{
title: "Smoke Gets in Your Eyes",
romanization: "",
duration: "3:09"
},
{
title: "Silent Night",
romanization: "",
duration: "1:11"
},
{
title: "My Gift to You",
romanization: "",
duration: "4:06"
},
{
title: "It's All in the Game",
romanization: "",
duration: "3:24"
},
{
title: "Just a Lonely Christmas",
romanization: "",
duration: "2:26"
},
{
title: "Happy Holiday",
romanization: "",
duration: "2:21"
},
{
title: "Blue Christmas",
romanization: "",
duration: "2:48"
},
{
title: "White Christmas",
romanization: "",
duration: "2:24"
},
{
title: "Christmas Eve (English Version)",
romanization: "",
duration: "4:15"
},
{
title: "Have Yourself a Merry Little Christmas",
romanization: "",
duration: "2:49"
},
{
title: "O Come All Ye Faithful",
romanization: "",
duration: "0:53"
},
]
)
CreateAlbumWithTracks({
title: "Treasures",
romanization: "",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "1995",
description: "",
flavor: "Dreamy, Compilation"
},
[{
title: "高気圧ガール",
romanization: "",
duration: "4:22"
},
{
title: "スプリンクラー",
romanization: "",
duration: "4:31"
},
{
title: "ゲット・バック・イン・ラブ",
romanization: "",
duration: "4:22"
},
{
title: "風の回廊",
romanization: "",
duration: "3:59"
},
{
title: "アトムの子",
romanization: "",
duration: "4:27"
},
{
title: "エンドレス・ゲーム",
romanization: "",
duration: "4:10"
},
{
title: "踊ろよ、フィッシュ",
romanization: "",
duration: "4:51"
},
{
title: "ターナーの汽罐車",
romanization: "",
duration: "4:33"
},
{
title: "土曜日の恋人",
romanization: "",
duration: "3:15"
},
{
title: "ジャングル・スウィング",
romanization: "",
duration: "5:05"
},
{
title: "世界の果てまで",
romanization: "",
duration: "5:07"
},
{
title: "おやすみロージー",
romanization: "",
duration: "2:44"
},
{
title: "クリスマス・イブ",
romanization: "",
duration: "4:15"
},
{
title: "さよなら夏の日",
romanization: "",
duration: "4:38"
},
{
title: "蒼氓",
romanization: "",
duration: "6:06"
},
{
title: "パレード",
romanization: "",
duration: "3:59"
},
]
)
CreateAlbumWithTracks({
title: "僕の中の少年",
romanization: "Boku no Naka no Shounen",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "1988",
description: "",
flavor: "Dreamy"
},
[{
title: "新・東京ラプソディー",
romanization: "",
duration: "4:21"
},
{
title: "ゲット・バック・イン・ラ���",
romanization: "",
duration: "4:22"
},
{
title: "ザ・ガール・イン・ホワイト",
romanization: "",
duration: "4:13"
},
{
title: "寒い夏",
romanization: "",
duration: "3:33"
},
{
title: "踊ろよ、フィッシュ",
romanization: "",
duration: "4:51"
},
{
title: "ルミネッセンス",
romanization: "",
duration: "5:42"
},
{
title: "マーマレイド・グッバイ",
romanization: "",
duration: "4:40"
},
{
title: "蒼氓",
romanization: "",
duration: "5:59"
},
{
title: "僕の中���少年",
romanization: "",
duration: "4:53"
},
]
)
CreateAlbumWithTracks({
title: "光と君へのレクイエム",
romanization: "Hikari to Kimi e no Rekuiemu",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "2013",
description: "",
flavor: "Dreamy, Single"
},
[{
title: "光と君へのレクイエム",
romanization: "",
duration: "3:45"
},
{
title: "コンポジション",
romanization: "",
duration: "5:13"
},
]
)
CreateAlbumWithTracks({
title: "Tatsuro Songs from L.A. 2",
romanization: "",
romaji_artist: "Various Artists",
japanese_artist: "",
year: "1991",
description: "",
flavor: "Cover, Tribute, English"
},
[{
title: "Get Back in Love",
romanization: "",
duration: "4:27"
},
{
title: "Ride on Time",
romanization: "",
duration: "4:34"
},
{
title: "Merry Go Round",
romanization: "",
duration: "5:07"
},
{
title: "Kokiatsu Girl ~高気圧ガール~",
romanization: "",
duration: "4:23"
},
{
title: "Saturday Is for Lovers ~土曜日の恋人~",
romanization: "",
duration: "3:41"
},
{
title: "The Two of Us ~Futari~",
romanization: "",
duration: "5:15"
},
{
title: "Wonderful Afternoon ~素敵な午後は~",
romanization: "",
duration: "4:11"
},
{
title: "Meditation ~黙想~",
romanization: "",
duration: "2:48"
},
]
)
CreateAlbumWithTracks({
title: "Tatsuro Songs from L.A.",
romanization: "",
romaji_artist: "Various Artists",
japanese_artist: "",
year: "1990",
description: "",
flavor: "Cover, Tribute, English"
},
[{
title: "Christmas Eve",
romanization: "",
duration: "4:18"
},
{
title: "Sparkle",
romanization: "",
duration: "4:37"
},
{
title: "Touch Me Lightly",
romanization: "",
duration: "5:14"
},
{
title: "Windy Lady",
romanization: "",
duration: "5:43"
},
{
title: "Your Eyes",
romanization: "",
duration: "4:59"
},
{
title: "The Whispering Sea ~潮騒~",
romanization: "",
duration: "4:58"
},
{
title: "The Girl in White",
romanization: "",
duration: "3:47"
},
{
title: "Lady Blue",
romanization: "",
duration: "4:49"
},
])

CreateAlbumWithTracks({
title: "Surf & Snow",
romanization: "",
romaji_artist: "Yumi Matsutoya",
japanese_artist: "松任谷由実",
year: "1985",
description: "",
flavor: "Ballad"
},
[{
title: "彼から手をひいて",
romanization: "",
duration: "4:15"
},
{
title: "灼けたアイドル",
romanization: "",
duration: "5:03"
},
{
title: "人魚になりたい",
romanization: "",
duration: "4:41"
},
{
title: "まぶしい草野球",
romanization: "",
duration: "3:38"
},
{
title: "ワゴンに乗ってでかけよう",
romanization: "",
duration: "4:44"
},
{
title: "恋人がサンタクロース",
romanization: "",
duration: "5:05"
},
{
title: "シーズンオフの心には",
romanization: "",
duration: "3:16"
},
{
title: "サーフ天国，スキー天国",
romanization: "",
duration: "4:51"
},
{
title: "恋人と来ないで",
romanization: "",
duration: "4:26"
},
{
title: "雪だより",
romanization: "",
duration: "4:18"
},
])


#New batch of Toshiki


CreateAlbumWithTracks({
title: "Sea Breeze",
romanization: "",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "1981",
description: "",
flavor: "Funk"
},
[{
title: "Dancing Shower",
romanization: "",
duration: "4:44"
},
{
title: "Elena",
romanization: "",
duration: "5:22"
},
{
title: "Summer Babe",
romanization: "",
duration: "6:14"
},
{
title: "Surf Break",
romanization: "",
duration: "5:11"
},
{
title: "Yokohama Twilight Time",
romanization: "",
duration: "5:14"
},
{
title: "City Nights",
romanization: "",
duration: "4:50"
},
{
title: "Still, I'm In Love With You",
romanization: "",
duration: "6:23"
},
{
title: "Wave",
romanization: "",
duration: "6:22"
},
]
)
CreateAlbumWithTracks({
title: "Weekend Fly To The Sun",
romanization: "",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "1982",
description: "",
flavor: "Funk"
},
[{
title: "Office Lady",
romanization: "",
duration: "5:14"
},
{
title: "Rush Hour",
romanization: "",
duration: "5:34"
},
{
title: "Brunch",
romanization: "",
duration: "4:34"
},
{
title: "Space Scraper",
romanization: "",
duration: "5:24"
},
{
title: "Friday To Sunday",
romanization: "",
duration: "6:47"
},
{
title: "Crescent Aventure",
romanization: "",
duration: "6:23"
},
{
title: "I'll Never Let You Go",
romanization: "",
duration: "4:55"
},
{
title: "4 A.M.",
romanization: "",
duration: "4:12"
},
]
)
CreateAlbumWithTracks({
title: "On The City Shore",
romanization: "",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "1983",
description: "",
flavor: "Funk"
},
[{
title: "Off Shore",
romanization: "",
duration: "5:13"
},
{
title: "Summer Emotions",
romanization: "",
duration: "3:26"
},
{
title: "Ryoko !!",
romanization: "",
duration: "0:26"
},
{
title: "Beach's Widow",
romanization: "",
duration: "4:49"
},
{
title: "Take You To The Sky High",
romanization: "",
duration: "3:56"
},
{
title: "Take Me Far Away",
romanization: "",
duration: "4:38"
},
{
title: "Anklet",
romanization: "",
duration: "4:07"
},
{
title: "Dreamin' Walkin'",
romanization: "",
duration: "4:35"
},
{
title: "Let Me Say ...",
romanization: "",
duration: "6:12"
},
{
title: "Say ... Good Night",
romanization: "",
duration: "1:07"
},
]
)
CreateAlbumWithTracks({
title: "After 5 Crash",
romanization: "",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "1984",
description: "",
flavor: "Funk"
},
[{
title: "If You...",
romanization: "",
duration: "4:49"
},
{
title: "Midnight Girl",
romanization: "",
duration: "4:29"
},
{
title: "Airport Lady",
romanization: "",
duration: "4:19"
},
{
title: "Maybe It's Love Affair",
romanization: "",
duration: "3:41"
},
{
title: "Will You Wait For Me",
romanization: "",
duration: "4:12"
},
{
title: "After 5 Crash",
romanization: "",
duration: "3:43"
},
{
title: "Step Into The Light",
romanization: "",
duration: "3:26"
},
{
title: "Never Touch Again",
romanization: "",
duration: "4:16"
},
{
title: "I Need You",
romanization: "",
duration: "4:37"
},
{
title: "Heart Dancing",
romanization: "",
duration: "3:32"
},
]
)
CreateAlbumWithTracks({
title: "Summer Time Romance",
romanization: "",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "1984",
description: "",
flavor: "Funk"
},
[{
title: "Off Shore",
romanization: "",
duration: "5:00"
},
{
title: "Summer Emotion",
romanization: "",
duration: "2:55"
},
{
title: "Office Lady - Ryoko!!",
romanization: "",
duration: "4:34"
},
{
title: "Window On The Shore (Beach's Widow)",
romanization: "",
duration: "4:27"
},
{
title: "It's Hard To Say Good-Bye (Sayonara Wa Ai No Kotoba)",
romanization: "",
duration: "5:26"
},
{
title: "Prelude",
romanization: "",
duration: "1:44"
},
{
title: "Friday To Sunday",
romanization: "",
duration: "3:26"
},
{
title: "Step Into The Light",
romanization: "",
duration: "2:28"
},
{
title: "Do You Wanna Dance",
romanization: "",
duration: "4:37"
},
{
title: "Space Scraper",
romanization: "",
duration: "5:08"
},
{
title: "Take You To The Sky High",
romanization: "",
duration: "3:21"
},
{
title: "Let Me Say...",
romanization: "",
duration: "5:56"
},
]
)
CreateAlbumWithTracks({
title: "Gold Digger",
romanization: "",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "1985",
description: "",
flavor: "Funk"
},
[{
title: "I Can't Stop The Night",
romanization: "",
duration: "4:30"
},
{
title: "Springin' Night",
romanization: "",
duration: "4:01"
},
{
title: "Move Your Hips All Night Long",
romanization: "",
duration: "3:49"
},
{
title: "Secret Lover",
romanization: "",
duration: "3:51"
},
{
title: "Melody For You",
romanization: "",
duration: "4:02"
},
{
title: "Tokyo Tower",
romanization: "",
duration: "5:10"
},
{
title: "Prajna (Violence In The Subway)",
romanization: "",
duration: "0:49"
},
{
title: "Mermaid Princess",
romanization: "",
duration: "4:36"
},
{
title: "It's Too Late",
romanization: "",
duration: "6:28"
},
{
title: "No End Summer",
romanization: "",
duration: "3:21"
},
]
)
CreateAlbumWithTracks({
title: "Touch And Go",
romanization: "",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "1986",
description: "",
flavor: "Funk"
},
[{
title: "Overture ~take Off Melody",
romanization: "",
duration: "6:04"
},
{
title: "Lucky Lady Feel So Good",
romanization: "",
duration: "4:31"
},
{
title: "Take It Away",
romanization: "",
duration: "4:41"
},
{
title: "August Rain ~it's Our Pure Hearts~",
romanization: "",
duration: "4:56"
},
{
title: "Pile Driver",
romanization: "",
duration: "4:29"
},
{
title: "1975",
romanization: "",
duration: "4:03"
},
{
title: "Good-Bye Love",
romanization: "",
duration: "5:26"
},
{
title: "The Best Of Love",
romanization: "",
duration: "4:27"
},
]
)
CreateAlbumWithTracks({
title: "Sea Is A Lady",
romanization: "",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "1987",
description: "",
flavor: "Funk, Fusion"
},
[{
title: "Way To The Shore 'Eri'",
romanization: "",
duration: "1:07"
},
{
title: "Sea Line 'Rie'",
romanization: "",
duration: "4:19"
},
{
title: "Night Sight Of Port Island 'Midori'",
romanization: "",
duration: "5:28"
},
{
title: "Sea Song 'Naomi'",
romanization: "",
duration: "1:09"
},
{
title: "Sunset Of Micro Beach 'Satoko'",
romanization: "",
duration: "4:37"
},
{
title: "Oshi-Tao-Shitai 'Kaori Aso'(Memories Of Dusseldorf)",
romanization: "",
duration: "6:16"
},
{
title: "52nd Street 'Akiko'",
romanization: "",
duration: "5:55"
},
{
title: "The Bass Battle 'Chako'",
romanization: "",
duration: "1:10"
},
{
title: "Midsummer Drivin' 'Reiko'",
romanization: "",
duration: "5:12"
},
{
title: "Lovin' You 'Sawako'",
romanization: "",
duration: "2:55"
},
{
title: "Sea Song (Reprise)",
romanization: "",
duration: "2:05"
},
]
)
CreateAlbumWithTracks({
title: "Before The Daylight",
romanization: "",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "1988",
description: "",
flavor: "Funk"
},
[{
title: "I Can Give You My Love",
romanization: "",
duration: "5:11"
},
{
title: "Lost My Heart In The Dark",
romanization: "",
duration: "4:57"
},
{
title: "Thinking Of You",
romanization: "",
duration: "4:18"
},
{
title: "Get Your Feelin'",
romanization: "",
duration: "5:23"
},
{
title: "Can't You See",
romanization: "",
duration: "5:15"
},
{
title: "Remember You",
romanization: "",
duration: "5:26"
},
{
title: "Lady In The Night",
romanization: "",
duration: "4:36"
},
{
title: "I'd Like To Be Your Fantasy",
romanization: "",
duration: "5:50"
},
]
)
CreateAlbumWithTracks({
title: "Reasons For Thousand Lovers",
romanization: "",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "1989",
description: "",
flavor: "Funk"
},
[{
title: "飴色の街",
romanization: "",
duration: "5:31"
},
{
title: "Ratirahasha ~ Time For Kari",
romanization: "",
duration: "6:08"
},
{
title: "Knock My Door",
romanization: "",
duration: "5:38"
},
{
title: "Cinderella",
romanization: "",
duration: "6:10"
},
{
title: "Polar",
romanization: "",
duration: "4:15"
},
{
title: "Okinawa",
romanization: "",
duration: "7:02"
},
{
title: "Reason...",
romanization: "",
duration: "4:23"
},
{
title: "End Of The Night",
romanization: "",
duration: "5:07"
},
{
title: "Moonlight Tokyo Bay",
romanization: "",
duration: "5:58"
},
{
title: "New Year's Eve",
romanization: "",
duration: "5:39"
},
]
)
CreateAlbumWithTracks({
title: "Legacy Of You",
romanization: "",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "1990",
description: "",
flavor: "Funk"
},
[{
title: "Premonition Of Summer",
romanization: "",
duration: "9:37"
},
{
title: "Sayuri",
romanization: "",
duration: "6:37"
},
{
title: "At Canal St Club",
romanization: "",
duration: "7:19"
},
{
title: "Yuriko",
romanization: "",
duration: "5:48"
},
{
title: "Mystical Night Love (Chisato's Dream)",
romanization: "",
duration: "5:38"
},
{
title: "Tsugaru",
romanization: "",
duration: "9:05"
},
{
title: "Stress",
romanization: "",
duration: "6:17"
},
{
title: "Twilight River",
romanization: "",
duration: "6:23"
},
{
title: "Daylight Of Alamoana",
romanization: "",
duration: "2:03"
},
{
title: "Nh-Ca's Struttin' (Crossing At Airport)(Sanae)",
romanization: "",
duration: "6:15"
},
{
title: "Parasail (At Ramda Beach)",
romanization: "",
duration: "6:45"
},
{
title: "Sato",
romanization: "",
duration: "3:55"
},
]
)
CreateAlbumWithTracks({
title: "All Is Vanity",
romanization: "",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "1991",
description: "",
flavor: "Funk"
},
[{
title: "夜離れ ~you're Leaving My Heart",
romanization: "",
duration: "6:18"
},
{
title: "夏回歸 ~summer Days",
romanization: "",
duration: "6:12"
},
{
title: "海 ~the Sea",
romanization: "",
duration: "5:21"
},
{
title: "この驛から... ~station",
romanization: "",
duration: "5:16"
},
{
title: "ただ一度だけ ~if Only Once",
romanization: "",
duration: "5:03"
},
{
title: "All Is Vanity",
romanization: "",
duration: "6:58"
},
{
title: "Up Town Girl",
romanization: "",
duration: "4:22"
},
{
title: "Distance",
romanization: "",
duration: "6:08"
},
{
title: "彷徨 ~stray At Night",
romanization: "",
duration: "5:19"
},
{
title: "What Is Woman",
romanization: "",
duration: "7:13"
},
]
)
CreateAlbumWithTracks({
title: "あるがままに",
romanization: "Aru ga Mama ni",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "1992",
description: "",
flavor: "Funk"
},
[{
title: "さよ���らなんて絶對言わない",
romanization: "",
duration: "4:53"
},
{
title: "夜をこえて",
romanization: "",
duration: "5:23"
},
{
title: "モノレ-ル",
romanization: "",
duration: "4:54"
},
{
title: "香港街燈",
romanization: "",
duration: "6:14"
},
{
title: "せめて無事な夜を",
romanization: "",
duration: "4:52"
},
{
title: "君がやりたかったscuba Diving",
romanization: "",
duration: "7:30"
},
{
title: "君を二度とはなさない",
romanization: "",
duration: "5:33"
},
{
title: "あるがままに",
romanization: "",
duration: "5:07"
},
]
)
CreateAlbumWithTracks({
title: "君をこえる日",
romanization: "Kimiwokoeruhi",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "1992",
description: "",
flavor: "Funk"
},
[{
title: "君をこえる日",
romanization: "",
duration: "5:48"
},
{
title: "Port Of Your Heart, Sail Of My Life",
romanization: "",
duration: "6:11"
},
{
title: "時の挽歌",
romanization: "",
duration: "6:46"
},
{
title: "泣かないでだっくん",
romanization: "",
duration: "4:04"
},
{
title: "君たちへ… ~bonとyukariのballad~",
romanization: "",
duration: "4:46"
},
]
)
CreateAlbumWithTracks({
title: "Time Tunnel",
romanization: "",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "1999",
description: "",
flavor: "Funk"
},
[{
title: "Time Tunnel",
romanization: "",
duration: "2:35"
},
{
title: "Lunafairymiena",
romanization: "",
duration: "4:37"
},
{
title: "Shibuya",
romanization: "",
duration: "4:57"
},
{
title: "--い",
romanization: "",
duration: "5:05"
},
{
title: "Rendezvous",
romanization: "",
duration: "4:57"
},
{
title: "Alright",
romanization: "",
duration: "5:02"
},
{
title: "時計",
romanization: "",
duration: "6:20"
},
{
title: "何もない夜",
romanization: "",
duration: "5:16"
},
{
title: "風のあやぐ (Duet With Satoru Shimoji)",
romanization: "",
duration: "5:38"
},
{
title: "崩壞の前日",
romanization: "",
duration: "6:54"
},
]
)
CreateAlbumWithTracks({
title: "存在の証明",
romanization: "Sonzainoshōmei",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "2000",
description: "",
flavor: "Funk"
},
[{
title: "生足の駝鳥",
romanization: "",
duration: "3:41"
},
{
title: "夏休み",
romanization: "",
duration: "4:27"
},
{
title: "愛と修羅",
romanization: "",
duration: "4:06"
},
{
title: "煩悩 Rolling Stone",
romanization: "",
duration: "5:05"
},
{
title: "浜辺の歌",
romanization: "",
duration: "2:58"
},
{
title: "10月の愚者",
romanization: "",
duration: "4:57"
},
{
title: "Hope All Goes Well",
romanization: "",
duration: "5:35"
},
{
title: "Hold On To Love～nothing I Can Do For Love",
romanization: "",
duration: "4:59"
},
{
title: "痴漢電車",
romanization: "",
duration: "3:53"
},
{
title: "週末",
romanization: "",
duration: "4:34"
},
{
title: "Flow Of Love",
romanization: "",
duration: "6:01"
},
{
title: "存在への不安と欲望の十二ヶ月",
romanization: "",
duration: "6:40"
},
]
)
CreateAlbumWithTracks({
title: "Incarnatio",
romanization: "",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "2002",
description: "",
flavor: "Funk"
},
[{
title: "Inasa",
romanization: "",
duration: "1:26"
},
{
title: "Izumo",
romanization: "",
duration: "4:01"
},
{
title: "Prelude #1",
romanization: "",
duration: "1:34"
},
{
title: "風車",
romanization: "",
duration: "4:35"
},
{
title: "Dawn",
romanization: "",
duration: "5:04"
},
{
title: "マレビトの浜 -Let’s Find Out-",
romanization: "",
duration: "5:30"
},
{
title: "常世へ続く川",
romanization: "",
duration: "6:29"
},
{
title: "アマヌサの海",
romanization: "",
duration: "6:17"
},
{
title: "Aijin",
romanization: "",
duration: "5:40"
},
{
title: "Ways",
romanization: "",
duration: "4:11"
},
{
title: "Gazer",
romanization: "",
duration: "5:21"
},
{
title: "Prelude #2",
romanization: "",
duration: "1:45"
},
{
title: "八月踊りの島",
romanization: "",
duration: "5:45"
},
{
title: "鎮魂の夜",
romanization: "",
duration: "4:55"
},
{
title: "太陽と海と月",
romanization: "",
duration: "4:53"
},
]
)
CreateAlbumWithTracks({
title: "Summer 4 Rhythm",
romanization: "",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "2003",
description: "",
flavor: "Funk"
},
[{
title: "Beams",
romanization: "",
duration: "5:02"
},
{
title: "All'n All",
romanization: "",
duration: "4:49"
},
{
title: "真夜中の太陽",
romanization: "",
duration: "4:41"
},
{
title: "珊瑚の風",
romanization: "",
duration: "3:27"
},
{
title: "波をこえて ～over The Wave～",
romanization: "",
duration: "5:02"
},
{
title: "Make It Higher",
romanization: "",
duration: "4:10"
},
{
title: "主張#1",
romanization: "",
duration: "4:40"
},
{
title: "Yu-Nagi",
romanization: "",
duration: "5:34"
},
{
title: "桃色の雲",
romanization: "",
duration: "5:34"
},
{
title: "Gratitude",
romanization: "",
duration: "5:53"
},
{
title: "君のためにできること",
romanization: "",
duration: "5:53"
},
]
)
CreateAlbumWithTracks({
title: "No Turns",
romanization: "",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "2009",
description: "",
flavor: "Funk"
},
[{
title: "Reminiscing",
romanization: "",
duration: "5:25"
},
{
title: "もっと",
romanization: "",
duration: "5:13"
},
{
title: "木洩れ陽",
romanization: "",
duration: "4:00"
},
{
title: "What Do You Think",
romanization: "",
duration: "4:45"
},
{
title: "Love Junky",
romanization: "",
duration: "5:31"
},
{
title: "美しいつながり",
romanization: "",
duration: "4:17"
},
{
title: "You Can Go Your Own Way",
romanization: "",
duration: "4:46"
},
{
title: "Pansy",
romanization: "",
duration: "5:07"
},
{
title: "Falling In Love",
romanization: "",
duration: "5:07"
},
{
title: "鏡の中の二人",
romanization: "",
duration: "5:28"
},
{
title: "Cat Walk",
romanization: "",
duration: "4:53"
},
{
title: "夜の蟬",
romanization: "",
duration: "4:41"
},
]
)
CreateAlbumWithTracks({
title: "Citylights Dandy",
romanization: "",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "2010",
description: "",
flavor: "Funk"
},
[{
title: "Dandy...In The Citylights",
romanization: "",
duration: "2:02"
},
{
title: "Hot Lazy Night",
romanization: "",
duration: "5:20"
},
{
title: "Fly By Night",
romanization: "",
duration: "3:37"
},
{
title: "134",
romanization: "",
duration: "5:18"
},
{
title: "La Carnaval",
romanization: "",
duration: "4:18"
},
{
title: "Twilight Moody Blues",
romanization: "",
duration: "4:10"
},
{
title: "Mrs. Moonlight",
romanization: "",
duration: "6:12"
},
{
title: "Friend",
romanization: "",
duration: "5:19"
},
{
title: "Funky Go-Kohn",
romanization: "",
duration: "6:26"
},
{
title: "Hamabe Days 浜辺days",
romanization: "",
duration: "3:48"
},
{
title: "See You Again",
romanization: "",
duration: "4:40"
},
]
)
CreateAlbumWithTracks({
title: "Rebirth 1 ～Re-Make Best～",
romanization: "",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "2012",
description: "",
flavor: "Funk, Compilation"
},
[{
title: "Do You Wanna Dance",
romanization: "",
duration: "6:10"
},
{
title: "Tokyo Tower",
romanization: "",
duration: "5:41"
},
{
title: "Girl In The Box ～ 22時までの君は…",
romanization: "",
duration: "6:40"
},
{
title: "Rush Hour",
romanization: "",
duration: "6:25"
},
{
title: "A Widow On The Shore",
romanization: "",
duration: "6:39"
},
{
title: "Summer Emotions",
romanization: "",
duration: "4:38"
},
{
title: "Wave",
romanization: "",
duration: "6:44"
},
{
title: "No End Summer",
romanization: "",
duration: "4:55"
},
{
title: "After 5 Crash",
romanization: "",
duration: "6:42"
},
{
title: "あるがままに",
romanization: "",
duration: "6:44"
},
]
)
CreateAlbumWithTracks({
title: "Sea Is A Lady 2017",
romanization: "",
romaji_artist: "Toshiki Kadomatsu",
japanese_artist: "角松敏生",
year: "2017",
description: "",
flavor: "Funk, Remake"
},
[{
title: "Way To The Shore",
romanization: "",
duration: "1:12"
},
{
title: "Sea Line",
romanization: "",
duration: "4:49"
},
{
title: "Night Sight Of Port Island",
romanization: "",
duration: "5:51"
},
{
title: "Sunset Of Micro Beach",
romanization: "",
duration: "5:22"
},
{
title: "Ryoko!",
romanization: "",
duration: "2:13"
},
{
title: "Summer Babe",
romanization: "",
duration: "5:37"
},
{
title: "52Nd Street",
romanization: "",
duration: "6:12"
},
{
title: "Midsummer Drivin'",
romanization: "",
duration: "5:25"
},
{
title: "Lovin' You",
romanization: "",
duration: "3:17"
},
{
title: "Evening Skyline",
romanization: "",
duration: "6:10"
},
{
title: "Oshi-Tao-Shitai",
romanization: "",
duration: "14:09"
},
])


#New batch (Meiko)


CreateAlbumWithTracks({
title: "Coconuts House",
romanization: "",
romaji_artist: "Meiko Nakahara",
japanese_artist: "中原めいこ",
year: "1982",
description: "",
flavor: "Funk, Latin"
},
[{
title: "今夜だけDance Dance Dance",
romanization: "Konya Dake Dance Dance Dance",
duration: "3:53"
},
{
title: "Sunset Freeway",
romanization: "",
duration: "3:40"
},
{
title: "バカンス",
romanization: "Vacance",
duration: "3:31"
},
{
title: "涙のスロー・ダンス",
romanization: "Namida no Slow Dance",
duration: "5:03"
},
{
title: "恋はサンバにのせて・・・",
romanization: "Koi wa Samba ni Nosete...",
duration: "4:24"
},
{
title: "タイムリミット",
romanization: "Time Limit",
duration: "3:52"
},
{
title: "Gemini",
romanization: "",
duration: "4:18"
},
{
title: "ほんのちょっぴりOld Man",
romanization: "Honno Choppiri Old Man",
duration: "3:58"
},
{
title: "City Night",
romanization: "",
duration: "3:53"
},
{
title: "Come Back To Me",
romanization: "",
duration: "4:26"
},
]
)
CreateAlbumWithTracks({
title: "Friday Magic",
romanization: "",
romaji_artist: "Meiko Nakahara",
japanese_artist: "中原めいこ",
year: "1982",
description: "",
flavor: "Funk"
},
[{
title: "Fantasy",
romanization: "",
duration: "4:24"
},
{
title: "ジゴロ",
romanization: "",
duration: "4:16"
},
{
title: "ココナッツの片想い",
romanization: "",
duration: "3:14"
},
{
title: "パールのマニキュア",
romanization: "",
duration: "4:05"
},
{
title: "Go Away",
romanization: "",
duration: "4:19"
},
{
title: "Friday Magic",
romanization: "",
duration: "3:29"
},
{
title: "恋の余韻",
romanization: "",
duration: "4:08"
},
{
title: "ステキなじゃじゃ馬ならし",
romanization: "",
duration: "3:20"
},
{
title: "ダイヤルまわして…",
romanization: "",
duration: "4:16"
},
{
title: "2時までのシンデレラ",
romanization: "",
duration: "4:32"
},
]
)
CreateAlbumWithTracks({
title: "Mint",
romanization: "",
romaji_artist: "Meiko Nakahara",
japanese_artist: "中原めいこ",
year: "1983",
description: "",
flavor: "Funk, Ballad"
},
[{
title: "渚のDaydream",
romanization: "Nagisa no Daydream",
duration: "3:45"
},
{
title: "ふたりのRainy Day",
romanization: "Futari no Rainy Day",
duration: "4:47"
},
{
title: "眠り姫",
romanization: "Nemuri Hime",
duration: "5:04"
},
{
title: "ケンカのあとの口づけ",
romanization: "Kenka no Ato no Kuchizuke",
duration: "4:36"
},
{
title: "恋のバースデイ",
romanization: "Koi no Birthday",
duration: "4:03"
},
{
title: "月夜に気をつけて！",
romanization: "Tsukiyo ni Ki o Tsukete!",
duration: "3:55"
},
{
title: "Sexy Dandy",
romanization: "",
duration: "4:28"
},
{
title: "ジャグラー",
romanization: "Jaguraa",
duration: "4:31"
},
{
title: "アナタの魔法にかかりそう...",
romanization: "Anata no Mahou ni Kakari Sou...",
duration: "3:34"
},
{
title: "ペパーミントの朝",
romanization: "Peppermint no Asa",
duration: "3:28"
},
]
)
CreateAlbumWithTracks({
title: "ロートスの果実",
romanization: "Rōtosu no kajitsu",
romaji_artist: "Meiko Nakahara",
japanese_artist: "中原めいこ",
year: "1984",
description: "",
flavor: "Funk, Latin"
},
[{
title: "魔法のカーペット",
romanization: "",
duration: "3:48"
},
{
title: "ロートスの果実 ー夢楽樹ー",
romanization: "",
duration: "3:56"
},
{
title: "エモーション",
romanization: "",
duration: "3:32"
},
{
title: "I Miss My Valentine",
romanization: "",
duration: "4:40"
},
{
title: "メランコリー Tea Time",
romanization: "",
duration: "3:34"
},
{
title: "君たち キウイ・パパイア・マンゴーだね。",
romanization: "",
duration: "3:13"
},
{
title: "こんな気分じゃ帰れない",
romanization: "",
duration: "3:39"
},
{
title: "スコーピオン",
romanization: "",
duration: "4:11"
},
{
title: "気まぐれ Bad Boy",
romanization: "",
duration: "4:02"
},
{
title: "Cloudy な午後",
romanization: "",
duration: "4:36"
},
]
)
CreateAlbumWithTracks({
title: "Chaki Chaki Club",
romanization: "",
romaji_artist: "Meiko Nakahara",
japanese_artist: "中原めいこ",
year: "1985",
description: "",
flavor: "Funk, Ballad"
},
[{
title: "宇宙恋愛（スペース・ファンタジー）",
romanization: "",
duration: "3:21"
},
{
title: "やきもちやき ルンバ・ボーイ",
romanization: "",
duration: "3:20"
},
{
title: "Kiss In The Morning Light",
romanization: "",
duration: "4:06"
},
{
title: "サンバでも踊ろう",
romanization: "",
duration: "4:08"
},
{
title: "ホットラインは内線424",
romanization: "",
duration: "3:26"
},
{
title: "夜は Musical",
romanization: "",
duration: "4:37"
},
{
title: "ルナルナ・Tiki Tiki",
romanization: "",
duration: "2:55"
},
{
title: "恋の秘訣",
romanization: "",
duration: "3:15"
},
{
title: "ハートエイク",
romanization: "",
duration: "3:15"
},
{
title: "フレンチ・バニラ",
romanization: "",
duration: "3:48"
},
]
)
CreateAlbumWithTracks({
title: "Moods",
romanization: "",
romaji_artist: "Meiko Nakahara",
japanese_artist: "中原めいこ",
year: "1986",
description: "",
flavor: "Funk, Ballad"
},
[{
title: "Gimme，Gimme Motions",
romanization: "",
duration: "4:39"
},
{
title: "極楽鳥のテーマ",
romanization: "",
duration: "5:16"
},
{
title: "So Shine",
romanization: "",
duration: "4:47"
},
{
title: "We Were In L.A.",
romanization: "",
duration: "5:12"
},
{
title: "Number 1",
romanization: "",
duration: "4:09"
},
{
title: "こわれたピアノ",
romanization: "",
duration: "4:18"
},
{
title: "Lonely Woman",
romanization: "",
duration: "4:03"
},
{
title: "ロ・ロ・ロ・ロシアン・ルーレット",
romanization: "",
duration: "4:26"
},
{
title: "New York でサルサ",
romanization: "",
duration: "4:56"
},
]
)
CreateAlbumWithTracks({
title: "Puzzle",
romanization: "",
romaji_artist: "Meiko Nakahara",
japanese_artist: "中原めいこ",
year: "1987",
description: "",
flavor: "Funk, Ballad"
},
[{
title: "The Overture - Merry Train",
romanization: "",
duration: "3:24"
},
{
title: "Studio 54",
romanization: "",
duration: "4:11"
},
{
title: "Tokyo Game",
romanization: "",
duration: "4:04"
},
{
title: "Puzzle",
romanization: "",
duration: "4:05"
},
{
title: "Unbalance-zone",
romanization: "",
duration: "3:42"
},
{
title: "Hallelujah・Anyway",
romanization: "",
duration: "3:54"
},
{
title: "マスカレード(仮面舞踏会)",
romanization: "",
duration: "4:23"
},
{
title: "カーニバル",
romanization: "",
duration: "4:41"
},
{
title: "Happy birthday, Love for you",
romanization: "",
duration: "5:13"
},
])


#New Batch (Casiopea)


CreateAlbumWithTracks({
title: "Casiopea",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1979",
description: "",
flavor: "Fusion"
},
[{
title: "Time Limit",
romanization: "",
duration: "3:07"
},
{
title: "Tears Of The Star",
romanization: "",
duration: "4:32"
},
{
title: "Space Road",
romanization: "",
duration: "5:14"
},
{
title: "Midnight Rendezvous",
romanization: "",
duration: "5:23"
},
{
title: "Far Away",
romanization: "",
duration: "3:57"
},
{
title: "Swallow",
romanization: "",
duration: "4:26"
},
{
title: "Dream Hill",
romanization: "",
duration: "5:39"
},
{
title: "Black Joke",
romanization: "",
duration: "4:17"
},
]
)
CreateAlbumWithTracks({
title: "Super Flight",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1979",
description: "",
flavor: "Fusion"
},
[{
title: "Take Me",
romanization: "",
duration: "4:50"
},
{
title: "Flying",
romanization: "",
duration: "4:51"
},
{
title: "Dune",
romanization: "",
duration: "4:51"
},
{
title: "Asayake",
romanization: "",
duration: "5:05"
},
{
title: "I Love New York",
romanization: "",
duration: "4:08"
},
{
title: "Sailing Alone",
romanization: "",
duration: "4:43"
},
{
title: "Olion",
romanization: "",
duration: "3:20"
},
{
title: "Magic Ray",
romanization: "",
duration: "4:43"
},
{
title: "Mighty Mouse",
romanization: "",
duration: "3:08"
},
]
)
CreateAlbumWithTracks({
title: "Make Up City",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1980",
description: "",
flavor: "Fusion"
},
[{
title: "Gypsy Wind",
romanization: "",
duration: "4:06"
},
{
title: "Eyes Of Mind",
romanization: "",
duration: "5:54"
},
{
title: "Reflections Of You",
romanization: "",
duration: "4:28"
},
{
title: "Ripple Dance",
romanization: "",
duration: "4:57"
},
{
title: "Life Game",
romanization: "",
duration: "4:59"
},
{
title: "Make Up City",
romanization: "",
duration: "5:21"
},
{
title: "Pastel Sea",
romanization: "",
duration: "4:09"
},
{
title: "Twinkle Wing",
romanization: "",
duration: "5:17"
},
]
)
CreateAlbumWithTracks({
title: "Cross Point",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1981",
description: "",
flavor: "Fusion"
},
[{
title: "Smile Again",
romanization: "",
duration: "4:02"
},
{
title: "Swear",
romanization: "",
duration: "5:24"
},
{
title: "A Sparkling Day",
romanization: "",
duration: "3:36"
},
{
title: "Span Of A Dream",
romanization: "",
duration: "4:56"
},
{
title: "Domino Line",
romanization: "",
duration: "3:27"
},
{
title: "Galactic Funk",
romanization: "",
duration: "4:25"
},
{
title: "Sunnyside Feelin'",
romanization: "",
duration: "4:16"
},
{
title: "Any Moment (We'll Be One)",
romanization: "",
duration: "5:13"
},
{
title: "Endless Vision",
romanization: "",
duration: "4:39"
},
]
)
CreateAlbumWithTracks({
title: "Eyes Of The Mind",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1981",
description: "",
flavor: "Fusion"
},
[{
title: "Asayake (Sunrise)",
romanization: "",
duration: "3:51"
},
{
title: "A Place In The Sun",
romanization: "",
duration: "4:39"
},
{
title: "Take Me",
romanization: "",
duration: "4:15"
},
{
title: "Lakai",
romanization: "",
duration: "4:10"
},
{
title: "Eyes Of The Mind",
romanization: "",
duration: "4:42"
},
{
title: "Black Joke",
romanization: "",
duration: "4:03"
},
{
title: "La Costa (Intro)",
romanization: "",
duration: "0:22"
},
{
title: "La Costa",
romanization: "",
duration: "3:47"
},
{
title: "Magic Ray",
romanization: "",
duration: "4:51"
},
{
title: "Space Road",
romanization: "",
duration: "4:47"
},
]
)
CreateAlbumWithTracks({
title: "4x4",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1982",
description: "",
flavor: "Fusion"
},
[{
title: "Mid-Manhattan",
romanization: "",
duration: "4:45"
},
{
title: "Pavane",
romanization: "",
duration: "5:34"
},
{
title: "Transatlantic",
romanization: "",
duration: "5:39"
},
{
title: "Galactic Funk",
romanization: "",
duration: "6:10"
},
{
title: "Kauai",
romanization: "",
duration: "3:56"
},
{
title: "Chandelier",
romanization: "",
duration: "4:28"
},
]
)
CreateAlbumWithTracks({
title: "Mint Jams",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1982",
description: "",
flavor: "Fusion, Compilation"
},
[{
title: "Take Me",
romanization: "",
duration: "4:49"
},
{
title: "Asayake",
romanization: "",
duration: "4:57"
},
{
title: "Midnight Rendezvous",
romanization: "",
duration: "4:56"
},
{
title: "Time Limit",
romanization: "",
duration: "2:37"
},
{
title: "Domino Line",
romanization: "",
duration: "7:20"
},
{
title: "Tears Of The Star",
romanization: "",
duration: "4:27"
},
{
title: "Swear",
romanization: "",
duration: "6:46"
},
]
)
CreateAlbumWithTracks({
title: "JiveJive",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1983",
description: "",
flavor: "Fusion"
},
[{
title: "Sweat It Out",
romanization: "",
duration: "4:15"
},
{
title: "In The Pocket",
romanization: "",
duration: "3:43"
},
{
title: "Right From The Heart",
romanization: "",
duration: "4:13"
},
{
title: "Step Daughter",
romanization: "",
duration: "3:48"
},
{
title: "Secret Chase",
romanization: "",
duration: "4:55"
},
{
title: "FabbyDabby",
romanization: "",
duration: "3:56"
},
{
title: "Living On A Feeling",
romanization: "",
duration: "4:25"
},
{
title: "S-E",
romanization: "",
duration: "5:12"
},
{
title: "What Can't Speak Can't Lie",
romanization: "",
duration: "3:51"
},
]
)
CreateAlbumWithTracks({
title: "Photographs",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1983",
description: "",
flavor: "Fusion"
},
[{
title: "Looking Up",
romanization: "",
duration: "4:27"
},
{
title: "Dazzling",
romanization: "",
duration: "4:17"
},
{
title: "Long Term Memory",
romanization: "",
duration: "4:17"
},
{
title: "Strasse",
romanization: "",
duration: "3:41"
},
{
title: "Out Drive",
romanization: "",
duration: "3:40"
},
{
title: "Misty Lady",
romanization: "",
duration: "3:43"
},
{
title: "Love You Day By Day",
romanization: "",
duration: "4:04"
},
{
title: "Spice Road",
romanization: "",
duration: "4:35"
},
{
title: "Fruit Salad Sunday",
romanization: "",
duration: "3:54"
},
{
title: "From Over The Sky",
romanization: "",
duration: "4:09"
},
]
)
CreateAlbumWithTracks({
title: "Down Upbeat",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1984",
description: "",
flavor: "Fusion"
},
[{
title: "Zoom",
romanization: "",
duration: "3:16"
},
{
title: "Down Upbeat",
romanization: "",
duration: "3:54"
},
{
title: "The Continental Way",
romanization: "",
duration: "4:46"
},
{
title: "Road Rhythm",
romanization: "",
duration: "3:00"
},
{
title: "Froufrou",
romanization: "",
duration: "3:57"
},
{
title: "Homestretch",
romanization: "",
duration: "3:47"
},
{
title: "Night Storm",
romanization: "",
duration: "4:09"
},
{
title: "Cookin' Up",
romanization: "",
duration: "3:32"
},
{
title: "Twilight Solitude",
romanization: "",
duration: "4:25"
},
{
title: "Air Fantasy",
romanization: "",
duration: "3:17"
},
]
)
CreateAlbumWithTracks({
title: "The Soundgraphy",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1984",
description: "",
flavor: "Fusion, Compilation"
},
[{
title: "The Soundgraphy",
romanization: "",
duration: "3:41"
},
{
title: "Gypsy Wind",
romanization: "",
duration: "4:05"
},
{
title: "Eyes Of The Mind",
romanization: "",
duration: "4:42"
},
{
title: "Sunnyside Feelin'",
romanization: "",
duration: "4:11"
},
{
title: "Asayake",
romanization: "",
duration: "4:57"
},
{
title: "Mid-Manhattan",
romanization: "",
duration: "4:37"
},
{
title: "Looking Up",
romanization: "",
duration: "4:24"
},
{
title: "Misty Lady",
romanization: "",
duration: "3:41"
},
{
title: "What Can't Speak Can't Lie",
romanization: "",
duration: "3:48"
},
{
title: "Fabbydabby",
romanization: "",
duration: "3:53"
},
]
)
CreateAlbumWithTracks({
title: "Landing To Summer",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1986",
description: "",
flavor: "Fusion"
},
[{
title: "Halle",
romanization: "",
duration: "3:39"
},
{
title: "Sunnyside Feelin'",
romanization: "",
duration: "4:14"
},
{
title: "Lakai",
romanization: "",
duration: "4:13"
},
{
title: "Touch The Rainbow",
romanization: "",
duration: "4:07"
},
{
title: "Marine Blue",
romanization: "",
duration: "4:13"
},
{
title: "Road Rhythm",
romanization: "",
duration: "3:04"
},
{
title: "Pastel Sea",
romanization: "",
duration: "4:12"
},
{
title: "The Continental Way",
romanization: "",
duration: "4:49"
},
{
title: "The Soundgraphy",
romanization: "",
duration: "3:44"
},
{
title: "Homestretch",
romanization: "",
duration: "3:50"
},
{
title: "Long Term Memory",
romanization: "",
duration: "4:17"
},
{
title: "A Sparkling Day",
romanization: "",
duration: "3:38"
},
]
)
CreateAlbumWithTracks({
title: "Sun Sun",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1986",
description: "",
flavor: "Fusion"
},
[{
title: "After Glow",
romanization: "",
duration: "3:18"
},
{
title: "Coast To Coast",
romanization: "",
duration: "4:05"
},
{
title: "Conjunction",
romanization: "",
duration: "1:39"
},
{
title: "Departure",
romanization: "",
duration: "3:05"
},
{
title: "Keepers",
romanization: "",
duration: "3:16"
},
{
title: "Lunar Shade",
romanization: "",
duration: "4:15"
},
{
title: "Mi Senora",
romanization: "",
duration: "3:22"
},
{
title: "Mr. Unique",
romanization: "",
duration: "4:06"
},
{
title: "Planetoid Mother Earth",
romanization: "",
duration: "5:14"
},
{
title: "Samba Mania",
romanization: "",
duration: "3:12"
},
{
title: "Someone's Love",
romanization: "",
duration: "3:45"
},
{
title: "Somethings Wrong (Change It)",
romanization: "",
duration: "4:31"
},
{
title: "Sun",
romanization: "",
duration: "4:03"
},
{
title: "Transformation 1",
romanization: "",
duration: "3:23"
},
]
)
CreateAlbumWithTracks({
title: "Platinum",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1987",
description: "",
flavor: "Fusion"
},
[{
title: "Access",
romanization: "",
duration: "3:48"
},
{
title: "Akasha",
romanization: "",
duration: "4:03"
},
{
title: "Magnetic Vibrations",
romanization: "",
duration: "4:20"
},
{
title: "Mee Espere",
romanization: "",
duration: "3:16"
},
{
title: "Doo-Loo-Doo",
romanization: "",
duration: "3:51"
},
{
title: "Get Back To That Good Thing",
romanization: "",
duration: "4:00"
},
{
title: "Princess Moon",
romanization: "",
duration: "4:20"
},
{
title: "Sunset Rhapsody",
romanization: "",
duration: "3:19"
},
{
title: "Believe In Yourself",
romanization: "",
duration: "4:30"
},
{
title: "'Sunka'",
romanization: "",
duration: "4:30"
},
{
title: "Bridge Over Trouble Water",
romanization: "",
duration: "4:05"
},
]
)
CreateAlbumWithTracks({
title: "Euphony",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1988",
description: "",
flavor: "Fusion"
},
[{
title: "The Wind From The Sun",
romanization: "",
duration: "4:14"
},
{
title: "Shadow Man",
romanization: "",
duration: "4:08"
},
{
title: "Super Sonic Movement",
romanization: "",
duration: "3:56"
},
{
title: "Old Times",
romanization: "",
duration: "3:45"
},
{
title: "Bayside Express",
romanization: "",
duration: "4:55"
},
{
title: "Sentimental Avenue",
romanization: "",
duration: "3:26"
},
{
title: "Solid Swing",
romanization: "",
duration: "1:59"
},
{
title: "Hacker",
romanization: "",
duration: "3:26"
},
{
title: "Pure Green",
romanization: "",
duration: "4:12"
},
{
title: "Red Zone",
romanization: "",
duration: "3:08"
},
{
title: "Shallow Dreams",
romanization: "",
duration: "3:58"
},
]
)
CreateAlbumWithTracks({
title: "the Last Members",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1990",
description: "",
flavor: "Fusion"
},
[{
title: "Bayside Express",
romanization: "",
duration: "4:53"
},
{
title: "Do-Loo-Doo?",
romanization: "",
duration: "4:04"
},
{
title: "Taiyo-Fu",
romanization: "",
duration: "4:12"
},
{
title: "Solid Swing",
romanization: "",
duration: "1:59"
},
{
title: "Pure Green",
romanization: "",
duration: "4:10"
},
{
title: "Sunset Rhapsody",
romanization: "",
duration: "3:19"
},
{
title: "Bridge Over Troubled Water",
romanization: "",
duration: "4:10"
},
{
title: "Me Espere",
romanization: "",
duration: "3:18"
},
{
title: "Red Zone(L)",
romanization: "",
duration: "4:20"
},
{
title: "Sentimental",
romanization: "",
duration: "3:24"
},
{
title: "Access",
romanization: "",
duration: "4:24"
},
{
title: "Shadow Man",
romanization: "",
duration: "4:06"
},
{
title: "Super Sonic Movement",
romanization: "",
duration: "6:37"
},
{
title: "Magnetic Vibration",
romanization: "",
duration: "4:23"
},
{
title: "Sunca",
romanization: "",
duration: "4:35"
},
]
)
CreateAlbumWithTracks({
title: "The Party",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1990",
description: "",
flavor: "Fusion"
},
[{
title: "Cyber Zone",
romanization: "",
duration: "3:52"
},
{
title: "The Blue flame",
romanization: "",
duration: "4:07"
},
{
title: "Illusion",
romanization: "",
duration: "4:01"
},
{
title: "Nostalgia",
romanization: "",
duration: "4:39"
},
{
title: "Flush Up",
romanization: "",
duration: "4:16"
},
{
title: "Stormy Hearts",
romanization: "",
duration: "2:59"
},
{
title: "The Eyewitness",
romanization: "",
duration: "4:23"
},
{
title: "Romancing",
romanization: "",
duration: "3:35"
},
{
title: "Tokimeki",
romanization: "",
duration: "4:16"
},
{
title: "Golden Island",
romanization: "",
duration: "4:20"
},
{
title: "The Party Night",
romanization: "",
duration: "3:36"
},
{
title: "Dai Sekai",
romanization: "",
duration: "4:29"
},
]
)
CreateAlbumWithTracks({
title: "Full Colors",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1991",
description: "",
flavor: "Fusion"
},
[{
title: "Akappachi-ism",
romanization: "",
duration: "3:20"
},
{
title: "Fightman",
romanization: "",
duration: "3:17"
},
{
title: "Final Chance",
romanization: "",
duration: "3:23"
},
{
title: "Navigators",
romanization: "",
duration: "3:49"
},
{
title: "Once in a Blue Moon",
romanization: "",
duration: "3:37"
},
{
title: "Passionate Voltage",
romanization: "",
duration: "2:46"
},
{
title: "Private Sunday",
romanization: "",
duration: "3:55"
},
{
title: "Purple Hours",
romanization: "",
duration: "3:59"
},
{
title: "Search My Heart",
romanization: "",
duration: "4:40"
},
{
title: "Street of Dreams",
romanization: "",
duration: "4:21"
},
{
title: "The Sky",
romanization: "",
duration: "4:03"
},
{
title: "Top Wind",
romanization: "",
duration: "4:11"
},
]
)
CreateAlbumWithTracks({
title: "Active",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1992",
description: "",
flavor: "Fusion"
},
[{
title: "New History",
romanization: "",
duration: "4:35"
},
{
title: "Messengers",
romanization: "",
duration: "3:18"
},
{
title: "Camel Road",
romanization: "",
duration: "3:39"
},
{
title: "Eccentric Games",
romanization: "",
duration: "4:54"
},
{
title: "Time Stream",
romanization: "",
duration: "3:45"
},
{
title: "Momento Memorial",
romanization: "",
duration: "3:33"
},
{
title: "Yomoshiki",
romanization: "",
duration: "3:54"
},
{
title: "Point X",
romanization: "",
duration: "4:10"
},
{
title: "Door Of Truth",
romanization: "",
duration: "5:19"
},
{
title: "Through The Highway",
romanization: "",
duration: "3:44"
},
{
title: "Back To The Nature",
romanization: "",
duration: "4:12"
},
]
)
CreateAlbumWithTracks({
title: "Answers",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1994",
description: "",
flavor: "Fusion"
},
[{
title: "Set Sail",
romanization: "",
duration: "4:24"
},
{
title: "Fortunate Breeze",
romanization: "",
duration: "5:24"
},
{
title: "Take Courage",
romanization: "",
duration: "4:26"
},
{
title: "Living Things",
romanization: "",
duration: "4:27"
},
{
title: "Previous Matters",
romanization: "",
duration: "3:51"
},
{
title: "Warning",
romanization: "",
duration: "3:51"
},
{
title: "Dynamic Road",
romanization: "",
duration: "3:54"
},
{
title: "Surf's Up",
romanization: "",
duration: "4:39"
},
{
title: "Pal",
romanization: "",
duration: "4:07"
},
{
title: "Cool Rain",
romanization: "",
duration: "5:39"
},
{
title: "Mr. Dungeon",
romanization: "",
duration: "4:33"
},
{
title: "A Fine Day",
romanization: "",
duration: "4:32"
},
]
)
CreateAlbumWithTracks({
title: "Hearty Notes",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1994",
description: "",
flavor: "Fusion"
},
[{
title: "Sweet Vision",
romanization: "",
duration: "4:42"
},
{
title: "Dazzling",
romanization: "",
duration: "4:20"
},
{
title: "Justice",
romanization: "",
duration: "4:09"
},
{
title: "Pleasure",
romanization: "",
duration: "3:33"
},
{
title: "Believe Again",
romanization: "",
duration: "3:48"
},
{
title: "Distance To Paradise",
romanization: "",
duration: "4:26"
},
{
title: "Sombrero",
romanization: "",
duration: "3:49"
},
{
title: "So Long",
romanization: "",
duration: "5:20"
},
{
title: "Magic Ray",
romanization: "",
duration: "4:17"
},
{
title: "Shinning Voyage",
romanization: "",
duration: "3:47"
},
]
)
CreateAlbumWithTracks({
title: "Freshness",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1995",
description: "",
flavor: "Fusion"
},
[{
title: "Hello There",
romanization: "",
duration: "5:08"
},
{
title: "Keep Ahead",
romanization: "",
duration: "4:43"
},
{
title: "Hard Boiled",
romanization: "",
duration: "4:12"
},
{
title: "Juicy Jam",
romanization: "",
duration: "5:54"
},
{
title: "Intensive Way",
romanization: "",
duration: "4:35"
},
{
title: "Heat Haze",
romanization: "",
duration: "4:13"
},
{
title: "Ihilani",
romanization: "",
duration: "3:45"
},
{
title: "Star Carousel",
romanization: "",
duration: "4:00"
},
{
title: "Coastal Dreaming",
romanization: "",
duration: "3:52"
},
{
title: "Loop Of Magic",
romanization: "",
duration: "3:53"
},
{
title: "Sleek Passage",
romanization: "",
duration: "4:18"
},
]
)
CreateAlbumWithTracks({
title: "Work In",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1995",
description: "",
flavor: "Fusion"
},
[{
title: "Black Joke",
romanization: "",
duration: "4:18"
},
{
title: "Asayake",
romanization: "",
duration: "5:06"
},
{
title: "I Love N.Y.",
romanization: "",
duration: "4:08"
},
{
title: "Swear",
romanization: "",
duration: "5:23"
},
{
title: "Swear",
romanization: "",
duration: "5:23"
},
{
title: "Looking Up",
romanization: "",
duration: "4:26"
},
{
title: "Step Daughter",
romanization: "",
duration: "3:47"
},
{
title: "The Soundgraphy",
romanization: "",
duration: "3:45"
},
{
title: "Down Upbeat",
romanization: "",
duration: "3:57"
},
{
title: "Touch The Rainbow",
romanization: "",
duration: "2:28"
},
{
title: "After School",
romanization: "",
duration: "3:34"
},
{
title: "Something's Wrong",
romanization: "",
duration: "4:32"
},
{
title: "Glory",
romanization: "",
duration: "4:05"
},
{
title: "Set Sail",
romanization: "",
duration: "4:21"
},
]
)
CreateAlbumWithTracks({
title: "Light and Shadows",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1997",
description: "",
flavor: "Fusion"
},
[{
title: "Golden Waves",
romanization: "",
duration: "5:23"
},
{
title: "Forbidden Fruits",
romanization: "",
duration: "4:36"
},
{
title: "Chain Reaction",
romanization: "",
duration: "4:01"
},
{
title: "Missing Days",
romanization: "",
duration: "5:36"
},
{
title: "Speeded Age",
romanization: "",
duration: "4:44"
},
{
title: "The Tease",
romanization: "",
duration: "4:45"
},
{
title: "Don't Leave Me Alone",
romanization: "",
duration: "5:23"
},
{
title: "Movin'",
romanization: "",
duration: "5:32"
},
{
title: "The Smile of Tender",
romanization: "",
duration: "5:47"
},
{
title: "Riddle",
romanization: "",
duration: "4:17"
},
{
title: "A Dressy Morning",
romanization: "",
duration: "4:28"
},
]
)
CreateAlbumWithTracks({
title: "Be",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "1999",
description: "",
flavor: "Fusion"
},
[{
title: "Dream Maker",
romanization: "",
duration: "5:44"
},
{
title: "Purple Bird",
romanization: "",
duration: "4:48"
},
{
title: "Hole Heartedly",
romanization: "",
duration: "4:34"
},
{
title: "Treasure",
romanization: "",
duration: "5:15"
},
{
title: "Yours Lovingly",
romanization: "",
duration: "4:18"
},
{
title: "All The Time",
romanization: "",
duration: "4:59"
},
{
title: "Third Possiblity",
romanization: "",
duration: "4:44"
},
{
title: "Final Matter",
romanization: "",
duration: "3:39"
},
{
title: "Night Breeze",
romanization: "",
duration: "5:13"
},
{
title: "Day Of Selection",
romanization: "",
duration: "4:12"
},
{
title: "Let It Rain",
romanization: "",
duration: "5:22"
},
{
title: "Inner Child",
romanization: "",
duration: "6:08"
},
]
)
CreateAlbumWithTracks({
title: "Bitter Sweet",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "2000",
description: "",
flavor: "Fusion"
},
[{
title: "Go On!",
romanization: "",
duration: "4:21"
},
{
title: "Pick Up the Good One",
romanization: "",
duration: "4:18"
},
{
title: "Acid Rain",
romanization: "",
duration: "5:11"
},
{
title: "Rouge",
romanization: "",
duration: "4:23"
},
{
title: "Hard Worker",
romanization: "",
duration: "4:04"
},
{
title: "Sentimental Things",
romanization: "",
duration: "4:56"
},
{
title: "Give Me Your Love",
romanization: "",
duration: "4:40"
},
{
title: "Side Walk",
romanization: "",
duration: "3:49"
},
{
title: "It's a Long Story",
romanization: "",
duration: "4:52"
},
{
title: "Tight Line",
romanization: "",
duration: "3:41"
},
]
)
CreateAlbumWithTracks({
title: "Marble",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "2005",
description: "",
flavor: "Fusion"
},
[{
title: "Universe",
romanization: "",
duration: "25:08"
},
{
title: "Southern Breeze",
romanization: "",
duration: "4:22"
},
{
title: "Mawari-Michi",
romanization: "",
duration: "4:38"
},
{
title: "Reminiscence",
romanization: "",
duration: "5:41"
},
{
title: "When You Grow Up",
romanization: "",
duration: "3:47"
},
{
title: "Blessing",
romanization: "",
duration: "4:37"
},
{
title: "Japanese Title",
romanization: "",
duration: "4:33"
},
{
title: "Spread",
romanization: "",
duration: "4:11"
},
]
)
CreateAlbumWithTracks({
title: "Gentle & Mellow",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "2006",
description: "",
flavor: "Fusion, Compilation"
},
[{
title: "Tokyo Sunset",
romanization: "",
duration: "5:25"
},
{
title: "Supremely",
romanization: "",
duration: "4:52"
},
{
title: "May Fly",
romanization: "",
duration: "3:49"
},
{
title: "Liquid Eyes",
romanization: "",
duration: "4:37"
},
{
title: "Give Me Your Love",
romanization: "",
duration: "4:38"
},
{
title: "Rouge",
romanization: "",
duration: "4:20"
},
{
title: "Southern Breeze",
romanization: "",
duration: "4:21"
},
{
title: "Wa Su Re Mo No",
romanization: "",
duration: "4:24"
},
{
title: "It's A Long Story",
romanization: "",
duration: "4:49"
},
{
title: "Will You Love Me Tomorrow",
romanization: "",
duration: "5:17"
},
{
title: "When  You Grow Up",
romanization: "",
duration: "3:44"
},
{
title: "Cry With Terra",
romanization: "",
duration: "5:13"
},
{
title: "My Native Place",
romanization: "",
duration: "3:44"
},
{
title: "Life Long Serenade",
romanization: "",
duration: "6:03"
},
]
)
CreateAlbumWithTracks({
title: "Groove & Passion",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "2006",
description: "",
flavor: "Fusion, Compilation"
},
[{
title: "Asayake",
romanization: "",
duration: "5:38"
},
{
title: "Good Luck!",
romanization: "",
duration: "4:36"
},
{
title: "Dazzling",
romanization: "",
duration: "4:05"
},
{
title: "Tokimeki",
romanization: "",
duration: "4:26"
},
{
title: "Sprinter",
romanization: "",
duration: "5:25"
},
{
title: "Looking Up",
romanization: "",
duration: "4:37"
},
{
title: "Fightman",
romanization: "",
duration: "5:55"
},
{
title: "Halle",
romanization: "",
duration: "3:39"
},
{
title: "Akappachi-Ism",
romanization: "",
duration: "3:09"
},
{
title: "Domino Line",
romanization: "",
duration: "4:43"
},
{
title: "Mid-Manhattan",
romanization: "",
duration: "4:02"
},
{
title: "Universe",
romanization: "",
duration: "24:16"
},
]
)
CreateAlbumWithTracks({
title: "Signal",
romanization: "",
romaji_artist: "Casiopea",
japanese_artist: "",
year: "2006",
description: "",
flavor: "Fusion"
},
[{
title: "Awaken",
romanization: "",
duration: "6:09"
},
{
title: "Mist",
romanization: "",
duration: "5:11"
},
{
title: "Kokoro-Ck",
romanization: "",
duration: "4:35"
},
{
title: "Will",
romanization: "",
duration: "5:19"
},
{
title: "Escalation",
romanization: "",
duration: "4:42"
},
{
title: "Asobi",
romanization: "",
duration: "4:20"
},
{
title: "Life",
romanization: "",
duration: "6:09"
},
{
title: "Pity",
romanization: "",
duration: "3:57"
},
{
title: "Ardent",
romanization: "",
duration: "3:44"
},
{
title: "Past",
romanization: "",
duration: "11:47"
},
])


# New batch (Mioko Yamaguchi)


CreateAlbumWithTracks({
title: "夢飛行",
romanization: "Yume Hiko",
romaji_artist: "Mioko Yamaguchi",
japanese_artist: "山口美央子",
year: "1980",
description: "Debut LP of Yamaguchi Mioko's brief solo career.",
flavor: "Techno Kayo, Electronic"
},
[{
title: "アラビアン・ラプソディ",
romanization: "Arabian Rhapsody",
duration: "3:05"
},
{
title: "東京Lover",
romanization: "Tokyo Lover",
duration: "3:54"
},
{
title: "陽だまりの中で",
romanization: "Hidamari No Naka De",
duration: "3:12"
},
{
title: "A Dream OF Eu",
romanization: "",
duration: "1:09"
},
{
title: "お祭り",
romanization: "Omatsuri",
duration: "4:38"
},
{
title: "いつかゆられて遠い国",
romanization: "Itsuka Yurarete Toi Kuni",
duration: "3:04"
},
{
title: "A Dream of Mio",
romanization: "",
duration: "0:28"
},
{
title: "夢飛行",
romanization: "Yume Hiko",
duration: "3:38"
},
{
title: "ある夜の出来事",
romanization: "Aru Yo No Dekigoto",
duration: "3:18"
},
{
title: "恋のエアプレイ",
romanization: "Koi No Air Play",
duration: "3:29"
},
{
title: "ワルツ（流舞）",
romanization: "Waltz",
duration: "6:18"
},
{
title: "パラダイス",
romanization: "Paradise",
duration: "3:48"
},
])


# New batch (Hiromi Iwasaki)


CreateAlbumWithTracks({
title: "あおぞら",
romanization: "Aozora",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "1975",
description: "Hiromi's debut album.",
flavor: "Disco, Idol"
},
[{
title: "ロマンス",
romanization: "Romance",
duration: "3:21"
},
{
title: "はだしの散歩",
romanization: "Hadashi no Sanpo",
duration: "3:26"
},
{
title: "ささやき",
romanization: "Sasayaki",
duration: "3:36"
},
{
title: "私たち",
romanization: "Watashitachi",
duration: "3:36"
},
{
title: "二重唱",
romanization: "Nijūshō",
duration: "3:01"
},
{
title: "空を駈ける恋",
romanization: "Sora o Kakeru Koi",
duration: "3:11"
},
{
title: "愛をこめて",
romanization: "Ai o Komete",
duration: "2:38"
},
{
title: "涙のペア・ルック",
romanization: "Namida no Pair Look",
duration: "3:34"
},
{
title: "月見草",
romanization: "Tsukimisō",
duration: "3:16"
},
{
title: "美しいあなた",
romanization: "Utsukushī Anata",
duration: "2:52"
},
{
title: "この広い空の下",
romanization: "Kono Hiroi Sora no Shita",
duration: "3:35"
},
]
)
CreateAlbumWithTracks({
title: "ファンタジー",
romanization: "Fantasy",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "1976",
description: "",
flavor: "Disco, Idol"
},
[{
title: "パピヨン",
romanization: "Papillon",
duration: "3:58"
},
{
title: "キャンパス・ガール",
romanization: "Campus Girl",
duration: "3:16"
},
{
title: "ファンタジー",
romanization: "Fantasy",
duration: "3:01"
},
{
title: "愛よ、おやすみ",
romanization: "Ai yo, oyasumi",
duration: "2:48"
},
{
title: "感傷的",
romanization: "Kanshoudeki",
duration: "3:15"
},
{
title: "おしゃれな感情",
romanization: "Osharena Kanjō",
duration: "3:49"
},
{
title: "ひとりぼっちの部屋",
romanization: "Hitori Botchi no Heya",
duration: "3:42"
},
{
title: "グッド・ナイト",
romanization: "Good Night",
duration: "5:11"
},
{
title: "月のしずくで",
romanization: "Tsukinoshizuku de",
duration: "3:39"
},
{
title: "センチメンタル",
romanization: "Sentimental",
duration: "3:26"
},
]
)
CreateAlbumWithTracks({
title: "飛行船",
romanization: "Hikōsen",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "1976",
description: "",
flavor: "Disco, Idol"
},
[{
title: "未来",
romanization: "Mirai",
duration: "3:18"
},
{
title: "地平線の彼方",
romanization: "Chiheisen no Kanata",
duration: "3:49"
},
{
title: "サマー・グラフィティ",
romanization: "Summer Graffiti",
duration: "3:03"
},
{
title: "ワンウェイ・ラブ",
romanization: "One Way Love",
duration: "4:00"
},
{
title: "夏からのメッセージ",
romanization: "Natsu kara no Message",
duration: "3:56"
},
{
title: "ケン待っててあげる",
romanization: "Ken Mattete Ageru",
duration: "3:36"
},
{
title: "霧の日の出来事",
romanization: "Kiri no hi no Dekigoto",
duration: "4:04"
},
{
title: "さよならがビショビショ",
romanization: "Sayonara ga Bishobisho",
duration: "3:34"
},
{
title: "美しい夏",
romanization: "Utsukushī Natsu",
duration: "4:35"
},
{
title: "愛の飛行船",
romanization: "Ai no Hikōsen",
duration: "4:42"
},
]
)
CreateAlbumWithTracks({
title: "ウィズ・ベスト・フレンズ",
romanization: "With Best Friends",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "1977",
description: "",
flavor: "Disco, Idol"
},
[{
title: "悲恋白書",
romanization: "Hirenhakusho",
duration: "3:10"
},
{
title: "砂の慕情",
romanization: "Suna no Bojō",
duration: "3:39"
},
{
title: "メランコリー日記",
romanization: "Melancholy Diary",
duration: "3:24"
},
{
title: "わたしの1095日",
romanization: "Watashi no 1095-nichi",
duration: "3:27"
},
{
title: "平行線",
romanization: "Heikōsen",
duration: "3:54"
},
{
title: "学生街の四季",
romanization: "Gakusei-gai no Shiki",
duration: "3:56"
},
{
title: "パパにそむいて",
romanization: "Papa ni Somuite",
duration: "4:01"
},
{
title: "コンサート",
romanization: "Concert",
duration: "3:24"
},
{
title: "花のことづけ",
romanization: "Hana no Koto Dzuke",
duration: "3:44"
},
{
title: "想い出の樹の下で",
romanization: "Omoidenokinoshitade",
duration: "3:36"
},
{
title: "愛をどうぞ",
romanization: "Ai o dōzo",
duration: "3:38"
},
{
title: "さよならそして自由へ",
romanization: "Sayonara Soshite Jiyū e",
duration: "3:56"
},
]
)
CreateAlbumWithTracks({
title: "思秋期から......男と女",
romanization: "Shishūki Kara... Otome",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "1977",
description: "",
flavor: "Disco, Idol"
},
[{
title: "思秋期",
romanization: "Shishuuki",
duration: "4:19"
},
{
title: "ランボルギーニが消えて",
romanization: "Lamborghini Ni Ga Kite",
duration: "5:05"
},
{
title: "男と女",
romanization: "Otoko To Onna",
duration: "3:36"
},
{
title: "恋夏期",
romanization: "Koi Kaki",
duration: "4:01"
},
{
title: "個人指導",
romanization: "Kojin Shidou",
duration: "2:49"
},
{
title: "煙草の匂いがする",
romanization: "Tabako No Ni Oi Gasaru",
duration: "3:39"
},
{
title: "メランコリー・ジュース",
romanization: "Melancholy Juice",
duration: "3:13"
},
{
title: "幸福号出帆",
romanization: "Koufuku Go Shuppan",
duration: "3:31"
},
{
title: "チェイス",
romanization: "Chase",
duration: "3:28"
},
{
title: "ピアノ弾きが泣かせた",
romanization: "Piano Hiki Ga Naka Seta",
duration: "4:05"
},
{
title: "ウエルカム・ホテル",
romanization: "Welcome Hotel",
duration: "4:04"
},
{
title: "Boo Boo",
romanization: "",
duration: "3:50"
},
]
)
CreateAlbumWithTracks({
title: "パンドラの小箱",
romanization: "Pandora no Kobako",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "1978",
description: "",
flavor: "Disco, Idol"
},
[{
title: "媚薬",
romanization: "",
duration: "4:11"
},
{
title: "パンドラの小箱",
romanization: "",
duration: "4:27"
},
{
title: "コントラスト",
romanization: "",
duration: "3:18"
},
{
title: "パンドラの小箱（バリエーション）",
romanization: "",
duration: "0:19"
},
{
title: "ピラミッド",
romanization: "",
duration: "3:57"
},
{
title: "カンバセーション",
romanization: "",
duration: "5:14"
},
{
title: "シンデレラ・ハネムーン",
romanization: "",
duration: "4:01"
},
{
title: "想い出は９月ゆき",
romanization: "",
duration: "3:58"
},
{
title: "ミスター・パズル",
romanization: "",
duration: "3:33"
},
{
title: "L",
romanization: "",
duration: "3:08"
},
{
title: "南南西の風の中で",
romanization: "",
duration: "3:47"
},
{
title: "パンドラの小箱（リプライズ）",
romanization: "",
duration: "0:37"
},
]
)
CreateAlbumWithTracks({
title: "二十才前・・・",
romanization: "Nijuusai mae",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "1978",
description: "",
flavor: "Disco, Idol"
},
[{
title: "二十才前",
romanization: "",
duration: "3:55"
},
{
title: "クエッション・マーク",
romanization: "",
duration: "3:32"
},
{
title: "熱帯魚",
romanization: "",
duration: "3:27"
},
{
title: "夏のたまり場",
romanization: "",
duration: "3:14"
},
{
title: "ニッカ・ボッカ",
romanization: "",
duration: "3:18"
},
{
title: "ザ・マン",
romanization: "",
duration: "4:01"
},
{
title: "何かが起こりそうな朝",
romanization: "",
duration: "4:32"
},
{
title: "季節のかほり",
romanization: "",
duration: "2:39"
},
{
title: "つめたい抱擁",
romanization: "",
duration: "3:41"
},
{
title: "ヴェニスの花嫁",
romanization: "",
duration: "4:02"
},
{
title: "暁",
romanization: "",
duration: "3:53"
},
{
title: "今様つづり",
romanization: "",
duration: "3:54"
},
]
)
CreateAlbumWithTracks({
title: "恋人たち",
romanization: "Koibito-tachi",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "1979",
description: "",
flavor: "Disco, Idol"
},
[{
title: "恋人たち",
romanization: "Koibito-tachi",
duration: "3:59"
},
{
title: "白いバラ",
romanization: "",
duration: "4:11"
},
{
title: "シェルブールの雨傘",
romanization: "",
duration: "3:15"
},
{
title: "ラ・ボエーム",
romanization: "",
duration: "3:13"
},
{
title: "黒いオルフェ",
romanization: "",
duration: "3:02"
},
{
title: "この想いをあなただけに",
romanization: "",
duration: "3:15"
},
{
title: "行かないで",
romanization: "",
duration: "3:53"
},
{
title: "禁じられた遊び",
romanization: "",
duration: "2:52"
},
{
title: "マイ・ラブ",
romanization: "",
duration: "3:43"
},
{
title: "白い恋人たち",
romanization: "",
duration: "2:53"
},
{
title: "思い出さないで",
romanization: "",
duration: "4:19"
},
]
)
CreateAlbumWithTracks({
title: "Wish",
romanization: "",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "1980",
description: "",
flavor: "Disco, Idol"
},
[{
title: "Wishes",
romanization: "",
duration: "1:15"
},
{
title: "五線紙のカウボーイ",
romanization: "Gosenshi no kaubōi",
duration: "4:01"
},
{
title: "Sympathy",
romanization: "",
duration: "4:18"
},
{
title: "Street Dancer",
romanization: "",
duration: "5:11"
},
{
title: "Kiss Again",
romanization: "",
duration: "5:13"
},
{
title: "Half Moon",
romanization: "",
duration: "4:25"
},
{
title: "女優",
romanization: "Joyū",
duration: "4:25"
},
{
title: "Rose",
romanization: "",
duration: "4:23"
},
{
title: "処女航海",
romanization: "Shojo kōkai",
duration: "4:27"
},
{
title: "夕凪海岸",
romanization: "Yūnagi kaigan",
duration: "4:35"
},
{
title: "最後の旅",
romanization: "Saigo no tabi",
duration: "4:04"
},
]
)
CreateAlbumWithTracks({
title: "すみれ色の涙から・・",
romanization: "Sumireirononamida kara",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "1981",
description: "",
flavor: "Disco, Idol"
},
[{
title: "すみれ色の涙",
romanization: "Sumireirononamida",
duration: "2:55"
},
{
title: "卒業写真",
romanization: "Sotsugyō Shashin",
duration: "4:16"
},
{
title: "サルビアの花",
romanization: "Sarubia no Hana",
duration: "4:37"
},
{
title: "20才のめぐり逢い",
romanization: "20-Sai no Meguri Ai",
duration: "4:08"
},
{
title: "吟遊詩人の唄(One Man Band)",
romanization: "Gin'yūshijin no Uta (One Man Band)",
duration: "3:42"
},
{
title: "さよならをするために",
romanization: "Sayonara o Suru Tame Ni",
duration: "3:10"
},
{
title: "街の灯り",
romanization: "Machi no Akari",
duration: "4:06"
},
{
title: "少しは私に愛を下さい",
romanization: "Sukoshi wa Watashi ni Ai o Kudasai",
duration: "3:58"
},
{
title: "ともしび",
romanization: "To Moshi Bi",
duration: "3:53"
},
{
title: "夢で逢えたら",
romanization: "Yumedeaetara",
duration: "3:37"
},
{
title: "空に星があるように",
romanization: "Soranihoshigāruyōni",
duration: "3:40"
},
]
)
CreateAlbumWithTracks({
title: "夕暮れから…ひとり",
romanization: "Yūgure kara… Hitori",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "1982",
description: "",
flavor: "Disco, Idol"
},
[{
title: "檸檬",
romanization: "Remon",
duration: "3:15"
},
{
title: "飛ばして, Taxi",
romanization: "Tobashite, Taxi",
duration: "4:09"
},
{
title: "恋は戦争",
romanization: "Koihasensō",
duration: "4:03"
},
{
title: "夜明けのない朝",
romanization: "Yoake no Nai Asa",
duration: "3:47"
},
{
title: "Single man",
romanization: "",
duration: "4:53"
},
{
title: "China reef",
romanization: "",
duration: "3:29"
},
{
title: "エトランゼ",
romanization: "Etoranze",
duration: "4:36"
},
{
title: "52階のオフ・ステージ",
romanization: "52-Kai no Off-stage",
duration: "4:33"
},
{
title: "ハートブレイク・トワイライト",
romanization: "Heartbreak Twilight",
duration: "4:15"
},
{
title: "聖母たちのララバイ",
romanization: "Seibo-tachi no Lullaby",
duration: "4:28"
},
{
title: "れんげ草の恋",
romanization: "Rengesōnokoi",
duration: "4:06"
},
{
title: "悲しみのほとり",
romanization: "Kanashimi no Hotori",
duration: "3:59"
},
{
title: "影絵（シルエット）",
romanization: "Kagee (Silhouette)",
duration: "3:52"
},
]
)
CreateAlbumWithTracks({
title: "私・的・空・間",
romanization: "",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "1983",
description: "",
flavor: "Disco, Idol"
},
[{
title: "真珠のピリオド",
romanization: "Shinju no Period",
duration: "3:51"
},
{
title: "無口なヴィーナス",
romanization: "Mukuchina Venus",
duration: "4:14"
},
{
title: "二人の午後に",
romanization: "Futari no Gogo Ni",
duration: "4:18"
},
{
title: "テンペスト",
romanization: "Tempest",
duration: "4:10"
},
{
title: "わたしに戻るとき",
romanization: "Watashi ni Modoru Toki",
duration: "3:30"
},
{
title: "素敵な気持ち",
romanization: "Sutekinakimochi",
duration: "3:59"
},
{
title: "ことづけ",
romanization: "Kotodzuke",
duration: "4:14"
},
{
title: "Morning Breeze",
romanization: "",
duration: "4:32"
},
{
title: "生きがい",
romanization: "Ikigai",
duration: "4:40"
},
{
title: "日暮れのマティーニ",
romanization: "Higure no Mattini",
duration: "5:09"
},
{
title: "Waiting",
romanization: "",
duration: "3:40"
},
{
title: "夜明けの天使たち",
romanization: "Yoake no Tenshi-tachi",
duration: "2:53"
},
]
)
CreateAlbumWithTracks({
title: "Me Too",
romanization: "",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "1988",
description: "",
flavor: "Disco, Idol"
},
[{
title: "Dance With A Loneliness",
romanization: "",
duration: "4:43"
},
{
title: "私らしく",
romanization: "Watashirashiku",
duration: "4:31"
},
{
title: "Southern Wind",
romanization: "",
duration: "4:36"
},
{
title: "Interval",
romanization: "",
duration: "4:35"
},
{
title: "I Miss You So Long（さよならもいいね）",
romanization: "I Miss You So Long (Sayonara mo ī ne)",
duration: "5:28"
},
{
title: "聞こえてくるラプソディー",
romanization: "Kikoete Kuru Rhapsody",
duration: "5:04"
},
{
title: "最初広いbedに座った",
romanization: "Saisho Hiroi Bed ni Suwatta",
duration: "5:21"
},
{
title: "あなたのいらだちと私の理由",
romanization: "Anata no Iradachi to Watashi no Riyū",
duration: "4:33"
},
{
title: "唐突",
romanization: "Tōtotsu",
duration: "3:53"
},
{
title: "さよなら夏のリサ",
romanization: "Sayonara Natsu no Lisa",
duration: "5:34"
},
{
title: "未成年",
romanization: "Miseinen",
duration: "4:22"
},
{
title: "透きとおった時間",
romanization: "Sukitōtta Jikan",
duration: "4:23"
},
{
title: "夢見るように愛したい",
romanization: "Yumemiru yō ni Aishitai",
duration: "4:08"
},
]
)
CreateAlbumWithTracks({
title: "ゆりかごのうたいわさきひろみあいしょうかしゅう",
romanization: "Yurikago no Uta Iwasaki Hiromi Aishouka Shuu",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "1991",
description: "",
flavor: "Disco, Idol"
},
[{
title: "Akatonbo",
romanization: "",
duration: "3:45"
},
{
title: "Nanatsu No Ko",
romanization: "",
duration: "3:53"
},
{
title: "Ryoshuu",
romanization: "",
duration: "4:21"
},
{
title: "Hanayome Ningyou",
romanization: "",
duration: "2:43"
},
{
title: "Shikararete",
romanization: "",
duration: "3:28"
},
{
title: "Yashi No Jitsu",
romanization: "",
duration: "5:28"
},
{
title: "Chiisai Aki Mitsuketa",
romanization: "",
duration: "3:36"
},
{
title: "Fuyu No Yoru",
romanization: "",
duration: "2:42"
},
{
title: "Kaasan No Uta",
romanization: "",
duration: "3:32"
},
{
title: "Yuki No Furu Machi Wo",
romanization: "",
duration: "3:25"
},
{
title: "Pechika",
romanization: "",
duration: "3:23"
},
{
title: "Fuyu Keshiki",
romanization: "",
duration: "4:51"
},
{
title: "Chuugoku Chihou No Komori Uta",
romanization: "",
duration: "4:13"
},
{
title: "Hana",
romanization: "",
duration: "3:26"
},
{
title: "Sakura Sakura",
romanization: "",
duration: "3:25"
},
{
title: "Shussen",
romanization: "",
duration: "3:52"
},
{
title: "Yuri Kago No Uta",
romanization: "",
duration: "4:34"
},
{
title: "Haruno Uta",
romanization: "",
duration: "4:06"
},
{
title: "Hamabe No Uta",
romanization: "",
duration: "3:58"
},
]
)
CreateAlbumWithTracks({
title: "My Gratitude -Kansha-",
romanization: "",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "1995",
description: "",
flavor: "Disco, Idol"
},
[{
title: "Mouichido",
romanization: "",
duration: "5:07"
},
{
title: "Waiting",
romanization: "",
duration: "3:31"
},
{
title: "When I Fall In Love",
romanization: "",
duration: "3:29"
},
{
title: "Soba Ni Oite",
romanization: "",
duration: "4:30"
},
{
title: "Sumireiro No Namida",
romanization: "",
duration: "3:08"
},
{
title: "Gratitude",
romanization: "",
duration: "4:30"
},
{
title: "Wishes",
romanization: "",
duration: "2:59"
},
{
title: "One Day In Your Life",
romanization: "",
duration: "4:41"
},
{
title: "Shishuuki",
romanization: "",
duration: "4:48"
},
{
title: "Seibo Tachi No Lullaby",
romanization: "",
duration: "4:37"
},
{
title: "Someone To Watch Over Me",
romanization: "",
duration: "5:56"
},
]
)
CreateAlbumWithTracks({
title: "Shower Of Love",
romanization: "",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "1997",
description: "",
flavor: "Disco, Idol"
},
[{
title: "愛がいっぱい",
romanization: "Aigaippai",
duration: "5:15"
},
{
title: "そっと愛して",
romanization: "Sotto Aishite",
duration: "5:51"
},
{
title: "(I Look) In Your Eyes",
romanization: "",
duration: "4:53"
},
{
title: "時の向こうがわ",
romanization: "Toki no Mukō ga wa",
duration: "5:49"
},
{
title: "Pain",
romanization: "",
duration: "3:54"
},
{
title: "Rain 〜告白",
romanization: "Rain 〜 kokuhaku",
duration: "4:17"
},
{
title: "笑顔を見せて",
romanization: "Egaowomisete",
duration: "5:18"
},
{
title: "最後の愛で",
romanization: "Saigo no Ai de",
duration: "5:28"
},
{
title: "たったひとつだけ",
romanization: "Tatta Hitotsu Dake",
duration: "4:42"
},
]
)
CreateAlbumWithTracks({
title: "Never Again ~許さない~",
romanization: "Never Again ~Yurusanai~",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "1999",
description: "",
flavor: "Disco, Idol"
},
[{
title: "あなたへ",
romanization: "Anata He",
duration: "4:27"
},
{
title: "素敵な気持ち",
romanization: "Suteki Na Kimochi",
duration: "5:08"
},
{
title: "Sympathy",
romanization: "",
duration: "4:18"
},
{
title: "わたしの1095日",
romanization: "Watashi No Senkyuujuugo Nichi",
duration: "4:06"
},
{
title: "想い出の樹の下で",
romanization: "Omoide No Ki No Shita De",
duration: "4:21"
},
{
title: "女優",
romanization: "Joy",
duration: "5:08"
},
{
title: "春おぼろ",
romanization: "Haru Oboro",
duration: "4:07"
},
{
title: "月見草",
romanization: "Tsukimisou",
duration: "3:47"
},
{
title: "許さない",
romanization: "Yurusanai",
duration: "5:00"
},
{
title: "日暮れのマティーニ",
romanization: "Higure No Martini",
duration: "5:33"
},
]
)
CreateAlbumWithTracks({
title: "Dear Friends IV",
romanization: "",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "2008",
description: "",
flavor: "Disco, Idol"
},
[{
title: "明日",
romanization: "Ashita",
duration: "4:34"
},
{
title: "糸",
romanization: "Ito",
duration: "4:34"
},
{
title: "夢で逢えたら",
romanization: "Yume de Aetara",
duration: "3:56"
},
{
title: "別れの予感",
romanization: "Wakare no Yokan",
duration: "4:12"
},
{
title: "上を向いて歩こう",
romanization: "Uewomuitearukō",
duration: "4:30"
},
{
title: "千の風になって",
romanization: "Sen no Kaze ni Natte",
duration: "5:12"
},
{
title: "飾りじゃないのよ涙は",
romanization: "Kazari janai no yonamidaha",
duration: "5:20"
},
{
title: "会いたい",
romanization: "Aitai",
duration: "4:48"
},
{
title: "フィーリング",
romanization: "Feeling",
duration: "3:50"
},
{
title: "Pride",
romanization: "",
duration: "6:39"
},
{
title: "人生の贈り物 ～他に望むものはない～",
romanization: "Jinsei no Okurimono ~ Hoka ni Nozomu Mono Wanai ~",
duration: "8:02"
},
{
title: "思秋期",
romanization: "",
duration: "5:41"
},
]
)
CreateAlbumWithTracks({
title: "Full Circle",
romanization: "",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "2010",
description: "",
flavor: "Disco, Idol"
},
[{
title: "Full Circle",
romanization: "",
duration: "2:52"
},
{
title: "Birth",
romanization: "",
duration: "6:04"
},
{
title: "時間(とき)の早さに",
romanization: "Jikan (Toki) no Haya-sa ni",
duration: "5:49"
},
{
title: "(Interlude)ロマンス",
romanization: "(Interlude) Romance",
duration: "0:56"
},
{
title: "Never be the Same",
romanization: "",
duration: "5:46"
},
{
title: "朝が来るまで",
romanization: "Asagakurumade",
duration: "5:39"
},
{
title: "Dream On",
romanization: "",
duration: "5:09"
},
{
title: "潮風がつぶやいて",
romanization: "Shiokaze ga tsubuyaite",
duration: "5:19"
},
{
title: "(Interlude)想い出の樹の下で",
romanization: "(Interlude) Omoidenokinoshitade",
duration: "1:51"
},
{
title: "Extraordinary",
romanization: "",
duration: "5:01"
},
{
title: "Back Together Again",
romanization: "",
duration: "5:23"
},
{
title: "One Day, Some Way",
romanization: "",
duration: "5:48"
},
{
title: "窓",
romanization: "Mado",
duration: "5:17"
},
{
title: "Full Circle",
romanization: "",
duration: "2:46"
},
{
title: "舞踏会",
romanization: "Budōkai",
duration: "4:39"
},
]
)
CreateAlbumWithTracks({
title: "Love",
romanization: "",
romaji_artist: "Hiromi Iwasaki",
japanese_artist: "岩崎宏美",
year: "2013",
description: "",
flavor: "Disco, Idol"
},
[{
title: "タペストリー",
romanization: "Tapestry",
duration: "5:54"
},
{
title: "抱きしめてよ、ミラクル",
romanization: "Dakishimete yo, Miracle",
duration: "3:49"
},
{
title: "Love",
romanization: "",
duration: "4:39"
},
{
title: "プロポーズのとき",
romanization: "Puropōzu no Toki",
duration: "4:50"
},
{
title: "時の針",
romanization: "Toki no Hari",
duration: "5:56"
},
{
title: "ベリー",
romanization: "Berry",
duration: "3:53"
},
{
title: "明日、笑顔で",
romanization: "Ashita, Egao de",
duration: "5:03"
},
{
title: "糸遊(かげろう)",
romanization: "Shiyū (kagerō)",
duration: "3:18"
},
{
title: "ケセラ~愛のためのいくつかの法則~",
romanization: "Quecera ~ Ai no Tame no Ikutsu ka no Hōsoku ~",
duration: "4:26"
},
{
title: "あなたにだから",
romanization: "Anata ni Dakara",
duration: "5:31"
},
])


# New batch (Yoshimi Iwasaki)


CreateAlbumWithTracks({
title: "Ring-a-Ding",
romanization: "",
romaji_artist: "Yoshimi Iwasaki",
japanese_artist: "岩崎良美",
year: "1980",
description: "Yoshimi Iwasaki's debut album.",
flavor: "Disco, Idol"
},
[{
title: "恋するローレライ",
romanization: "Koisuru Lorelei",
duration: "4:23"
},
{
title: "涼風",
romanization: "Suzukaze",
duration: "4:45"
},
{
title: "学生たちの森",
romanization: "Gakusei-tachi no Mori",
duration: "4:25"
},
{
title: "夏のたより",
romanization: "Natsu no Tayori",
duration: "4:41"
},
{
title: "Ring-a-Ding",
romanization: "",
duration: "4:03"
},
{
title: "私の名はアリス",
romanization: "Watashi no na wa Arisu",
duration: "3:48"
},
{
title: "赤と黒",
romanization: "Aka to Kuro",
duration: "4:31"
},
{
title: "モーニング コール",
romanization: "Morning Call",
duration: "4:24"
},
{
title: "赤いアンブレラ",
romanization: "Akai Umbrella",
duration: "4:10"
},
{
title: "ウキウキWalkin'",
romanization: "Ukiuki Walkin'",
duration: "4:32"
},
{
title: "旅立つ少女",
romanization: "Tabidatsu Shōjo",
duration: "3:44"
},
]
)
CreateAlbumWithTracks({
title: "Saisons",
romanization: "",
romaji_artist: "Yoshimi Iwasaki",
japanese_artist: "岩崎良美",
year: "1980",
description: "",
flavor: "Disco, Idol"
},
[{
title: "Waiting For You",
romanization: "",
duration: "4:50"
},
{
title: "小雨模様",
romanization: "Ko Amamoyō",
duration: "3:33"
},
{
title: "クライマックス",
romanization: "Climax",
duration: "4:10"
},
{
title: "愛情物語",
romanization: "Aijō Monogatari",
duration: "4:10"
},
{
title: "あなた色のマノン",
romanization: "Anatairo no Manon",
duration: "3:40"
},
{
title: "ためらい",
romanization: "Tamerai",
duration: "3:45"
},
{
title: "揺れて純愛",
romanization: "Yurete Jun'ai",
duration: "4:12"
},
{
title: "春一番を待ちわびて",
romanization: "Haruichiban o Machiwabite",
duration: "3:33"
},
{
title: "田園交響楽",
romanization: "Den'enkōkyōgaku",
duration: "3:21"
},
{
title: "You Love Me, I love You",
romanization: "",
duration: "5:00"
},
]
)
CreateAlbumWithTracks({
title: "Weather Report",
romanization: "",
romaji_artist: "Yoshimi Iwasaki",
japanese_artist: "岩崎良美",
year: "1981",
description: "",
flavor: "Disco, Idol"
},
[{
title: "Good-day Sunshine",
romanization: "",
duration: "4:34"
},
{
title: "I Think So",
romanization: "",
duration: "3:38"
},
{
title: "L.A. Woman",
romanization: "",
duration: "3:16"
},
{
title: "City ポルカ",
romanization: "City Polka",
duration: "5:20"
},
{
title: "今夜は私 Rich な気分",
romanization: "Kon'ya wa Watashi Rich na Kibun",
duration: "4:47"
},
{
title: "Baby Love",
romanization: "",
duration: "3:44"
},
{
title: "四季",
romanization: "Shiki",
duration: "4:49"
},
{
title: "東海岸 イーストコースト",
romanization: "Higashikaigan East Coast",
duration: "3:31"
},
{
title: "夏をひとりじめ",
romanization: "Natsu o Hitoriji me",
duration: "2:41"
},
{
title: "アビ・ルージュの息づかいで",
romanization: "Avi Rouge no Ikidzukai de",
duration: "3:55"
},
]
)
CreateAlbumWithTracks({
title: "Cécile",
romanization: "",
romaji_artist: "Yoshimi Iwasaki",
japanese_artist: "岩崎良美",
year: "1982",
description: "",
flavor: "Disco, Idol"
},
[{
title: "Vacance",
romanization: "",
duration: "3:59"
},
{
title: "愛してモナムール",
romanization: "Ai Shite Mona Mull",
duration: "3:23"
},
{
title: "カメリアの花咲く丘",
romanization: "Camellia no Hanasaku Oka",
duration: "3:39"
},
{
title: "想い出Rainbow",
romanization: "Omoide Rainbow",
duration: "4:59"
},
{
title: "そしてフィナーレ",
romanization: "Soshite Finale",
duration: "4:20"
},
{
title: "どきどき旅行",
romanization: "Dokidoki Ryokō",
duration: "3:31"
},
{
title: "初めてのミント・カクテル",
romanization: "Hajimete no Mint Cocktail",
duration: "3:45"
},
{
title: "雨の停車場",
romanization: "Ame no Teishaba",
duration: "2:57"
},
{
title: "私の恋は印象派",
romanization: "Watashi no Koi wa Inshōha",
duration: "3:38"
},
{
title: "Telefonade",
romanization: "",
duration: "5:44"
},
]
)
CreateAlbumWithTracks({
title: "Save Me",
romanization: "",
romaji_artist: "Yoshimi Iwasaki",
japanese_artist: "岩崎良美",
year: "1983",
description: "",
flavor: "Disco, Idol"
},
[{
title: "Save Me…お願い",
romanization: "Save Me... Onegai",
duration: "4:10"
},
{
title: "未来愛",
romanization: "Mirai Ai",
duration: "3:17"
},
{
title: "おしゃれにKiss Me",
romanization: "Oshare ni Kiss Me",
duration: "3:21"
},
{
title: "Stardust",
romanization: "",
duration: "4:10"
},
{
title: "ブルーナイト セレナーデ",
romanization: "Blue Night Serenade",
duration: "4:25"
},
{
title: "真夜中のファンタジー",
romanization: "Mayonaka no Fantasy",
duration: "3:28"
},
{
title: "恋人達の予感",
romanization: "Koibito-tachi no Yokan",
duration: "3:30"
},
{
title: "気分はモノクローム",
romanization: "Kibun wa Monochrome",
duration: "3:11"
},
{
title: "月の浜辺",
romanization: "Tsuki no Hamabe",
duration: "3:20"
},
{
title: "レイン",
romanization: "Rain",
duration: "3:36"
},
{
title: "Sugar Days",
romanization: "",
duration: "4:16"
},
]
)
CreateAlbumWithTracks({
title: "唇に夢の跡",
romanization: "Kuchibiru ni Yume no Ato",
romaji_artist: "Yoshimi Iwasaki",
japanese_artist: "岩崎良美",
year: "1983",
description: "",
flavor: "Disco, Idol"
},
[{
title: "恋ほど素敵なショーはない",
romanization: "Koi ho to Sutekina Show Wanai",
duration: "3:35"
},
{
title: "気まぐれな時間",
romanization: "Ki Makurena Jikan",
duration: "3:27"
},
{
title: "Who!",
romanization: "",
duration: "3:13"
},
{
title: "優しい関係",
romanization: "Yasashī Kankei",
duration: "4:03"
},
{
title: "唇に夢の跡",
romanization: "Kuchibiru ni Yume no Ato",
duration: "4:17"
},
{
title: "クリスマスまで待てない",
romanization: "Christmas Mate Matenai",
duration: "3:37"
},
{
title: "冷たい妖精",
romanization: "Tsumetai Yōsei",
duration: "3:03"
},
{
title: "朝陽のプリズム",
romanization: "Asahi no Prism",
duration: "3:18"
},
{
title: "まぶしい恋",
romanization: "Ma fu Shī Koi",
duration: "3:04"
},
{
title: "時さえ色あせるほどに",
romanization: "Toki Sae Iroaseru ho to ni",
duration: "3:37"
},
]
)
CreateAlbumWithTracks({
title: "Wardrobe",
romanization: "",
romaji_artist: "Yoshimi Iwasaki",
japanese_artist: "岩崎良美",
year: "1984",
description: "",
flavor: "Disco, Idol"
},
[{
title: "くちびるからサスペンス",
romanization: "Kuchibiru Kara Suspense",
duration: "4:18"
},
{
title: "What's Love?",
romanization: "",
duration: "4:58"
},
{
title: "10月���フォト・メール",
romanization: "10 Tsuki no foto mail",
duration: "5:05"
},
{
title: "ヒールとスタジャン",
romanization: "Heel to Sutajan",
duration: "3:15"
},
{
title: "Fire",
romanization: "",
duration: "3:34"
},
{
title: "Congratulations",
romanization: "",
duration: "4:59"
},
{
title: "愛はどこに行ったの Please Answer The Phone",
romanization: "Ai wa Doko ni Itta no Please Answer The Phone",
duration: "4:11"
},
{
title: "コーラス・ワーク",
romanization: "Chorus Work",
duration: "4:16"
},
]
)
CreateAlbumWithTracks({
title: "Half Time",
romanization: "",
romaji_artist: "Yoshimi Iwasaki",
japanese_artist: "岩崎良美",
year: "1985",
description: "",
flavor: "Disco, Idol"
},
[{
title: "タッチ",
romanization: "Touch",
duration: "3:12"
},
{
title: "思い出ハーフタイム",
romanization: "Omoide Half Time",
duration: "3:20"
},
{
title: "微笑みでさようなら",
romanization: "Hohoemide Sayōnara",
duration: "4:05"
},
{
title: "砂に埋めたダイアリー",
romanization: "Suna ni Umeta Diary",
duration: "4:00"
},
{
title: "スーパーラジオ1960",
romanization: "Super Radio 1960",
duration: "4:37"
},
{
title: "3年目のロードショー",
romanization: "3-Nen-me no Road Show",
duration: "3:23"
},
{
title: "センチメンタル逃避行",
romanization: "Sentimental Tōhikō",
duration: "4:09"
},
{
title: "君がいなければ",
romanization: "Kimi ga Inakereba",
duration: "4:29"
},
{
title: "コメント (Half Time)",
romanization: "Comment (Half Time)",
duration: "1:23"
},
{
title: "愛がひとりぼっち",
romanization: "Aigahitoribotchi",
duration: "3:58"
},
{
title: "青春",
romanization: "Seishun",
duration: "3:49"
},
{
title: "星のシルエット",
romanization: "Hoshi no Silhouette",
duration: "4:05"
},
{
title: "風のメッセージ",
romanization: "",
duration: "3:16"
},
{
title: "好きになるなら",
romanization: "",
duration: "5:05"
},
])


# Nirvana


CreateAlbumWithTracks({
title: 'Nirvana',
romanization: '',
romaji_artist: 'Mioko Yamaguchi',
japanese_artist: '山口美央子',
year: '1981',
description: 'The 1981 follow-up to Mioko Yamaguchi\'s  \'Yume Hiko.\'',
flavor: 'Techno Kayo, Electronic'
},
[{
title: "いつも宝物",
romanization: "Itsumo Takaramono",
duration: "4:23"
},
{
title: "コードCの気分",
romanization: "Chord C no Kibun",
duration: "4:35"
},
{
title: "チャンキー・ツアー",
romanization: "Chunky Tour",
duration: "3:13"
},
{
title: "Lonely Dreamer",
romanization: "",
duration: "4:27"
},
{
title: "可愛い女と呼ばないで",
romanization: "Kawaii Onna to Yobanai de",
duration: "3:03"
},
{
title: "Nirvana",
romanization: "",
duration: "4:36"
},
{
title: "Telephone Game",
romanization: "",
duration: "3:41"
},
{
title: "風に抱かれて",
romanization: "Kaze ni Idakarete",
duration: "3:43"
},
{
title: "秋波",
romanization: "Shuuha",
duration: "5:34"
},
])


# Yuming


CreateAlbumWithTracks({
title: "Hikou-ki Gumo",
romanization: "",
romaji_artist: "Yumi Matsutoya",
japanese_artist: "松任谷 由実",
year: "1973",
description: "Yumi Matsutoya's debut under her birthname 'Yumi Arai'",
flavor: "Folk, Rock"
},
[{
title: "ひこうき雲",
romanization: "Hikōkigumo",
duration: "3:24"
},
{
title: "曇り空",
romanization: "Kumorizora",
duration: "3:00"
},
{
title: "恋のスーパーパラシューター",
romanization: "Koi no Super Parachute",
duration: "2:53"
},
{
title: "空と海の輝きに向けて",
romanization: "Sora to Uminokagayaki ni Mukete",
duration: "4:15"
},
{
title: "きっと言える",
romanization: "Kittoieru",
duration: "2:54"
},
{
title: "ベルベット・イースター",
romanization: "Velvet Easter",
duration: "3:44"
},
{
title: "紙ヒコーキ",
romanization: "Kami Kikōki",
duration: "2:44"
},
{
title: "雨の街を",
romanization: "Ame no Machi o",
duration: "4:18"
},
{
title: "返事はいらない",
romanization: "Henjihairanai",
duration: "2:52"
},
{
title: "そのまま",
romanization: "Sonomama",
duration: "3:16"
},
]
)

CreateAlbumWithTracks({
title: "Misslim",
romanization: "",
romaji_artist: "Yumi Matsutoya",
japanese_artist: "松任谷 由実",
year: "1974",
description: "",
flavor: "Rock, Funk, Boogie"
},
[{
title: "生まれた街で",
romanization: "Umareta Machi de",
duration: "3:48"
},
{
title: "瞳を閉じて",
romanization: "Hitomi wo Tojite",
duration: "3:10"
},
{
title: "やさしさに包まれたなら",
romanization: "Yasashisa ni Tsutsumareta Nara",
duration: "3:12"
},
{
title: "海を見ていた午後",
romanization: "Umi wo Mite Itagogo",
duration: "4:06"
},
{
title: "12月の雨",
romanization: "12 Tsuki no Ame",
duration: "3:10"
},
{
title: "あなただけのもの",
romanization: "Anata Dake no Mono",
duration: "4:04"
},
{
title: "魔法の鏡",
romanization: "Mahō no Kagami",
duration: "3:14"
},
{
title: "たぶんあなたはむかえに来ない",
romanization: "Tabun Anata wa Mukae ni Konai",
duration: "4:33"
},
{
title: "私のフランソワーズ",
romanization: "Watashi no Francoise",
duration: "5:11"
},
{
title: "旅立つ秋",
romanization: "Tabidatsuaki",
duration: "3:07"
},
])

CreateAlbumWithTracks({
title: "Cobalt Hour",
romanization: "",
romaji_artist: "Yumi Matsutoya",
japanese_artist: "松任谷 由実",
year: "1975",
description: "",
flavor: "Folk, Rock"
},
[{
title: "Cobalt Hour",
romanization: "",
duration: "3:33"
},
{
title: "卒業写真",
romanization: "Sotsugyō Shashin",
duration: "4:11"
},
{
title: "花紀行",
romanization: "Hana Kikō",
duration: "2:48"
},
{
title: "何もきかないで",
romanization: "Nani mo Kikanaide",
duration: "3:11"
},
{
title: "ルージュの伝言",
romanization: "Rougue\'s no Dengon",
duration: "3:03"
},
{
title: "航海日誌",
romanization: "Kōkai Nisshi",
duration: "4:48"
},
{
title: "Chinese Soup",
romanization: "",
duration: "3:22"
},
{
title: "少しだけ片想い",
romanization: "Sukoshidake Kataomoi",
duration: "3:17"
},
{
title: "雨のステイション",
romanization: "Ame no Station",
duration: "5:13"
},
{
title: "アフリカへ行きたい",
romanization: "Africa e Ikitai",
duration: "3:10"
},
]
)
CreateAlbumWithTracks({
title: "14番目の月",
romanization: "14-Banme no Tsuki",
romaji_artist: "Yumi Matsutoya",
japanese_artist: "松任谷 由実",
year: "1976",
description: "",
flavor: "Folk, Rock"
},
[{
title: "さざ波",
romanization: "Sazanami",
duration: "4:37"
},
{
title: "14番目の月",
romanization: "14-Banme no Tsuki",
duration: "3:27"
},
{
title: "さみしさのゆくえ",
romanization: "Samishi-sa no Yukue",
duration: "5:24"
},
{
title: "朝陽の中で微笑んで",
romanization: "Asahinonakadehohoende",
duration: "5:23"
},
{
title: "中央フリーウェイ",
romanization: "Chūō Freeway",
duration: "3:44"
},
{
title: "何もなかったように",
romanization: "Nani mo Nakatta yō ni",
duration: "5:07"
},
{
title: "天気雨",
romanization: "Tenki Ame",
duration: "3:06"
},
{
title: "避暑地の出来事",
romanization: "Hishochinodekigoto",
duration: "2:40"
},
{
title: "Good luck and Good bye",
romanization: "",
duration: "3:45"
},
{
title: "晩夏(ひとりの季節)",
romanization: "Banka (Hitori no Kisetsu)",
duration: "3:17"
},
]
)
CreateAlbumWithTracks({
title: "紅雀",
romanization: "Benisuzume",
romaji_artist: "Yumi Matsutoya",
japanese_artist: "松任谷 由実",
year: "1978",
description: "",
flavor: "Folk, Latin"
},
[{
title: "9月には帰らない",
romanization: "9 Tsuki ni wa Kaeranai",
duration: "4:54"
},
{
title: " ハルジョオン・ヒメジョオン",
romanization: "Halongjon · Himejoon",
duration: "3:57"
},
{
title: "私なしでも",
romanization: "Watashi Nashi Demo",
duration: "3:16"
},
{
title: "地中海の感傷",
romanization: "Chichūkai no Kanshō",
duration: "3:51"
},
{
title: "紅雀",
romanization: "Benisuzume",
duration: "3:32"
},
{
title: "罪と罰",
romanization: "Tsumitobachi",
duration: "4:26"
},
{
title: "出さない手紙",
romanization: "Dasanai Tegami",
duration: "4:12"
},
{
title: "白い朝まで",
romanization: "Shiroi Asamade",
duration: "3:17"
},
{
title: "Laundry Gateの想い出",
romanization: "Laundry Gate no Omoide",
duration: "5:30"
},
{
title: "残されたもの",
romanization: "Nokosa Reta Mono",
duration: "3:35"
},
]
)
CreateAlbumWithTracks({
title: "流線形'80",
romanization: "Ryūsenkei' 80",
romaji_artist: "Yumi Matsutoya",
japanese_artist: "松任谷 由実",
year: "1978",
description: "",
flavor: "Rock, Soul"
},
[{
title: "ロッヂで待つクリスマス",
romanization: "Lodge de Matsu Christmas",
duration: "4:05"
},
{
title: "埠頭を渡る風",
romanization: "Futōwowatarukaze",
duration: "4:39"
},
{
title: "真冬のサーファー",
romanization: "Mafuyu no Surfer",
duration: "3:42"
},
{
title: "静かなまぼろし",
romanization: "Shizukanamaboroshi",
duration: "3:45"
},
{
title: "魔法のくすり",
romanization: "Mahō no Kusuri",
duration: "3:58"
},
{
title: "キャサリン",
romanization: "Catherine",
duration: "4:23"
},
{
title: "Corvett1954",
romanization: "",
duration: "3:57"
},
{
title: "入江の午後３時",
romanization: "Irie no Gogo 3-ji",
duration: "3:50"
},
{
title: "かんらん車",
romanization: "Kan ran-sha",
duration: "5:45"
},
{
title: "12階のこいびと",
romanization: "12-Kai no Koi Bito",
duration: "4:44"
},
]
)
CreateAlbumWithTracks({
title: "悲しいほどお天気",
romanization: "Kanashīhodōtenki",
romaji_artist: "Yumi Matsutoya",
japanese_artist: "松任谷 由実",
year: "1979",
description: "",
flavor: "Soul"
},
[{
title: "ジャコビニ彗星の日",
romanization: "Jakobini Suisei no Hi",
duration: "4:01"
},
{
title: "影になって",
romanization: "Kage ni Natte",
duration: "5:31"
},
{
title: "緑の町に舞い降りて",
romanization: "Midori no Machi ni Maiorite",
duration: "4:40"
},
{
title: "Destiny",
romanization: "",
duration: "4:39"
},
{
title: "丘の上の光",
romanization: "Oka no Ue no Hikari",
duration: "6:05"
},
{
title: "悲しいほどお天気",
romanization: "Kanashīhodōtenki",
duration: "4:52"
},
{
title: "気ままな朝帰り",
romanization: "Kimamana asagaeri",
duration: "3:19"
},
{
title: "水平線にグレナディン",
romanization: "Suihei-sen ni Gurenadin",
duration: "4:34"
},
{
title: "さまよいの果て波は寄せる",
romanization: "Samayoi no Hate-ha wa Yoseru",
duration: "6:26"
},
]
)
CreateAlbumWithTracks({
title: " 時のないホテル",
romanization: "Kanashīhodōtenki",
romaji_artist: "Yumi Matsutoya",
japanese_artist: "松任谷 由実",
year: "1980",
description: "",
flavor: "Rock, Ballad"
},
[{
title: "セシルの週末",
romanization: "Seshiru no shūmatsu",
duration: "5:23"
},
{
title: "時のないホテル",
romanization: "Tokinonaihoteru",
duration: "4:11"
},
{
title: "Miss Lonely",
romanization: "",
duration: "4:24"
},
{
title: "雨に消えたジョガー",
romanization: "Ame ni Kieta Jogger",
duration: "4:57"
},
{
title: "ためらい",
romanization: "Tamerai",
duration: "3:42"
},
{
title: "よそゆき顔で",
romanization: "Yoso Yuki Kao de",
duration: "4:26"
},
{
title: "5cmの向う岸",
romanization: "5 cm no Mukōgishi",
duration: "6:19"
},
{
title: "コンパートメント",
romanization: "Compartment",
duration: "7:14"
},
{
title: "水の影",
romanization: "Mizu no Kage",
duration: "4:01"
},
]
)
CreateAlbumWithTracks({
title: "Pearl Pierce",
romanization: "",
romaji_artist: "Yumi Matsutoya",
japanese_artist: "松任谷 由実",
year: "1982",
description: "",
flavor: "Soul"
},
[{
title: "ようこそ輝く時間へ",
romanization: "Yōkoso Kagayaku Jikan e",
duration: "4:39"
},
{
title: "真珠のピアス",
romanization: "Shinju no Piasu",
duration: "5:41"
},
{
title: "ランチタイムが終わる頃",
romanization: "Lunchtime ga Owaru Koro",
duration: "3:59"
},
{
title: "フォーカス",
romanization: "Focus",
duration: "5:13"
},
{
title: "夕涼み",
romanization: "Yūsuzumi",
duration: "4:27"
},
{
title: "私のロンサム・タウン",
romanization: "Watashi no Romance Town",
duration: "4:06"
},
{
title: "Dang Dang",
romanization: "",
duration: "5:28"
},
{
title: "昔の彼に会うのなら",
romanization: "Mukashi no Kare ni Au Nonara",
duration: "3:39"
},
{
title: "消息",
romanization: "Shōsoku",
duration: "4:23"
},
{
title: "忘れないでね",
romanization: "Wasurenaidene",
duration: "4:17"
},
]
)
CreateAlbumWithTracks({
title: "Reincarnation",
romanization: "",
romaji_artist: "Yumi Matsutoya",
japanese_artist: "松任谷 由実",
year: "1983",
description: "",
flavor: "Funk, Rock"
},
[{
title: "Reincarnation",
romanization: "",
duration: "5:41"
},
{
title: "オールマイティー",
romanization: "Allmighty",
duration: "4:23"
},
{
title: "Night Walker",
romanization: "",
duration: "5:04"
},
{
title: "星空の誘惑",
romanization: "Hoshizora no Yūwaku",
duration: "4:48"
},
{
title: "川景色",
romanization: "Kawa Keshiki",
duration: "3:33"
},
{
title: "Esper",
romanization: "",
duration: "4:11"
},
{
title: "心のまま",
romanization: "Kokoro no Mama",
duration: "4:43"
},
{
title: "ずっとそばに",
romanization: "Zutto Soba ni",
duration: "4:25"
},
{
title: "ハートはもうつぶやかない",
romanization: "Hāto wa mō Tsubuyakanai",
duration: "4:57"
},
{
title: "経る時",
romanization: "Heru Toki",
duration: "4:15"
},
]
)
CreateAlbumWithTracks({
title: "Voyager",
romanization: "",
romaji_artist: "Yumi Matsutoya",
japanese_artist: "松任谷 由実",
year: "1983",
description: "",
flavor: "Funk"
},
[{
title: "ガールフレンズ",
romanization: "Girlfriends",
duration: "4:00"
},
{
title: "結婚ルーレット",
romanization: "Kekkon Roulette",
duration: "4:18"
},
{
title: "ダンデライオン ?遅咲きのたんぽぽ",
romanization: "Dandelion? Osozaki no Tanpopo",
duration: "4:21"
},
{
title: "青い船で",
romanization: "Aoi Fune de",
duration: "4:26"
},
{
title: "不思議な体験",
romanization: "Fushigina Taiken",
duration: "5:25"
},
{
title: "ハートブレイク",
romanization: "Heartbreak",
duration: "4:06"
},
{
title: "Typhoon",
romanization: "",
duration: "4:49"
},
{
title: "Tropic of Capricorn",
romanization: "",
duration: "4:35"
},
{
title: "私を忘れる頃",
romanization: "Watashi o Wasureru Koro",
duration: "4:57"
},
{
title: "時をかける少女",
romanization: "Tokiwokakerushōjo",
duration: "3:39"
},
]
)
CreateAlbumWithTracks({
title: "No Side",
romanization: "",
romaji_artist: "Yumi Matsutoya",
japanese_artist: "松任谷 由実",
year: "1984",
description: "",
flavor: "Funk, Ballad"
},
[{
title: "Salaam Mousson Salaam Afrique",
romanization: "",
duration: "5:35"
},
{
title: "ノーサイド",
romanization: "Northside",
duration: "4:45"
},
{
title: "Downtown Boy",
romanization: "",
duration: "4:03"
},
{
title: "Blizzard",
romanization: "",
duration: "4:34"
},
{
title: "一緒に暮らそう",
romanization: "Isshonikurasō",
duration: "3:29"
},
{
title: "破れた恋の繕(なお)し方教えます",
romanization: "Yabureta Koi no zen (Nao) Shi-kata Oshiemasu",
duration: "4:39"
},
{
title: "午前4時の電話",
romanization: "Gozen 4-ji no Denwa",
duration: "4:08"
},
{
title: "木枯らしのダイアリー",
romanization: "Kogarashi no Diary",
duration: "5:06"
},
{
title: "Shangrilaをめざせ",
romanization: "Shangrila o Mezase",
duration: "4:23"
},
{
title: "ノーサイド・夏~空耳のホイッスル",
romanization: "Northside Natsu ~ Soramimi no Hoissuru",
duration: "4:19"
},
]
)
CreateAlbumWithTracks({
title: "DA・DI・DA",
romanization: "",
romaji_artist: "Yumi Matsutoya",
japanese_artist: "松任谷 由実",
year: "1985",
description: "",
flavor: "Funk"
},
[{
title: "もう愛は始まらない",
romanization: "Mō Ai wa Hajimaranai",
duration: "4:46"
},
{
title: "2人のストリート",
romanization: "2-Ri no Street",
duration: "4:46"
},
{
title: "Babylon",
romanization: "",
duration: "4:20"
},
{
title: "Sugar Townはさよならの町",
romanization: "Sugar Town wa Sayonara no Machi",
duration: "5:33"
},
{
title: "メトロポリスの片隅で",
romanization: "Metropolis no Katasumi de",
duration: "4:16"
},
{
title: "月夜のロケット花火",
romanization: "Tsukiyo no Rocket Hanabi",
duration: "4:48"
},
{
title: "シンデレラ・エクスプレス",
romanization: "Cinderella Express",
duration: "3:47"
},
{
title: "青春のリグレット",
romanization: "Seishun no Regret",
duration: "3:55"
},
{
title: "たとえあなたが去って行っても",
romanization: "Tatoe Anata ga Satte Itte mo",
duration: "3:48"
},
]
)
CreateAlbumWithTracks({
title: "Alarm à la Mode",
romanization: "",
romaji_artist: "Yumi Matsutoya",
japanese_artist: "松任谷 由実",
year: "1986",
description: "",
flavor: "Funk, Ballad"
},
[{
title: "Holiday in Acapulco",
romanization: "",
duration: "4:33"
},
{
title: "ジェラシーと云う名の悪夢",
romanization: "Jealousy to Iu na no Akumu",
duration: "4:30"
},
{
title: "パジャマにレインコート",
romanization: "Pajamas ni Raincoat",
duration: "4:23"
},
{
title: "白い服、白い靴",
romanization: "Shiroi Fuku, Shiroi Kutsu",
duration: "3:46"
},
{
title: "土曜日は大キライ",
romanization: "Doyōbi wa Dai Kirai",
duration: "3:22"
},
{
title: "ホライズンを追いかけて~L’aventure au desert",
romanization: "Horizon o Oikakete ~ L’aventure au Desert",
duration: "4:02"
},
{
title: "Autumn Park",
romanization: "",
duration: "5:00"
},
{
title: "20 minutes",
romanization: "",
duration: "3:27"
},
{
title: "3-Dのクリスマスカード",
romanization: "3-D no Christmas Card",
duration: "3:32"
},
{
title: "さよならハリケーン",
romanization: "Sayonara Hurricane",
duration: "4:28"
},
]
)
CreateAlbumWithTracks({
title: "ダイアモンドダストが消えぬまに",
romanization: "Diamond Dust Gakienumani",
romaji_artist: "Yumi Matsutoya",
japanese_artist: "松任谷 由実",
year: "1987",
description: "",
flavor: "Funk, Ballad"
},
[{
title: "月曜日のロボット",
romanization: "Getsuyōbi no Robot",
duration: "4:31"
},
{
title: "Diamond Dust Gakienumani",
romanization: "",
duration: "4:38"
},
{
title: "思い出に間にあいたくて",
romanization: "Omoide ni Maniaitakute",
duration: "4:04"
},
{
title: "Sweet Dream",
romanization: "",
duration: "4:03"
},
{
title: "Tuxedo Rain",
romanization: "",
duration: "4:32"
},
{
title: "Saturday Night Zombies",
romanization: "",
duration: "4:15"
},
{
title: "続 ガールフレンズ",
romanization: "Zoku Girlfriends",
duration: "3:54"
},
{
title: "ダイアモンドの街角",
romanization: "Daiamondo no Machikado",
duration: "4:38"
},
{
title: "Late Summer Lake",
romanization: "",
duration: "4:22"
},
{
title: "霧雨で見えない",
romanization: "Kirisame de Mienai",
duration: "5:02"
},
]
)
CreateAlbumWithTracks({
title: "Delight Slight Light Kiss",
romanization: "",
romaji_artist: "Yumi Matsutoya",
japanese_artist: "松任谷 由実",
year: "1988",
description: "",
flavor: "Funk"
},
[{
title: "リフレインが叫んでる",
romanization: "Refrain ga Sakenderu",
duration: "4:22"
},
{
title: "Nobody Else",
romanization: "",
duration: "3:20"
},
{
title: "ふってあげる",
romanization: "Futte Ageru",
duration: "4:55"
},
{
title: "誕生日おめでとう",
romanization: "Tanjōbi Omedetō",
duration: "4:59"
},
{
title: "Home Townへようこそ",
romanization: "Hōmutaun e Yōkoso",
duration: "3:50"
},
{
title: "とこしえにGood Night(夜明けの色)",
romanization: "Tokoshie ni Good Night (Yoake no Iro)",
duration: "3:45"
},
{
title: "恋はNo-return",
romanization: "Koi wa No Return",
duration: "3:33"
},
{
title: "幸せはあなたへの復讐",
romanization: "Shiawase wa Anata e no Fukushū",
duration: "4:19"
},
{
title: "吹雪の中を",
romanization: "Fubuki no Naka o",
duration: "4:13"
},
{
title: "September Blue Moon",
romanization: "",
duration: "4:22"
},
]
)
CreateAlbumWithTracks({
title: "天国のドア",
romanization: "Tengokunodoa",
romaji_artist: "Yumi Matsutoya",
japanese_artist: "松任谷 由実",
year: "1990",
description: "",
flavor: "Funk"
},
[{
title: "ミス・ブロードキャスト",
romanization: "Miss Broadcast",
duration: "4:53"
},
{
title: "時はかげろう",
romanization: "Toki wa Kagerō",
duration: "4:57"
},
{
title: "A(エース)はここにある",
romanization: "A (Ace) wa Koko ni Aru",
duration: "4:28"
},
{
title: "満月のフォーチュン",
romanization: "Mangetsu no Fortune",
duration: "4:42"
},
{
title: "グローリー・バードランド",
romanization: "Glory Birdland",
duration: "4:50"
},
{
title: "ホタルと流れ星",
romanization: "Hotarutonagareboshi",
duration: "4:12"
},
{
title: "マン・イン・ザ・ムーン",
romanization: "Man in the Moon",
duration: "4:31"
},
{
title: "残暑",
romanization: "Zansho",
duration: "4:14"
},
{
title: "天国のドア",
romanization: "Tengokunodoa",
duration: "3:58"
},
{
title: "セイヴ・アワ・シップ",
romanization: "Save Our Ship",
duration: "6:24"
},
])


#Images by Bread&Butter


CreateAlbumWithTracks({
title: 'Images',
romanization: '',
romaji_artist: 'Bread & Butter',
japanese_artist: 'ブレッド&バター',
year: '1973',
description: 'Recorded in London with major British influence, it\'s the second album by Bread & Butter for 1973 featuring Stevie Wonder.',
flavor: 'Folk, Quirky, Lounge'
},
[{
title: "風",
romanization: "Kaze",
duration: "3:24"
},
{
title: "屋根の上",
romanization: "Yane no ue",
duration: "3:05"
},
{
title: "二日酔いに",
romanization: "Futsukayoi ni",
duration: "2:40"
},
{
title: "老人と犬",
romanization: "Rōjin to inu",
duration: "4:32"
},
{
title: "おもかげ",
romanization: "O mo kage",
duration: "4:11"
},
{
title: "時もゆっくり",
romanization: "Toki mo yukkuri",
duration: "2:59"
},
{
title: "花の土曜日",
romanization: "Hana no doyōbi",
duration: "2:48"
},
{
title: "#405",
romanization: "",
duration: "4:26"
},
{
title: "コンペイトー",
romanization: "Konpeitō",
duration: "3:36"
},
{
title: "遠い昔",
romanization: "Tōi mukashi",
duration: "4:18"
},
{
title: "誰が好きなの",
romanization: "Dare ga sukina no",
duration: "3:08"
},
{
title: "名前を忘れた女",
romanization: "Namae o wasureta onna",
duration: "3:31"
},
])


#Mirror of my mind


CreateAlbumWithTracks({
title: 'Mirror of My Mind',
romanization: '',
romaji_artist: 'Ryo Kawasaki',
japanese_artist: '川崎燎',
year: '1979',
description: 'Mirror of my Mind marks Ryo\'s 8th release and brings an interesting jazz-guitar sound to the city pop landscape. It features Radha Shottom on vocals.',
flavor: 'Jazz, Soul'
},
[{
title: "In & Out of Love",
romanization: "",
duration: "6:43"
},
{
title: "Trinkets and Things",
romanization: "",
duration: "6:51"
},
{
title: "Little One",
romanization: "",
duration: "4:53"
},
{
title: "Dreams for Radha (Pt. 1-3)",
romanization: "",
duration: "7:51"
},
{
title: "Braziliana",
romanization: "",
duration: "4:05"
},
{
title: "Winter's Here",
romanization: "",
duration: "4:09"
},
{
title: "I've Found the Way of Love",
romanization: "",
duration: "7:00"
},
])


# New batch - Akiko Yano


CreateAlbumWithTracks({
title: "Japanese Girl",
romanization: "",
romaji_artist: "Akiko Yano",
japanese_artist: "矢野顕子",
year: "1976",
description: "Akiko Yano's debut album brings a wonderful fusion of traditional Japanese folk and contemporary western funk/soul.",
flavor: "Folk, Soul, Funk"
},
[{
title: "気球にのって",
romanization: "Kikyū ni Notte",
duration: "6:37"
},
{
title: "クマ",
romanization: "Kuma",
duration: "4:00"
},
{
title: "電話線",
romanization: "Denwa-sen",
duration: "2:56"
},
{
title: "津軽ツアー",
romanization: "Tsugaru Tsuā",
duration: "2:11"
},
{
title: "ふなまち唄Partii",
romanization: "Funa Machi-uta - Part II",
duration: "5:52"
},
{
title: "大いなる椎の木",
romanization: "Ōinaru Shīnoki",
duration: "3:20"
},
{
title: "へこりぷたぁ",
romanization: "E Kori Puta a",
duration: "3:56"
},
{
title: "風太",
romanization: "Fūta",
duration: "1:51"
},
{
title: "丘を越えて",
romanization: "Okawokoete",
duration: "3:14"
},
{
title: "ふなまち唄part I",
romanization: "Funa Machi-uta - Part I",
duration: "3:54"
},
]
)
CreateAlbumWithTracks({
title: "いろはにこんぺいとう",
romanization: "Iroha ni Konpeitō",
romaji_artist: "Akiko Yano",
japanese_artist: "矢野顕子",
year: "1977",
description: "Iroha ni Konpeitō departs from Akiko's folkier sound in place of a jazzier sound featuring playful vocals and a more prominent focus on melody.",
flavor: "Funk, Soul, Jazz"
},
[{
title: "Kawaji",
romanization: "",
duration: "0:57"
},
{
title: "いろはにこんぺいとう",
romanization: "Iroha ni Konpeitō",
duration: "3:02"
},
{
title: "待ちくたびれて",
romanization: "Machikutabirete",
duration: "3:50"
},
{
title: "ほうろう",
romanization: "Hōrō",
duration: "4:12"
},
{
title: "行け　柳田",
romanization: "Ike Yanagida",
duration: "5:00"
},
{
title: "相合傘",
romanization: "Ai Ai-gassa",
duration: "3:45"
},
{
title: "ぽつん",
romanization: "Potsun",
duration: "2:04"
},
{
title: "昨日はもう",
romanization: "Kinō wa Mō",
duration: "4:36"
},
{
title: "家路",
romanization: "Ieji",
duration: "3:30"
},
{
title: "やませ（東風）",
romanization: "Yama se (Kochi)",
duration: "4:07"
},
]
)
CreateAlbumWithTracks({
title: "ト・キ・メ・キ",
romanization: "To・Ki・Me・Ki",
romaji_artist: "Akiko Yano",
japanese_artist: "矢野顕子",
year: "1978",
description: "Tokimeki has Akiko return to her folkier roots, boasting a more traditional Japanese aesthetic and incorporating more folk elements.",
flavor: "Folk, Jazz, Experimental"
},
[{
title: "こどもたち",
romanization: "Kodomo-tachi",
duration: "3:43"
},
{
title: "カタルン　カララン",
romanization: "Catalun Carcarin",
duration: "4:09"
},
{
title: "ウオーサオー",
romanization: "Uōsaō",
duration: "3:01"
},
{
title: "Two On The Stage",
romanization: "",
duration: "4:33"
},
{
title: "大きな石",
romanization: "Ōkina Ishi",
duration: "4:12"
},
{
title: "アンダンテ・カンタービレ",
romanization: "Andante Cantabile",
duration: "3:22"
},
{
title: "やめるわけにゃいかないわ",
romanization: "Yameru Wake Nya Ikanai wa",
duration: "3:47"
},
{
title: "ヨ・ロ・コ・ビ",
romanization: "Yo・Ro・Ko・Bi",
duration: "3:05"
},
{
title: "ト・キ・メ・キ",
romanization: "To・Ki・Me・Ki",
duration: "5:52"
},
]
)
CreateAlbumWithTracks({
title: "ただいま。",
romanization: "Tadaima.",
romaji_artist: "Akiko Yano",
japanese_artist: "矢野顕子",
year: "1981",
description: "Tadaima presents a drastic change in sound for Akiko - Ditching the acoustic funk sound in favor of a very experimental electronic sound.",
flavor: "Acid, Jazz, Experimental, Electronic"
},
[{
title: "ただいま。",
romanization: "Tadaima.",
duration: "4:01"
},
{
title: "いつか王子様が",
romanization: "Itsukaōjisamaga",
duration: "5:03"
},
{
title: "Vet",
romanization: "",
duration: "2:24"
},
{
title: "Ashkenazy Who?",
romanization: "",
duration: "3:24"
},
{
title: "いらないもん",
romanization: "Iranai Mon",
duration: "2:45"
},
{
title: "たいようのおなら・おとうさん・おとうさん・ぼくがおとなになったら・せんせい・おかあさんのおひげ・もし一億円あったら・いぬ・ぼくはなきみそ",
romanization: "Taiyō no onara otōsan otōsan boku ga otona ni nattara sensei okāsan no o hi-ge moshi ichiokuen attara inu boku wa naki miso",
duration: "9:32"
},
{
title: "I Sing",
romanization: "",
duration: "4:02"
},
{
title: "春咲小紅",
romanization: "Harusakikobeni",
duration: "3:34"
},
{
title: "Rose Garden",
romanization: "",
duration: "3:30"
},
]
)
CreateAlbumWithTracks({
title: "愛がなくちゃね",
romanization: "Ai ga Nakuchane",
romaji_artist: "Akiko Yano",
japanese_artist: "矢野顕子",
year: "1982",
description: "",
flavor: "Funk, Jazz"
},
[{
title: "愛がなくちゃね",
romanization: "Ai ga Nakuchane",
duration: "4:53"
},
{
title: "悲しくてやりきれない",
romanization: "Kanashikuteyarikirenai",
duration: "4:01"
},
{
title: "What's Got In Your Eyes?",
romanization: "",
duration: "4:06"
},
{
title: "おいしい生活",
romanization: "Oishī Seikatsu",
duration: "1:14"
},
{
title: "みちでバッタリ",
romanization: "Michi de Battery",
duration: "2:14"
},
{
title: "女たちよ男たちよ",
romanization: "On'na-tachi yo Otoko-tachi yo",
duration: "4:06"
},
{
title: "あいするひとよ",
romanization: "Aisuru Hito Yo",
duration: "4:27"
},
{
title: "Sleep On My Baby",
romanization: "",
duration: "3:58"
},
{
title: "Another Wedding Song",
romanization: "",
duration: "2:39"
},
{
title: "どんなときも どんなときも どんなときも",
romanization: "Don'na toki mo don'na toki mo don'na toki mo",
duration: "3:56"
},
{
title: "Good Night",
romanization: "",
duration: "1:28"
},
]
)
CreateAlbumWithTracks({
title: "オーエス オーエス",
romanization: "Ōesu Ōesu",
romaji_artist: "Akiko Yano",
japanese_artist: "矢野顕子",
year: "1984",
description: "",
flavor: "Jazz, Electronic"
},
[{
title: "おもちゃのチャチャチャ",
romanization: "Omochanochachacha",
duration: "4:32"
},
{
title: "Hi,hi,hi",
romanization: "",
duration: "4:22"
},
{
title: "きょうのわたくし",
romanization: "Kyō no Watakushi",
duration: "3:25"
},
{
title: "Highland",
romanization: "",
duration: "4:34"
},
{
title: "Simon Smith And The Amazing Dancing Bear",
romanization: "",
duration: "2:54"
},
{
title: "ラーメンたべたい",
romanization: "Rāmen Tabetai",
duration: "6:00"
},
{
title: "素顔",
romanization: "Sugao",
duration: "3:27"
},
{
title: "終りの季節",
romanization: "Owari no Kisetsu",
duration: "3:53"
},
{
title: "Greenfields",
romanization: "",
duration: "5:00"
},
{
title: "Assembly",
romanization: "",
duration: "6:19"
},
]
)
CreateAlbumWithTracks({
title: "ごはんができたよ",
romanization: "Gohan ga Dekita yo",
romaji_artist: "Akiko Yano",
japanese_artist: "矢野顕子",
year: "1986",
description: "",
flavor: "Jazz, Electronic"
},
[{
title: "Hitotsudake",
romanization: "",
duration: "5:12"
},
{
title: "Les Petit Bon Bon",
romanization: "",
duration: "6:17"
},
{
title: "Coloured Water",
romanization: "",
duration: "4:41"
},
{
title: "Zaikungtong Shonen",
romanization: "",
duration: "6:26"
},
{
title: "High Time",
romanization: "",
duration: "5:16"
},
{
title: "Dogs Awaiting...",
romanization: "",
duration: "7:35"
},
{
title: "Tong Poo",
romanization: "",
duration: "4:23"
},
{
title: "Aoi Sanmyaku",
romanization: "",
duration: "4:05"
},
{
title: "Genkotsuyama No Onigirisama",
romanization: "",
duration: "8:35"
},
{
title: "Gokigen Wanisan",
romanization: "",
duration: "3:02"
},
{
title: "Mata Aone",
romanization: "",
duration: "4:10"
},
{
title: "Te Wa Tsutaeru → Tetsudaeru",
romanization: "",
duration: "4:19"
},
{
title: "Gohan Ga Dekitayo",
romanization: "",
duration: "5:31"
},
{
title: "You're The One",
romanization: "",
duration: "4:23"
},
]
)
CreateAlbumWithTracks({
title: "峠のわが家",
romanization: "Tōge no Wagaya",
romaji_artist: "Akiko Yano",
japanese_artist: "矢野顕子",
year: "1986",
description: "",
flavor: "Synth, Funk"
},
[{
title: "The Girl Of Integrity",
romanization: "",
duration: "4:31"
},
{
title: "David",
romanization: "",
duration: "4:19"
},
{
title: "ちいさい秋みつけた",
romanization: "Chīsai Aki Mitsuketa",
duration: "4:30"
},
{
title: "一分間",
romanization: "Ichi-funkan",
duration: "2:36"
},
{
title: "おてちょ。(Drop Me A Line)",
romanization: "Ote Cho. (Drop Me A Line)",
duration: "4:36"
},
{
title: "海と少年",
romanization: "Umi to Shōnen",
duration: "3:44"
},
{
title: "夏の終り",
romanization: "Natsu no Owari",
duration: "4:20"
},
{
title: "そこのアイロンに告ぐ",
romanization: "Soko no Airon ni Tsugu",
duration: "4:07"
},
{
title: "Home Sweet Home",
romanization: "",
duration: "6:15"
},
]
)
CreateAlbumWithTracks({
title: "Granola",
romanization: "",
romaji_artist: "Akiko Yano",
japanese_artist: "矢野顕子",
year: "1987",
description: "",
flavor: "Synth, Funk"
},
[{
title: "わたしたち",
romanization: "Watashi-tachi",
duration: "5:14"
},
{
title: "風をあつめて",
romanization: "Kaze wo Atsumete",
duration: "5:24"
},
{
title: "やがて一人",
romanization: "Yagate Hitori",
duration: "4:55"
},
{
title: "Un Jour",
romanization: "",
duration: "4:57"
},
{
title: "無風状態",
romanization: "Mufū Jōtai",
duration: "2:29"
},
{
title: "花のように",
romanization: "Hana no Yōni",
duration: "5:00"
},
{
title: "ふりむけばカエル",
romanization: "Furimukebakaeru",
duration: "4:04"
},
{
title: "Levee Break",
romanization: "",
duration: "4:55"
},
{
title: "Roselein Auf Der Heiden",
romanization: "",
duration: "3:05"
},
{
title: "自転車でおいで",
romanization: "Jitensha de Oide",
duration: "4:27"
},
{
title: "おおきいあい",
romanization: "Ōkī Ai",
duration: "4:33"
},
])


#Full Moon - Junko Yagami


CreateAlbumWithTracks({
title: 'Full Moon',
romanization: '',
romaji_artist: 'Junko Yagami',
japanese_artist: '八神純子',
year: '1983',
description: 'Full Moon is the seventh studio album by Japanese singer-songwriter Junko Yagami, released in December 1983.',
flavor: 'Funk, Soul'
},
[{
title: "Follow Me",
romanization: "",
duration: "4:06"
},
{
title: "Naturally",
romanization: "",
duration: "4:44"
},
{
title: "黄昏のBay City",
romanization: "Twilight's BAY CITY",
duration: "4:41"
},
{
title: "陽だまりのあなた",
romanization: "You are the Sunny Lot",
duration: "2:41"
},
{
title: "抱きしめてあげる",
romanization: "I Will Hold You",
duration: "4:21"
},
{
title: "綿雪&銀紙星 (コットン・スノーにペイパー・スター)",
romanization: "Cotton Snow & Silver Paper Star (Paper Star on Cotton · Snow)",
duration: "5:15"
},
{
title: "No!",
romanization: "",
duration: "3:20"
},
{
title: "ハートブレイクホテルで朝食を",
romanization: "Breakfast at Heartbreak Hotel",
duration: "4:20"
},
{
title: "Full Moon",
romanization: "",
duration: "4:35"
},
{
title: "Two Notes Samba",
romanization: "",
duration: "5:03"
},
])

CreateAlbumWithTracks({
title: 'Communication',
romanization: '',
romaji_artist: 'Junko Yagami',
japanese_artist: '八神純子',
year: '1985',
description: 'Communication is the eighth studio album by Japanese singer-songwriter Junko Yagami, released in February 1985.',
flavor: 'Funk, Soul'
},
[{
title: "Imagination",
romanization: "",
duration: "4:10
"
},
{
title: "Cheater",
romanization: "",
duration: "3:40
"
},
{
title: "Communication",
romanization: "",
duration: "5:02
"
},
{
title: "1984 (西暦2000年に向けて)," "1984 (Seireki 2000-nen ni mukete)",
romanization: "",
duration: "5:23
"
},
{
title: "Miss D.J.",
romanization: "",
duration: "4:47
"
},
{
title: "カシミヤのほほえみ",
romanization: "Kashimiya no hohoemi",
duration: "4:43
"
},
{
title: "ジョハナスバーグ",
romanization: "Johanasubāgu",
duration: "5:11
"
},
{
title: "どんな手段使っても",
romanization: "Don'na shudan tsukatte mo",
duration: "4:03
"
},
{
title: "Believing",
romanization: "",
duration: "4:15
"
},
{
title: "Reaching Out",
romanization: "",
duration: "5:22"
},
])


# Rajie batch


CreateAlbumWithTracks({
title: "HEART to HEART",
romanization: "",
romaji_artist: "Rajie",
japanese_artist: "",
year: "1977",
description: "",
flavor: "Disco"
},
[{
title: "Hold me tight",
romanization: "",
duration: "3:54"
},
{
title: "Shizukana Hitomi",
romanization: "",
duration: "3:24"
},
{
title: "It's me・・・It's you",
romanization: "",
duration: "4:48"
},
{
title: "Sarasara no Machi",
romanization: "",
duration: "3:43"
},
{
title: "Ai wa Tabun",
romanization: "",
duration: "2:53"
},
{
title: "The Tokyo Taste",
romanization: "",
duration: "3:47"
},
{
title: "Sutekina Feeling",
romanization: "",
duration: "4:30"
},
{
title: "Kibun wo Dashite Mouichido",
romanization: "",
duration: "4:23"
},
{
title: "Airport",
romanization: "",
duration: "1:59"
},
{
title: "Heart to Heart",
romanization: "",
duration: "4:47"
},
]
)
CreateAlbumWithTracks({
title: "Acoustic Moon",
romanization: "",
romaji_artist: "Rajie",
japanese_artist: "",
year: "1981",
description: "",
flavor: "Bossa Nova"
},
[{
title: "Rosy Blue",
romanization: "",
duration: "3:39"
},
{
title: "Shion",
romanization: "",
duration: "3:44"
},
{
title: "Acoustic Moon",
romanization: "",
duration: "1:13"
},
{
title: "Stormy Night",
romanization: "",
duration: "5:11"
},
{
title: "Black Moon",
romanization: "",
duration: "4:12"
},
{
title: "Bara no Glass",
romanization: "",
duration: "5:28"
},
{
title: "Do You Wanna Dance",
romanization: "",
duration: "3:41"
},
{
title: "Paradise Wine",
romanization: "",
duration: "4:05"
},
{
title: "Memory Through",
romanization: "",
duration: "5:37"
},
{
title: "Puzzle Noon",
romanization: "",
duration: "4:36"
},
{
title: "Lyra no Nichiyoubi",
romanization: "",
duration: "4:56"
},
]
)
CreateAlbumWithTracks({
title: "Relief",
romanization: "",
romaji_artist: "Rajie",
japanese_artist: "",
year: "1984",
description: "",
flavor: "Funk"
},
[{
title: "Sesowa",
romanization: "",
duration: "4:52"
},
{
title: "Puli Bali ― Puli Bali",
romanization: "",
duration: "4:41"
},
{
title: "Inshōha",
romanization: "",
duration: "5:00"
},
{
title: "Celister no Bōmei",
romanization: "",
duration: "4:33"
},
{
title: "Goodbye Transfer",
romanization: "",
duration: "4:17"
},
{
title: "8 Tsuki no Memoirs",
romanization: "",
duration: "4:52"
},
{
title: "Mick e no Resistance",
romanization: "",
duration: "4:34"
},
{
title: "Ruri-iro no Koibito-tachi",
romanization: "",
duration: "4:12"
},
{
title: "Double Moon",
romanization: "",
duration: "4:39"
},
{
title: "MAMAMIYA―Uchū Kara no Okurimono―",
romanization: "",
duration: "3:53"
},
]
)
CreateAlbumWithTracks({
title: "Espresso",
romanization: "",
romaji_artist: "Rajie",
japanese_artist: "",
year: "1985",
description: "",
flavor: "Synthpop, New Wave"
},
[{
title: "Kanashimi no Elephant",
romanization: "",
duration: "4:41"
},
{
title: "Mangekyou",
romanization: "",
duration: "4:17"
},
{
title: "Espresso",
romanization: "",
duration: "4:34"
},
{
title: "Mizu no Kyoku",
romanization: "",
duration: "3:50"
},
{
title: "Magic Flower",
romanization: "",
duration: "4:27"
},
{
title: "Misshitsu",
romanization: "",
duration: "3:33"
},
{
title: "Yumeiro Densetsu",
romanization: "",
duration: "3:37"
},
{
title: "Hikari to Kage",
romanization: "",
duration: "3:50"
},
{
title: "Gozen 5-Ji no Mermaid",
romanization: "",
duration: "4:46"
},
]
)
CreateAlbumWithTracks({
title: "Love Heart",
romanization: "",
romaji_artist: "Rajie",
japanese_artist: "",
year: "1978",
description: "",
flavor: "Disco"
},
[{
title: "Tea for One",
romanization: "",
duration: "3:23"
},
{
title: "Kaze ni Yosete",
romanization: "",
duration: "2:43"
},
{
title: "Cool Down",
romanization: "",
duration: "4:46"
},
{
title: "Love Heart",
romanization: "",
duration: "4:16"
},
{
title: "Fuyu no Shouzou",
romanization: "",
duration: "4:52"
},
{
title: "Tabidachi",
romanization: "",
duration: "3:45"
},
{
title: "Yasashii Kankei",
romanization: "",
duration: "4:17"
},
{
title: "Last Chance",
romanization: "",
duration: "5:24"
},
{
title: "Just in the Rain",
romanization: "",
duration: "5:07"
},
]
)
CreateAlbumWithTracks({
title: "Quatre",
romanization: "",
romaji_artist: "Rajie",
japanese_artist: "",
year: "1979",
description: "",
flavor: "Disco, Synthpop"
},
[{
title: "Quatre",
romanization: "",
duration: "3:49"
},
{
title: "Tokimeki Mahou",
romanization: "",
duration: "3:59"
},
{
title: "Concert",
romanization: "",
duration: "3:59"
},
{
title: "Watashi wa Suteki",
romanization: "",
duration: "4:31"
},
{
title: "Kaze no Michi",
romanization: "",
duration: "4:10"
},
{
title: "Hoshi ni Notte",
romanization: "",
duration: "4:33"
},
{
title: "Christmas",
romanization: "",
duration: "3:42"
},
{
title: "Tsuki no Hikari",
romanization: "",
duration: "4:15"
},
{
title: "Ichimai no Photograph",
romanization: "",
duration: "3:35"
},
{
title: "Kirin no iru Fuukei",
romanization: "",
duration: "2:42"
},
]
)
CreateAlbumWithTracks({
title: "Mahiru no Hodou",
romanization: "",
romaji_artist: "Rajie",
japanese_artist: "",
year: "1980",
description: "",
flavor: "Synthpop, Funk"
},
[{
title: "Last Scene",
romanization: "",
duration: "4:46"
},
{
title: "Mahiru no Hodou",
romanization: "",
duration: "4:00"
},
{
title: "Kiri no Heya",
romanization: "",
duration: "3:48"
},
{
title: "Itsuwari no Hitomi",
romanization: "",
duration: "3:14"
},
{
title: "Apartment",
romanization: "",
duration: "4:31"
},
{
title: "Radio to Futari",
romanization: "",
duration: "4:11"
},
{
title: "Yojirean Twist",
romanization: "",
duration: "3:01"
},
{
title: "Midori no Koe",
romanization: "",
duration: "4:25"
},
{
title: "Aki no Arashi",
romanization: "",
duration: "4:30"
},
{
title: "Boukyaku",
romanization: "",
duration: "4:05"
},
])
CreateAlbumWithTracks({
title: "Come Along",
romanization: "",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "1997",
description: "",
flavor: "Funk, Compilation"
},
[{
title: "Bomber",
romanization: "",
duration: "5:12"
},
{
title: "Let's Dance Baby",
romanization: "",
duration: "3:34"
},
{
title: "Solid Slider",
romanization: "",
duration: "3:46"
},
{
title: "愛を描いて -Let's Kiss the Sun- ~ドリーム・オブ・ユー",
romanization: "",
duration: "3:54"
},
{
title: "ついておいで (Follow Me Along) ~蛍の光",
romanization: "",
duration: "3:05"
},
{
title: "Last Step",
romanization: "",
duration: "3:40"
},
{
title: "Love Space",
romanization: "",
duration: "3:50"
},
{
title: "Windy Lady",
romanization: "",
duration: "5:04"
},
{
title: "Circus Town",
romanization: "",
duration: "3:48"
},
{
title: "素敵な午後は",
romanization: "",
duration: "4:01"
},
{
title: "ペイパー・ドール (Paper Doll) ~This Could Be the Night",
romanization: "",
duration: "3:40"
},
{
title: "潮騒 (The Whispering Sea)",
romanization: "",
duration: "4:16"
},
]
)
CreateAlbumWithTracks({
title: "Come Along II",
romanization: "",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "1997",
description: "",
flavor: "Funk, Compilation"
},
[{
title: "Funky Flushin'",
romanization: "",
duration: "4:36"
},
{
title: "Silent Screamer",
romanization: "",
duration: "4:32"
},
{
title: "永遠のFull Moon ",
romanization: "",
duration: "3:40"
},
{
title: "Love Talkin' (Honey It's You)",
romanization: "",
duration: "5:40"
},
{
title: "夜の翼 (Nightwing)",
romanization: "",
duration: "0:43"
},
{
title: "あまく危険な香り",
romanization: "",
duration: "3:17"
},
{
title: "Sparkle",
romanization: "",
duration: "4:11"
},
{
title: "Loveland, Island",
romanization: "",
duration: "4:07"
},
{
title: "Ride on Time",
romanization: "",
duration: "5:50"
},
{
title: "いつか",
romanization: "",
duration: "5:15"
},
{
title: "Your Eyes",
romanization: "",
duration: "3:14"
},
]
)
CreateAlbumWithTracks({
title: "Ride on Time",
romanization: "",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "1980",
description: "",
flavor: "Funk"
},
[{
title: "いつか",
romanization: "",
duration: "5:49"
},
{
title: "Daydream",
romanization: "",
duration: "4:30"
},
{
title: "Silent Screamer",
romanization: "",
duration: "5:29"
},
{
title: "Ride on Time",
romanization: "",
duration: "5:53"
},
{
title: "夏への扉",
romanization: "",
duration: "4:41"
},
{
title: "My Sugar Babe",
romanization: "",
duration: "4:10"
},
{
title: "Rainy Day",
romanization: "",
duration: "5:19"
},
{
title: "雲のゆくえに",
romanization: "",
duration: "5:41"
},
{
title: "おやすみ",
romanization: "",
duration: "1:35"
},
]
)
CreateAlbumWithTracks({
title: "ミライのテーマ/うたのきしゃ",
romanization: "Mirai no Theme / Uta no Kisha",
romaji_artist: "Tatsuro Yamashita",
japanese_artist: "山下達郎",
year: "2018",
description: "",
flavor: "Dreamy"
},
[{
title: "ミライのテーマ",
romanization: "",
duration: "4:21"
},
{
title: "うたのきしゃ",
romanization: "",
duration: "5:55"
},
{
title: "僕らの夏の夢 (Acoustic Live Version)",
romanization: "",
duration: "5:03"
},
])
CreateAlbumWithTracks({
title: "Goodies",
romanization: "",
romaji_artist: "EPO",
japanese_artist: "",
year: "1980",
description: "",
flavor: "Boogie"
},
[{
title: "Cheer Girl",
romanization: "",
duration: "3:46"
},
{
title: "Goodies",
romanization: "",
duration: "4:11"
},
{
title: "分別ざかり",
romanization: "Bunbetsu-zakari",
duration: "3:00"
},
{
title: "足のないベッド",
romanization: "Ashi no Nai Bed",
duration: "4:10"
},
{
title: "Drive Song",
romanization: "",
duration: "3:22"
},
{
title: "週末は\"Weekend\"で",
romanization: "Shūmatsu wa \"Weekend\" de",
duration: "3:11"
},
{
title: "異国行き",
romanization: "Ikoku iki",
duration: "2:30"
},
{
title: "雨のケンネル通り",
romanization: "Ame no Kennel-dōri",
duration: "4:35"
},
{
title: "Goodies",
romanization: "",
duration: "1:15"
},
{
title: "Parade",
romanization: "",
duration: "3:35"
},
{
title: "Park Ave.1981",
romanization: "",
duration: "2:31"
},
]
)
CreateAlbumWithTracks({
title: "Vitamin E・P・O",
romanization: "",
romaji_artist: "EPO",
japanese_artist: "",
year: "1983",
description: "",
flavor: "Boogie"
},
[{
title: "Vitamin E・P・O",
romanization: "",
duration: "4:32"
},
{
title: "土曜の夜はパラダイス",
romanization: "Doyō no Yoru wa Paradaise",
duration: "4:10"
},
{
title: "無言のジェラシー",
romanization: "Mugon no Jealousy",
duration: "5:16"
},
{
title: "Would You Dance With Me",
romanization: "",
duration: "4:00"
},
{
title: "あなたを奪えない",
romanization: "Anata o Ubaenai",
duration: "3:55"
},
{
title: "う・ふ・ふ・ふ",
romanization: "U fu fu fu",
duration: "4:15"
},
{
title: "Pay Day",
romanization: "",
duration: "4:43"
},
{
title: "かなしいともだち",
romanization: "Kanashī Tomodachi",
duration: "4:36"
},
{
title: "五分遅れで見かけた人へ",
romanization: "Gobu Okure de Mikaketa Hito e",
duration: "3:54"
},
{
title: "Bye Bye Baby",
romanization: "",
duration: "2:45"
},
{
title: "う・ふ・ふ・ふ　part II",
romanization: "U fu fu fu part II",
duration: "0:30"
},
]
)
CreateAlbumWithTracks({
title: "Noriki",
romanization: "",
romaji_artist: "Noriki",
japanese_artist: "",
year: "1983",
description: "",
flavor: "Jazz, Synth"
},
[{
title: "ユー・ニード・ミー",
romanization: "You Need Me",
duration: "4:53"
},
{
title: "エニーウェイ",
romanization: "",
duration: "5:32"
},
{
title: "ブラック・ダック",
romanization: "Black Duck",
duration: "5:03"
},
{
title: "コージーズ・メロディ",
romanization: "Cozy Melody",
duration: "5:38"
},
{
title: "ラグ・ボックス",
romanization: "Rug Box",
duration: "4:47"
},
{
title: "バラード",
romanization: "Ballad",
duration: "6:08"
},
{
title: "ドゥ・ホワット・ユー・ドゥ",
romanization: "Do What You Do",
duration: "4:44"
},
{
title: "ゴー・オーバー・ザ・ヒル",
romanization: "Go Over The Hill",
duration: "6:53"
},
]
)
CreateAlbumWithTracks({
title: "From Asian Port",
romanization: "",
romaji_artist: "Parachute",
japanese_artist: "",
year: "1980",
description: "",
flavor: "Boogie, Latin"
},
[{
title: "Mystery of Asian Port",
romanization: "",
duration: "5:16"
},
{
title: "Fly With Me",
romanization: "",
duration: "4:16"
},
{
title: "Kowloon Daily",
romanization: "",
duration: "2:52"
},
{
title: "Essence of Romance",
romanization: "",
duration: "4:36"
},
{
title: "Visitor from Pluto",
romanization: "",
duration: "5:12"
},
{
title: "Spend a Little Time (With Me)",
romanization: "",
duration: "4:48"
},
{
title: "Miura Wind",
romanization: "",
duration: "2:36"
},
{
title: "Jasmine",
romanization: "",
duration: "5:00"
},
]
)
CreateAlbumWithTracks({
title: "Prologue",
romanization: "",
romaji_artist: "Akina Nakamori",
japanese_artist: "中森明菜",
year: "1982",
description: "",
flavor: "Idol"
},
[{
title: "Anata No Portrait",
romanization: "",
duration: "4:19"
},
{
title: "Bon Voyage",
romanization: "",
duration: "3:46"
},
{
title: "Image No Kageri",
romanization: "",
duration: "4:07"
},
{
title: "Aishu Magic",
romanization: "",
duration: "4:02"
},
{
title: "T Shirt Sunset",
romanization: "",
duration: "3:12"
},
{
title: "Ginga Densetsu",
romanization: "",
duration: "3:42"
},
{
title: "Slow Motion",
romanization: "",
duration: "4:06"
},
{
title: "A Gata Melancholy",
romanization: "",
duration: "3:13"
},
{
title: "Hitorikakera No Emerald",
romanization: "",
duration: "4:18"
},
{
title: "Downtown Story",
romanization: "",
duration: "4:13"
},
]
)
CreateAlbumWithTracks({
title: "Seventeen",
romanization: "",
romaji_artist: "Akina Nakamori",
japanese_artist: "中森明菜",
year: "1982",
description: "",
flavor: "Idol"
},
[{
title: "少女",
romanization: "Shōjo",
duration: "4:37"
},
{
title: "キャンセル!",
romanization: "Cancel!",
duration: "3:33"
},
{
title: "スローモーション",
romanization: "Slow Motion",
duration: "4:23"
},
{
title: "あなたのポートレート",
romanization: "Anata no Portrait",
duration: "5:21"
},
]
)
CreateAlbumWithTracks({
title: "Variation",
romanization: "",
romaji_artist: "Akina Nakamori",
japanese_artist: "中森明菜",
year: "1982",
description: "",
flavor: "Idol"
},
[{
title: "Introduction",
romanization: "",
duration: "1:46"
},
{
title: "Cancel!",
romanization: "",
duration: "3:24"
},
{
title: "Moroi Gogo",
romanization: "",
duration: "4:21"
},
{
title: "Aishu Magic",
romanization: "",
duration: "4:32"
},
{
title: "Sakihokoru Hana Ni",
romanization: "",
duration: "4:37"
},
{
title: "Yokohama A-Ku-Ma",
romanization: "",
duration: "3:42"
},
{
title: "Maerchen Location",
romanization: "",
duration: "4:37"
},
{
title: "Shojo A",
romanization: "",
duration: "3:34"
},
{
title: "Dai Nanakan (Septieme Sens)",
romanization: "",
duration: "4:12"
},
{
title: "Bye Bye Lullaby",
romanization: "",
duration: "3:43"
},
{
title: "Catastrophe No Amagasa",
romanization: "",
duration: "4:56"
},
{
title: "Ending",
romanization: "",
duration: "0:44"
},
]
)
CreateAlbumWithTracks({
title: "Fantasy",
romanization: "",
romaji_artist: "Akina Nakamori",
japanese_artist: "中森明菜",
year: "1983",
description: "",
flavor: "Idol"
},
[{
title: "Akina Kara...",
romanization: "",
duration: "2:17"
},
{
title: "Ruriiro No Yoruhe",
romanization: "",
duration: "3:40"
},
{
title: "Aventure",
romanization: "",
duration: "4:16"
},
{
title: "Nigiwai No Kisetsuhe",
romanization: "",
duration: "4:09"
},
{
title: "Kizudarake No Love",
romanization: "",
duration: "3:32"
},
{
title: "Mewotojite Excursion",
romanization: "",
duration: "4:36"
},
{
title: "Second Love",
romanization: "",
duration: "4:26"
},
{
title: "Shishunki",
romanization: "",
duration: "3:56"
},
{
title: "More Motto Koishite",
romanization: "",
duration: "4:05"
},
{
title: "Aitsu Wa Joke",
romanization: "",
duration: "3:27"
},
]
)
CreateAlbumWithTracks({
title: "New Akina  ~etranger~",
romanization: "",
romaji_artist: "Akina Nakamori",
japanese_artist: "中森明菜",
year: "1983",
description: "",
flavor: "Idol"
},
[{
title: "Sayonara Ne",
romanization: "",
duration: "4:26"
},
{
title: "Venus Tanjo",
romanization: "",
duration: "4:49"
},
{
title: "Sukoshidake Scandal",
romanization: "",
duration: "3:40"
},
{
title: "Kanshokiko",
romanization: "",
duration: "4:11"
},
{
title: "Renaissance - Yasashisa De Kaete",
romanization: "",
duration: "3:27"
},
{
title: "Mon Amour (Glass Ni Hanbun No Tasogare)",
romanization: "",
duration: "4:11"
},
{
title: "Stripe",
romanization: "",
duration: "4:37"
},
{
title: "Wakurabairo No Love Song",
romanization: "",
duration: "4:47"
},
{
title: "Tokini Wa Ennui",
romanization: "",
duration: "3:07"
},
{
title: "Kakugo No Aki",
romanization: "",
duration: "3:51"
},
]
)
CreateAlbumWithTracks({
title: "Possibility",
romanization: "",
romaji_artist: "Akina Nakamori",
japanese_artist: "中森明菜",
year: "1984",
description: "",
flavor: "Idol"
},
[{
title: "Southern Wind",
romanization: "",
duration: "3:52"
},
{
title: "Aki Wa Pastel Touch",
romanization: "",
duration: "4:08"
},
{
title: "October Storm",
romanization: "",
duration: "3:33"
},
{
title: "Refrain",
romanization: "",
duration: "4:57"
},
{
title: "Horizon",
romanization: "",
duration: "4:20"
},
{
title: "Aishu No Midnight",
romanization: "",
duration: "4:09"
},
{
title: "Jukkai (1984)",
romanization: "",
duration: "3:35"
},
{
title: "Shiroi Labyrinth",
romanization: "",
duration: "4:16"
},
{
title: "Blue Misty Rain",
romanization: "",
duration: "3:42"
},
{
title: "Dramatic Airport - Kita Wing Part Ii",
romanization: "",
duration: "4:11"
},
]
)
CreateAlbumWithTracks({
title: "Silent Love",
romanization: "",
romaji_artist: "Akina Nakamori",
japanese_artist: "中森明菜",
year: "1984",
description: "",
flavor: "Idol"
},
[{
title: "Blue Bay Story",
romanization: "",
duration: "4:00"
},
{
title: "Little Party",
romanization: "",
duration: "5:04"
},
{
title: "Terminal までの Eve",
romanization: "Terminal made no Eve",
duration: "4:05"
},
{
title: "星のx'mas-Berry - a Tender Star",
romanization: "Hoshi no Xmas-berry - a Tender Star",
duration: "5:57"
},
]
)
CreateAlbumWithTracks({
title: "Bitter and Sweet",
romanization: "",
romaji_artist: "Akina Nakamori",
japanese_artist: "中森明菜",
year: "1985",
description: "",
flavor: "Idol"
},
[{
title: "Kazarijanainoyo Namidawa",
romanization: "",
duration: "4:31"
},
{
title: "Romantic Na Yorudawa",
romanization: "",
duration: "3:39"
},
{
title: "Yokan",
romanization: "",
duration: "4:03"
},
{
title: "Tsukiyo No Venus",
romanization: "",
duration: "3:35"
},
{
title: "Babylon",
romanization: "",
duration: "4:37"
},
{
title: "Unsteady Love",
romanization: "",
duration: "4:31"
},
{
title: "Dreaming",
romanization: "",
duration: "4:31"
},
{
title: "Koibito No Iru Jikan",
romanization: "",
duration: "3:53"
},
{
title: "So Long",
romanization: "",
duration: "4:59"
},
{
title: "April Star",
romanization: "",
duration: "5:02"
},
]
)
CreateAlbumWithTracks({
title: "D404me",
romanization: "",
romaji_artist: "Akina Nakamori",
japanese_artist: "中森明菜",
year: "1985",
description: "",
flavor: "Idol"
},
[{
title: "Blue Ocean",
romanization: "",
duration: "3:59"
},
{
title: "Endless",
romanization: "",
duration: "4:22"
},
{
title: "Star Pilot",
romanization: "",
duration: "4:03"
},
{
title: "アレグロ・ビーチェ",
romanization: "Allegro Beach",
duration: "5:02"
},
{
title: "ノクターン",
romanization: "Nocturne",
duration: "4:20"
},
{
title: "ピ・ア・ス",
romanization: "Pi A Su",
duration: "3:59"
},
{
title: "マグネティック・ラブ",
romanization: "Magnetic Love",
duration: "3:37"
},
{
title: "ミ・アモーレ",
romanization: "Mi Amore",
duration: "4:18"
},
{
title: "モナリザ",
romanization: "Mona Lisa",
duration: "5:17"
},
{
title: "悲しい浪漫西",
romanization: "Kanashī Roman Nishi",
duration: "4:14"
},
]
)
CreateAlbumWithTracks({
title: "My Best Thanks",
romanization: "",
romaji_artist: "Akina Nakamori",
japanese_artist: "中森明菜",
year: "1985",
description: "",
flavor: "Idol"
},
[{
title: "ありふれた風景",
romanization: "Arifureta Fūkei",
duration: "4:36"
},
{
title: "予感",
romanization: "Yokan",
duration: "4:06"
},
{
title: "Don't Tell Me This Is Love",
romanization: "",
duration: "4:22"
},
]
)
CreateAlbumWithTracks({
title: "Crimson",
romanization: "",
romaji_artist: "Akina Nakamori",
japanese_artist: "中森明菜",
year: "1986",
description: "",
flavor: "Idol"
},
[{
title: "Mind Game",
romanization: "",
duration: "4:59"
},
{
title: "駅",
romanization: "Eki",
duration: "5:00"
},
{
title: "約束",
romanization: "Yakusoku",
duration: "4:05"
},
{
title: "ピンク・シャンパン",
romanization: "Pink Champagne",
duration: "4:04"
},
{
title: "Oh No, Oh Yes!",
romanization: "",
duration: "4:47"
},
{
title: "エキゾティカ",
romanization: "Exotica",
duration: "4:49"
},
{
title: "モザイクの城",
romanization: "Mosaic no Shiro",
duration: "3:58"
},
{
title: "Jealous Candle",
romanization: "",
duration: "3:53"
},
{
title: "赤のエナメル",
romanization: "Aka no Enamel",
duration: "4:23"
},
{
title: "ミック・ジャガーに微笑みを",
romanization: "Mick Jagger ni Hohoemi o",
duration: "4:40"
},
]
)
CreateAlbumWithTracks({
title: "不思議",
romanization: "Fushigi",
romaji_artist: "Akina Nakamori",
japanese_artist: "中森明菜",
year: "1986",
description: "",
flavor: "Idol"
},
[{
title: "Back Door Night",
romanization: "",
duration: "5:33"
},
{
title: "ニュー・ジェネレーション",
romanization: "New Generation",
duration: "3:59"
},
{
title: "Labyrinth",
romanization: "",
duration: "4:50"
},
{
title: "マリオネット",
romanization: "Marionette",
duration: "4:21"
},
{
title: "幻惑されて",
romanization: "Genwaku sa Rete",
duration: "4:11"
},
{
title: "ガラスの心",
romanization: "Glass no Kokoro",
duration: "4:24"
},
{
title: "Teenage Blue",
romanization: "",
duration: "4:14"
},
{
title: "燠火",
romanization: "Okibi",
duration: "4:08"
},
{
title: "Wait for Me",
romanization: "",
duration: "4:55"
},
{
title: "Mushroom Dance",
romanization: "",
duration: "4:33"
},
]
)
CreateAlbumWithTracks({
title: "Cd '87",
romanization: "",
romaji_artist: "Akina Nakamori",
japanese_artist: "中森明菜",
year: "1987",
description: "",
flavor: "Idol"
},
[{
title: "ラ・ボエーム",
romanization: "La Bohème",
duration: "4:41"
},
{
title: "最後のカルメン",
romanization: "Saigo no Carmen",
duration: "4:30"
},
{
title: "タンゴ・ノアール",
romanization: "Tango Noir",
duration: "4:09"
},
{
title: "ディザイアー情熱",
romanization: "Desire Passion",
duration: "4:24"
},
{
title: "危ないmon Amour",
romanization: "Abunai mon Amour",
duration: "4:47"
},
{
title: "ミロンギータ",
romanization: "Mirongita",
duration: "4:32"
},
{
title: "ジプシー・クイーン",
romanization: "Gypsy Queen",
duration: "4:29"
},
{
title: "Fin",
romanization: "",
duration: "4:09"
},
]
)
CreateAlbumWithTracks({
title: "Cross My Palm",
romanization: "",
romaji_artist: "Akina Nakamori",
japanese_artist: "中森明菜",
year: "1987",
description: "",
flavor: "Idol"
},
[{
title: "Cross My Palm",
romanization: "",
duration: "3:42"
},
{
title: "Political Moves",
romanization: "",
duration: "4:27"
},
{
title: "Slave for Love",
romanization: "",
duration: "3:54"
},
{
title: "Easy Rider",
romanization: "",
duration: "4:13"
},
{
title: "Modern Woman (Femme D' Aujourd' Hui)",
romanization: "",
duration: "4:12"
},
{
title: "The Look That Kills",
romanization: "",
duration: "3:38"
},
{
title: "Soft Touch",
romanization: "",
duration: "3:34"
},
{
title: "My Position",
romanization: "",
duration: "3:37"
},
{
title: "The Touch of a Heartache",
romanization: "",
duration: "4:13"
},
{
title: "House of Love",
romanization: "",
duration: "4:51"
},
{
title: "No More",
romanization: "",
duration: "3:15"
},
{
title: "He's Just in Love With the Beat",
romanization: "",
duration: "3:10"
},
]
)
CreateAlbumWithTracks({
title: "Femme Fatale",
romanization: "",
romaji_artist: "Akina Nakamori",
japanese_artist: "中森明菜",
year: "1988",
description: "",
flavor: "Idol"
},
[{
title: "Reversion",
romanization: "",
duration: "4:36"
},
{
title: "Heartbreak",
romanization: "",
duration: "4:09"
},
{
title: "Dakishimete",
romanization: "",
duration: "4:28"
},
{
title: "Femme Fatale",
romanization: "",
duration: "4:30"
},
{
title: "I Know Kodokunosei",
romanization: "",
duration: "4:31"
},
{
title: "La Liberté",
romanization: "",
duration: "4:33"
},
{
title: "So Mad",
romanization: "",
duration: "4:17"
},
{
title: "Paradise Lost",
romanization: "",
duration: "4:06"
},
{
title: "Move Me",
romanization: "",
duration: "4:03"
},
{
title: "Jive",
romanization: "",
duration: "4:00"
},
]
)
CreateAlbumWithTracks({
title: "Stock",
romanization: "",
romaji_artist: "Akina Nakamori",
japanese_artist: "中森明菜",
year: "1988",
description: "",
flavor: "Idol"
},
[{
title: "Farewell",
romanization: "",
duration: "4:25"
},
{
title: "Yume No Fuchi",
romanization: "",
duration: "4:56"
},
{
title: "Crystal Heaven",
romanization: "",
duration: "4:46"
},
{
title: "Mada Jubunjanai",
romanization: "",
duration: "4:19"
},
{
title: "Fire Starter",
romanization: "",
duration: "4:11"
},
{
title: "Nightmare Akumu",
romanization: "",
duration: "4:23"
},
{
title: "I Wanna Chance",
romanization: "",
duration: "4:32"
},
{
title: "Poison Lips",
romanization: "",
duration: "4:01"
},
{
title: "Shojo Densetsu",
romanization: "",
duration: "4:22"
},
{
title: "Foggy Relation",
romanization: "",
duration: "4:34"
},
]
)
CreateAlbumWithTracks({
title: "Wonder",
romanization: "",
romaji_artist: "Akina Nakamori",
japanese_artist: "中森明菜",
year: "1988",
description: "",
flavor: "Idol"
},
[{
title: "Labyrinth",
romanization: "",
duration: "4:57"
},
{
title: "燠火",
romanization: "Okibi",
duration: "4:17"
},
{
title: "不思議",
romanization: "Fushigi",
duration: "4:33"
},
{
title: "ガラスの心",
romanization: "Glass no Kokoro",
duration: "4:31"
},
{
title: "Marionette",
romanization: "",
duration: "4:18"
},
{
title: "Teenage Blue",
romanization: "",
duration: "4:12"
},
]
)
CreateAlbumWithTracks({
title: "Cruise",
romanization: "",
romaji_artist: "Akina Nakamori",
japanese_artist: "中森明菜",
year: "1989",
description: "",
flavor: "Idol"
},
[{
title: "Uragiri",
romanization: "",
duration: "4:45"
},
{
title: "Akai Mystery",
romanization: "",
duration: "3:46"
},
{
title: "Sayonaraja Owaranai",
romanization: "",
duration: "3:41"
},
{
title: "Liar",
romanization: "",
duration: "4:32"
},
{
title: "Ranbi",
romanization: "",
duration: "4:28"
},
{
title: "Close Your Eyes",
romanization: "",
duration: "3:36"
},
{
title: "Standing in Blue",
romanization: "",
duration: "5:31"
},
{
title: "Kazewa Sorano Kanata",
romanization: "",
duration: "4:37"
},
{
title: "Singer",
romanization: "",
duration: "4:29"
},
{
title: "Amega Futteta...",
romanization: "",
duration: "5:05"
},
])
CreateAlbumWithTracks({
title: "Quiet Storm",
romanization: "",
romaji_artist: "Kanako Wada",
japanese_artist: "和田加奈子",
year: "1987",
description: "",
flavor: "Synth, Disco"
},
[{
title: "砂に書かれたドキュメント",
romanization: "Suna ni Kaka Reta Documents",
duration: "4:25"
},
{
title: "風のOxygen",
romanization: "Kaze no Oxygen",
duration: "4:08"
},
{
title: "ピンクのトウ・シューズ",
romanization: "Pink Toe-shoes",
duration: "4:03"
},
{
title: "梨の形をしたblue",
romanization: "Nashi no Katachi o Shita Blue",
duration: "4:37"
},
{
title: "琥珀の涙",
romanization: "Kohaku no Namida",
duration: "2:56"
},
{
title: "シナモンとブラウン･シュガー",
romanization: "Cinnamon and Brown Sugar",
duration: "4:53"
},
{
title: "Be My J-Boy",
romanization: "",
duration: "4:41"
},
{
title: "めまい",
romanization: "Memai",
duration: "4:05"
},
{
title: "真昼のポーリーヌ",
romanization: "Mahiru no Pauline",
duration: "4:13"
},
{
title: "ゴシップ･グラマー -空っぽのガレージ-",
romanization: "Gossip Glamor - Karappo no Garage",
duration: "4:54"
},
]
)
CreateAlbumWithTracks({
title: "Kana",
romanization: "",
romaji_artist: "Kanako Wada",
japanese_artist: "和田加奈子",
year: "1988",
description: "",
flavor: "Synth, Disco"
},
[{
title: "Party Town〜what Can I Do for You〜",
romanization: "",
duration: "4:14"
},
{
title: "悲しいハートは燃えている",
romanization: "Kanashī Heart wa Moete Iru",
duration: "4:04"
},
{
title: "誕生日はマイナス1",
romanization: "Tanjōbi wa Mainasu 1",
duration: "3:47"
},
{
title: "不確かなi Love You",
romanization: "Futashikana I Love You",
duration: "3:56"
},
{
title: "鳥のように",
romanization: "Tori no Yō Ni",
duration: "4:17"
},
{
title: "Sunday Brunch",
romanization: "",
duration: "3:55"
},
{
title: "冬の水族館",
romanization: "Fuyu no Suizokukan",
duration: "1:14"
},
{
title: "哀しみのヴァージンロード〜never Fall in Love〜",
romanization: "Kanashimi no Virgin Road 〜Never Fall in Love〜",
duration: "4:39"
},
{
title: "Musicに肩よせて",
romanization: "Music ni Kata Yosete",
duration: "4:39"
},
{
title: "C.クローデルの罪",
romanization: "C. Claudel no Tsumi",
duration: "4:23"
},
]
)
CreateAlbumWithTracks({
title: "Vocu",
romanization: "",
romaji_artist: "Kanako Wada",
japanese_artist: "和田加奈子",
year: "1988",
description: "",
flavor: "Synth, Disco"
},
[{
title: "ママはライバル",
romanization: "Mama ha Rival",
duration: "4:12"
},
{
title: "Hellow My Radio",
romanization: "",
duration: "3:39"
},
{
title: "あの空を抱きしめて",
romanization: "Ano sora o Dakishimete",
duration: "4:19"
},
{
title: "失恋教室",
romanization: "Shitsuren Kyōshitsu",
duration: "4:01"
},
{
title: "プラモデルの翼",
romanization: "Plastic Model no Wings",
duration: "5:30"
},
{
title: "ラッキー･ラブ",
romanization: "Lucky Love",
duration: "4:08"
},
{
title: "Asian Dream",
romanization: "",
duration: "3:56"
},
{
title: "向かい風に",
romanization: "Mukaikaze ni",
duration: "3:45"
},
{
title: "パパのJazz",
romanization: "Papa no Jazz",
duration: "4:22"
},
{
title: "約束のイヴ",
romanization: "Yakusoku no Eve",
duration: "6:02"
},
]
)
CreateAlbumWithTracks({
title: "Dear",
romanization: "",
romaji_artist: "Kanako Wada",
japanese_artist: "和田加奈子",
year: "1989",
description: "",
flavor: "Synth, Disco"
},
[{
title: "赤と黒",
romanization: "Aka to Kuro",
duration: "4:47"
},
{
title: "Dreamin' Lady",
romanization: "",
duration: "4:36"
},
{
title: "Honey Moon",
romanization: "",
duration: "5:16"
},
{
title: "If",
romanization: "",
duration: "5:11"
},
{
title: "特別シート",
romanization: "Tokubetsu Shīto",
duration: "4:17"
},
{
title: "流れるように",
romanization: "Nagareru yō ni",
duration: "5:02"
},
{
title: "Crescent Moon",
romanization: "",
duration: "3:55"
},
{
title: "Le Vent Doux",
romanization: "",
duration: "4:41"
},
{
title: "See You",
romanization: "",
duration: "4:08"
},
]
)
CreateAlbumWithTracks({
title: "Dessertに星くずのゼリーを",
romanization: "Dessert ni Hoshikuzu no Zerī o",
romaji_artist: "Kanako Wada",
japanese_artist: "和田加奈子",
year: "1990",
description: "",
flavor: "Synth, Disco"
},
[{
title: "月のHotel",
romanization: "Tsuki no Hotel",
duration: "6:12"
},
{
title: "Good Luck Factory",
romanization: "",
duration: "4:37"
},
{
title: "Convenience Boy",
romanization: "",
duration: "4:41"
},
{
title: "Baby Classのgrandmother",
romanization: "Baby Class no Grandmother",
duration: "4:54"
},
{
title: "風の丘",
romanization: "Kaze no Oka",
duration: "4:45"
},
{
title: "Heartでふりむいて",
romanization: "Heart de Furimuite",
duration: "4:03"
},
{
title: "涙のPuddle",
romanization: "Namida no Puddle",
duration: "4:52"
},
{
title: "想いのかけら",
romanization: "Omoi no Kake-ra",
duration: "4:56"
},
{
title: "'90 1/8 Junの旅",
romanization: "'90 1/8 Jun no Tabi",
duration: "3:56"
},
]
)
CreateAlbumWithTracks({
title: "Relief 72 Hours",
romanization: "",
romaji_artist: "Yurie Kokubu",
japanese_artist: "国分友里恵",
year: "1983",
description: "",
flavor: "Funk"
},
[{
title: "スノッブな夜へ",
romanization: "Snob na Yoru e",
duration: "4:51"
},
{
title: "恋の横顔",
romanization: "Koi no Yokogao",
duration: "3:22"
},
{
title: "Weekend Love",
romanization: "",
duration: "4:07"
},
{
title: "Love Song",
romanization: "",
duration: "4:12"
},
{
title: "とばして Taxi Man",
romanization: "Tobashite Taxi Man",
duration: "4:37"
},
{
title: "回転扉",
romanization: "Kaiten Tobira",
duration: "4:04"
},
{
title: "Dancing Tonight",
romanization: "",
duration: "3:10"
},
{
title: "パーティーにひとり",
romanization: "Party ni Hitori",
duration: "4:23"
},
{
title: "Just a Joke",
romanization: "",
duration: "3:09"
},
{
title: "Last Woman",
romanization: "",
duration: "5:00"
},
]
)
CreateAlbumWithTracks({
title: "Steps",
romanization: "",
romaji_artist: "Yurie Kokubu",
japanese_artist: "国分友里恵",
year: "1987",
description: "",
flavor: "Synth, Funk"
},
[{
title: "I Got You Inside Out",
romanization: "",
duration: "4:02"
},
{
title: "I Wanna Be With You",
romanization: "",
duration: "5:06"
},
{
title: "Cosmic Love",
romanization: "",
duration: "4:29"
},
{
title: "Just Go Up",
romanization: "",
duration: "4:16"
},
{
title: "Take a Little Bit of My Love",
romanization: "",
duration: "4:09"
},
{
title: "Counting Down the Days",
romanization: "",
duration: "4:16"
},
{
title: "In Your Eyes",
romanization: "",
duration: "5:13"
},
{
title: "Margarita",
romanization: "",
duration: "4:27"
},
{
title: "You Are Love for Me",
romanization: "",
duration: "5:18"
},
{
title: "流れるままに～落花流水～",
romanization: "Nagareru Mama ni ~ Rakka Ryūsui ~",
duration: "5:18"
},
{
title: "リフレイン",
romanization: "Refrain",
duration: "4:21"
},
]
)
CreateAlbumWithTracks({
title: "Silent Moon",
romanization: "",
romaji_artist: "Yurie Kokubu",
japanese_artist: "国分友里恵",
year: "1990",
description: "",
flavor: "Synth"
},
[{
title: "Silent Moon",
romanization: "",
duration: "5:31"
},
{
title: "One More Chance",
romanization: "",
duration: "5:36"
},
{
title: "Saturday Nite",
romanization: "",
duration: "4:49"
},
{
title: "遠い夜明け",
romanization: "Tōi Yoake",
duration: "4:41"
},
{
title: "私にだけforever",
romanization: "Watashi ni Dake Forever",
duration: "5:02"
},
{
title: "I Love You",
romanization: "",
duration: "6:17"
},
{
title: "It's a Destiny",
romanization: "",
duration: "4:43"
},
{
title: "Moment of Summer",
romanization: "",
duration: "4:30"
},
{
title: "It's a Party",
romanization: "",
duration: "3:00"
},
{
title: "It's Hard to Say Good-Bye～さよならは愛の言葉～",
romanization: "It's Hard to Say Good-Bye～Sayonara wa Ai no Kotoba～",
duration: "6:34"
},
{
title: "Whisperin'",
romanization: "",
duration: "5:16"
},
{
title: "I Love You (English Version)",
romanization: "",
duration: "4:31"
},
{
title: "Easy Love",
romanization: "",
duration: "4:42"
},
]
)
CreateAlbumWithTracks({
title: "ペイパー・ムーン",
romanization: "Paper Moon",
romaji_artist: "Junko Ohashi",
japanese_artist: "大橋純子",
year: "1976",
description: "",
flavor: "Ballad, Funk"
},
[{
title: "愛の祈り (Still a Boy)",
romanization: "Ai no Inori (Still a Boy)",
duration: "3:53"
},
{
title: "ひとり",
romanization: "Hitori",
duration: "3:42"
},
{
title: "キャシーの噂",
romanization: "Kyashī no Uwasa",
duration: "3:07"
},
{
title: "白い午後",
romanization: "Shiroi Gogo",
duration: "4:16"
},
{
title: "心に住めない女",
romanization: "Kokoro ni Sumenai Onna",
duration: "3:20"
},
{
title: "やさしい人",
romanization: "Yasashī Hito",
duration: "2:50"
},
{
title: "ペイパー・ムーン",
romanization: "Paper Moon",
duration: "4:06"
},
{
title: "砂時計",
romanization: "Sunadokei",
duration: "4:22"
},
{
title: "別れのワイン",
romanization: "Wakare no Wine",
duration: "3:52"
},
{
title: "午後3時の祈り",
romanization: "Gogo 3-ji no Inori",
duration: "3:14"
},
{
title: "ジョーク",
romanization: "Joke",
duration: "3:37"
},
{
title: "ひきしお",
romanization: "Hikishi o",
duration: "5:30"
},
{
title: "坂の上の家",
romanization: "Sakanoue no Ie",
duration: "3:07"
},
{
title: "夜汽車よ夜汽車",
romanization: "Yogisha yo Yogisha",
duration: "3:17"
},
{
title: "私今日はとてもがんこです",
romanization: "Watashi Kyō wa Totemo gan Kodesu",
duration: "2:40"
},
]
)
CreateAlbumWithTracks({
title: "Crystal City",
romanization: "",
romaji_artist: "Junko Ohashi",
japanese_artist: "大橋純子",
year: "1977",
description: "",
flavor: "Disco, Funk"
},
[{
title: "クリスタル・シティー",
romanization: "Crystal City",
duration: "4:04"
},
{
title: "霧に抱かれて",
romanization: "Kiri ni Idakarete",
duration: "4:14"
},
{
title: "Funky Little Queenie",
romanization: "",
duration: "3:18"
},
{
title: "男と女のいる舗道",
romanization: "Otome no Iru Hodō",
duration: "3:40"
},
{
title: "落日風景",
romanization: "Rakujitsu Fūkei",
duration: "3:56"
},
{
title: "アラビアン・ナイト",
romanization: "Arabian Night",
duration: "4:33"
},
{
title: "夜のハイウェイ",
romanization: "Yoru no Highway",
duration: "4:03"
},
{
title: "炎のヒロイン",
romanization: "Honō no Heroine",
duration: "3:47"
},
{
title: "風のシルエット",
romanization: "Kaze no Silhouette",
duration: "3:50"
},
{
title: "Like a Sea Gull",
romanization: "",
duration: "4:30"
},
]
)
CreateAlbumWithTracks({
title: "Rainbow",
romanization: "",
romaji_artist: "Junko Ohashi",
japanese_artist: "大橋純子",
year: "1977",
description: "",
flavor: "Disco, Funk"
},
[{
title: "Simple Love",
romanization: "",
duration: "3:47"
},
{
title: "Feel So Bad",
romanization: "",
duration: "4:16"
},
{
title: "白い鎮魂歌",
romanization: "Shiroi Chinkonka",
duration: "4:30"
},
{
title: "二人の夢の島",
romanization: "Futari no Yume no Shima",
duration: "2:42"
},
{
title: "Natural Foods",
romanization: "",
duration: "3:19"
},
{
title: "The Last Number",
romanization: "",
duration: "4:50"
},
{
title: "Rainy Saturday & Coffee Break",
romanization: "",
duration: "3:45"
},
{
title: "Lucky Lady",
romanization: "",
duration: "3:00"
},
{
title: "愛にさよなら",
romanization: "Ai ni Sayonara",
duration: "5:03"
},
{
title: "季節のない街角で",
romanization: "Kisetsu no Naimachi-kaku de",
duration: "4:06"
},
{
title: "今シルエットのように",
romanization: "Ima Shiruetto no Yō ni",
duration: "5:00"
},
{
title: "Mr.Smile",
romanization: "",
duration: "4:01"
},
{
title: "The Lovin' Spoonful",
romanization: "",
duration: "4:14"
},
]
)
CreateAlbumWithTracks({
title: "Tea for Tears",
romanization: "",
romaji_artist: "Junko Ohashi",
japanese_artist: "大橋純子",
year: "1981",
description: "",
flavor: "Funk, Disco"
},
[{
title: "Another Day, Another Love",
romanization: "",
duration: "4:11"
},
{
title: "恋のアドリブ",
romanization: "Koi no Adoribu",
duration: "3:59"
},
{
title: "サイレーン (海の精の物語)",
romanization: "Siren (Umi no Sei no Monogatari)",
duration: "4:14"
},
{
title: "ラ・ローザ",
romanization: "La Rosa",
duration: "4:23"
},
{
title: "テレフォン・ナンバー",
romanization: "Telephone Number",
duration: "3:59"
},
{
title: "Maroon Person",
romanization: "",
duration: "5:35"
},
{
title: "シジフォスの朝",
romanization: "Sygiphos no Asa",
duration: "4:12"
},
{
title: "ブックエンド",
romanization: "Book end",
duration: "3:46"
},
{
title: "名前のない馬",
romanization: "Namae no nai Uma",
duration: "3:19"
},
{
title: "Tea for Tears",
romanization: "",
duration: "4:21"
},
{
title: "ファンタジック・ウーマン",
romanization: "Fantastic Woman",
duration: "3:58"
},
{
title: "アプローズ",
romanization: "Applause",
duration: "3:35"
},
{
title: "過ぎてきた河",
romanization: "Sugite kita Kawa",
duration: "3:05"
},
{
title: "夏の嵐",
romanization: "Natsu no Arashi",
duration: "4:51"
},
]
)
CreateAlbumWithTracks({
title: "Magical",
romanization: "",
romaji_artist: "Junko Ohashi",
japanese_artist: "大橋純子",
year: "1983",
description: "",
flavor: "Funk"
},
[{
title: "Isn't It Magic",
romanization: "",
duration: "3:51"
},
{
title: "Perfume",
romanization: "",
duration: "4:06"
},
{
title: "A Love Affair",
romanization: "",
duration: "4:41"
},
{
title: "I Love You So",
romanization: "",
duration: "4:40"
},
{
title: "Lost Love",
romanization: "",
duration: "4:25"
},
{
title: "黄昏",
romanization: "Tasogare",
duration: "4:52"
},
{
title: "Telephone Number",
romanization: "",
duration: "3:58"
},
{
title: "Sherry",
romanization: "",
duration: "4:20"
},
{
title: "Another Day, Another Love",
romanization: "",
duration: "4:08"
},
{
title: "Dancin'",
romanization: "",
duration: "4:23"
},
{
title: "In Your Lovin'",
romanization: "",
duration: "4:53"
},
{
title: "素顔のままで",
romanization: "Sugao no Mamade",
duration: "5:33"
},
]
)
CreateAlbumWithTracks({
title: "Point Zero",
romanization: "",
romaji_artist: "Junko Ohashi",
japanese_artist: "大橋純子",
year: "1983",
description: "",
flavor: "Funk"
},
[{
title: "Dancin'",
romanization: "",
duration: "4:28"
},
{
title: "In Your Lovin'",
romanization: "",
duration: "4:56"
},
{
title: "Can't Get Enough",
romanization: "",
duration: "4:28"
},
{
title: "Firefly",
romanization: "",
duration: "5:05"
},
{
title: "Caught in a Shower",
romanization: "",
duration: "3:39"
},
{
title: "Sensual Night",
romanization: "",
duration: "3:25"
},
{
title: "Perfect Melody",
romanization: "",
duration: "3:34"
},
{
title: "素顔のままで",
romanization: "Sugao No Mamade",
duration: "5:44"
},
{
title: "A Love Affair",
romanization: "",
duration: "4:43"
},
]
)
CreateAlbumWithTracks({
title: "Question",
romanization: "",
romaji_artist: "Junko Ohashi",
japanese_artist: "大橋純子",
year: "1988",
description: "",
flavor: "Synth, Funk"
},
[{
title: "Reaction",
romanization: "",
duration: "5:17"
},
{
title: "Sleepless Heart",
romanization: "",
duration: "5:51"
},
{
title: "悲しいほどジェラシー",
romanization: "Kanashī hodo Jealousy",
duration: "5:23"
},
{
title: "横顔-Profile-",
romanization: "Yokogao - Profile -",
duration: "5:04"
},
{
title: "あなたにつつまれて",
romanization: "Anata ni Tsutsuma Rete",
duration: "4:31"
},
{
title: "地球仪上の夏",
romanization: "Chikyū Jo No Natsu",
duration: "4:42"
},
{
title: "踊らせて･･･",
romanization: "Odora sete...",
duration: "4:38"
},
{
title: "ため息に抱かれて",
romanization: "Tameiki ni Idakarete",
duration: "4:37"
},
{
title: "楽园",
romanization: "Rakuen",
duration: "5:16"
},
{
title: "Panorama",
romanization: "",
duration: "5:00"
},
]
)
CreateAlbumWithTracks({
title: "Pocket Park",
romanization: "",
romaji_artist: "Miki Matsubara",
japanese_artist: "松原みき",
year: "1980",
description: "",
flavor: "Funk"
},
[{
title: "真夜中のドア / Stay With Me",
romanization: "Mayonakanodoa / Stay With Me",
duration: "5:11"
},
{
title: "It's So Creamy",
romanization: "",
duration: "3:42"
},
{
title: "Cryin'",
romanization: "",
duration: "3:56"
},
{
title: "That's All",
romanization: "",
duration: "4:02"
},
{
title: "His Woman",
romanization: "",
duration: "4:07"
},
{
title: "Manhattan Wind",
romanization: "",
duration: "3:29"
},
{
title: "愛はエネルギー",
romanization: "Ai wa Energy",
duration: "3:36"
},
{
title: "そうして私が",
romanization: "Sōshite Watashi ga",
duration: "4:16"
},
{
title: "Trouble Maker",
romanization: "",
duration: "4:33"
},
{
title: "Mind Game",
romanization: "",
duration: "3:58"
},
{
title: "偽りのない日々",
romanization: "Itsuwari no nai Hibi",
duration: "3:54"
},
]
)
CreateAlbumWithTracks({
title: "Cupid",
romanization: "",
romaji_artist: "Miki Matsubara",
japanese_artist: "松原みき",
year: "1981",
description: "",
flavor: "Funk"
},
[{
title: "10カラット・ラブ",
romanization: "10-Carat Love",
duration: "4:07"
},
{
title: "One Way Street",
romanization: "",
duration: "4:20"
},
{
title: "青いボールペン",
romanization: "Aoi Ballpoint Pen",
duration: "4:02"
},
{
title: "私はもどれない",
romanization: "Watashi wa Modorenai",
duration: "3:53"
},
{
title: "オアシス",
romanization: "Oasis",
duration: "4:40"
},
{
title: "-Cupid-",
romanization: "",
duration: "5:22"
},
{
title: "ニートな午後3時",
romanization: "Neat na Gogo 3-ji",
duration: "4:00"
},
{
title: "スーヴェニール",
romanization: "Svennier",
duration: "4:49"
},
{
title: "One Summer Night",
romanization: "",
duration: "3:34"
},
{
title: "Dream in the Screen",
romanization: "",
duration: "4:23"
},
]
)
CreateAlbumWithTracks({
title: "Myself",
romanization: "",
romaji_artist: "Miki Matsubara",
japanese_artist: "松原みき",
year: "1982",
description: "",
flavor: "Funk"
},
[{
title: "バレリーナ",
romanization: "Ballerina",
duration: "3:13"
},
{
title: "三人で踊らない",
romanization: "San'nin de Odoranai",
duration: "4:28"
},
{
title: "微熱が平熱",
romanization: "Binetsu ga Heinetsu",
duration: "3:22"
},
{
title: "Somewhere",
romanization: "",
duration: "4:19"
},
{
title: "カランドリエ",
romanization: "Carandelier",
duration: "4:13"
},
{
title: "流星スウィング",
romanization: "Ryūsei Swing",
duration: "3:51"
},
{
title: "See-Saw Love",
romanization: "",
duration: "3:39"
},
{
title: "5つ数える間に",
romanization: "Itsutsu Kazoeru ma ni",
duration: "4:04"
},
{
title: "ハレーション",
romanization: "Halation",
duration: "3:18"
},
{
title: "Myself (Instrumental)",
romanization: "",
duration: "1:15"
},
{
title: "Three Candles",
romanization: "",
duration: "4:59"
},
]
)
CreateAlbumWithTracks({
title: "Revue",
romanization: "",
romaji_artist: "Miki Matsubara",
japanese_artist: "松原みき",
year: "1983",
description: "",
flavor: "Funk"
},
[{
title: "ムーンナイトレビユー",
romanization: "Moonlight Review",
duration: "3:43"
},
{
title: "雨のちハレルヤ",
romanization: "Ame nochi Hallelujah",
duration: "3:51"
},
{
title: "Sweet サレンダー",
romanization: "Sweet Surrender",
duration: "3:32"
},
{
title: "シャンデリア･ミラージュ",
romanization: "Chandelier Mirage",
duration: "4:02"
},
{
title: "遅れて来た九月",
romanization: "Okurete Kita 9-gatsu",
duration: "3:59"
},
{
title: "彼女のいちばん素敵な夜",
romanization: "Kanojo no Ichiban Sutekina Yoru",
duration: "3:29"
},
{
title: "アラモード",
romanization: "À la mode",
duration: "4:19"
},
{
title: "スターダストレイン",
romanization: "Stardust Rain",
duration: "3:41"
},
{
title: "風のフォトグラフ",
romanization: "Kaze no Photograph",
duration: "4:39"
},
{
title: "もう一度fall in Love",
romanization: "Mōichido Fall in Love",
duration: "4:09"
},
]
)
CreateAlbumWithTracks({
title: "Lady Bounce",
romanization: "",
romaji_artist: "Miki Matsubara",
japanese_artist: "松原みき",
year: "1985",
description: "",
flavor: "Funk"
},
[{
title: "12月のパリ",
romanization: "12-tsuki no Paris",
duration: "4:14"
},
{
title: "魔法じゃないの",
romanization: "Mahō Janai no",
duration: "3:20"
},
{
title: "恋にお招ばれ",
romanization: "Koi ni o Shoubare",
duration: "3:31"
},
{
title: "モダンに殺気",
romanization: "Modern ni Sakki",
duration: "3:45"
},
{
title: "Bon Voyage",
romanization: "",
duration: "2:57"
},
{
title: "恋するセゾン -色恋来い-",
romanization: "Koisuru Saison - Irokoi Koi -",
duration: "4:10"
},
{
title: "逃避行",
romanization: "Tōhikō",
duration: "4:10"
},
{
title: "サングラスはもういらない",
romanization: "Sangurasu wa Mō Iranai",
duration: "3:17"
},
{
title: "終わりゆく夏",
romanization: "Owari Yuku Natsu",
duration: "3:56"
},
{
title: "恋はふたたび旅立つ",
romanization: "Koi wa Futatabi Tabidatsu",
duration: "4:17"
},
]
)
CreateAlbumWithTracks({
title: "Garasu No Border",
romanization: "",
romaji_artist: "Yumi Yano",
japanese_artist: "",
year: "1985",
description: "",
flavor: "Synth"
},
[{
title: "夏への手紙",
romanization: "Natsu e no Tegami",
duration: "3:51"
},
{
title: "Marine Blue",
romanization: "",
duration: "3:38"
},
{
title: "恋のクスリはバンシャガラン",
romanization: "Koi no Kusuri wa Banshagaran",
duration: "3:07"
},
{
title: "Stay Next to Me",
romanization: "",
duration: "3:08"
},
{
title: "マーマレード飛行",
romanization: "Marmelade hikō",
duration: "4:04"
},
{
title: "幻の輪舞",
romanization: "Maboroshi no Rinbu",
duration: "3:31"
},
{
title: "真珠海岸",
romanization: "Shinju Kaigan",
duration: "4:08"
},
{
title: "ガラスの国境",
romanization: "Glass no Border",
duration: "4:15"
},
{
title: "Fade Out",
romanization: "",
duration: "4:15"
},
{
title: "ちぎれ雲にウィング",
romanization: "Chigiregumo ni Wing",
duration: "2:57"
},
]
)
CreateAlbumWithTracks({
title: "Ocean Side",
romanization: "",
romaji_artist: "Momoko Kikuchi",
japanese_artist: "菊池桃子",
year: "1984",
description: "",
flavor: "Funk, Idol"
},
[{
title: "Ocean Side",
romanization: "",
duration: "4:39"
},
{
title: "Shadow Surfer",
romanization: "",
duration: "3:30"
},
{
title: "Blind Curve",
romanization: "",
duration: "4:03"
},
{
title: "Summer Eyes",
romanization: "",
duration: "3:38"
},
{
title: "ふたりの Night Dive",
romanization: "Futari no Night Dive",
duration: "4:23"
},
{
title: "青春のいじわる",
romanization: "Seishun no Ijiwaru",
duration: "4:33"
},
{
title: "Evening Break",
romanization: "",
duration: "3:49"
},
{
title: "So Many Dreams",
romanization: "",
duration: "5:29"
},
{
title: "I Will",
romanization: "",
duration: "6:58"
},
]
)
CreateAlbumWithTracks({
title: "Tropic of Capricorn",
romanization: "",
romaji_artist: "Momoko Kikuchi",
japanese_artist: "菊池桃子",
year: "1985",
description: "",
flavor: "Funk, Idol"
},
[{
title: "Sotsugyo",
romanization: "",
duration: "3:57"
},
{
title: "Calendar Ni Initial",
romanization: "",
duration: "3:45"
},
{
title: "Koi No Protection",
romanization: "",
duration: "4:00"
},
{
title: "Manatsu No Sequence",
romanization: "",
duration: "4:43"
},
{
title: "Dear Children",
romanization: "",
duration: "5:17"
},
{
title: "Boyfriend",
romanization: "",
duration: "4:36"
},
{
title: "Southern Cross Dreaming",
romanization: "",
duration: "5:05"
},
{
title: "Alpha Flight",
romanization: "",
duration: "4:18"
},
{
title: "Ai No Surf Break",
romanization: "",
duration: "5:15"
},
{
title: "Minami Kaikisen",
romanization: "",
duration: "5:25"
},
]
)
CreateAlbumWithTracks({
title: "Adventure",
romanization: "",
romaji_artist: "Momoko Kikuchi",
japanese_artist: "菊池桃子",
year: "1986",
description: "",
flavor: "Synth, Idol"
},
[{
title: "Overture",
romanization: "",
duration: "2:23"
},
{
title: "Adventure",
romanization: "",
duration: "4:39"
},
{
title: "もう逢えないかもしれない",
romanization: "Mōaenaika mo shirenai",
duration: "4:14"
},
{
title: "波になりたい",
romanization: "Nami ni Naritai",
duration: "4:04"
},
{
title: "Night Cruising",
romanization: "",
duration: "4:57"
},
{
title: "雨のrealize",
romanization: "Ame no Realize",
duration: "4:13"
},
{
title: "赤い稲妻",
romanization: "Akai Inazuma",
duration: "4:02"
},
{
title: "Good Friend",
romanization: "",
duration: "4:11"
},
{
title: "Mystical Composer",
romanization: "",
duration: "5:07"
},
{
title: "Tomorrow",
romanization: "",
duration: "4:21"
},
]
)
CreateAlbumWithTracks({
title: "Escape from Dimension",
romanization: "",
romaji_artist: "Momoko Kikuchi",
japanese_artist: "菊池桃子",
year: "1987",
description: "",
flavor: "Synth"
},
[{
title: "Starlight Movement",
romanization: "",
duration: "4:18"
},
{
title: "Dreamin' Rider",
romanization: "",
duration: "3:29"
},
{
title: "Yokohama City of Lights",
romanization: "",
duration: "5:08"
},
{
title: "Say Yes!",
romanization: "",
duration: "4:18"
},
{
title: "Ivory Coast",
romanization: "",
duration: "4:25"
},
{
title: "Non Stop the Rain",
romanization: "",
duration: "4:45"
},
{
title: "Last Runner",
romanization: "",
duration: "5:51"
},
{
title: "夜明けのバスターミナル",
romanization: "Yoake no Bus Terminal",
duration: "5:26"
},
{
title: "Sundial",
romanization: "",
duration: "4:49"
},
]
)
CreateAlbumWithTracks({
title: "Band Wagon",
romanization: "",
romaji_artist: "Shigeru Suzuki",
japanese_artist: "鈴木茂",
year: "1974",
description: "Shigeru's first solo album after his time with Tin Pan Alley. Features a primarily American cast.",
flavor: "Rock, Funk"
},
[{
title: "砂の女",
romanization: "Suna no On'na",
duration: "3:55"
},
{
title: "八月の匂い",
romanization: "Hachigatsu no Nioi",
duration: "3:39"
},
{
title: "微熱少年",
romanization: "Binetsu Shōnen",
duration: "3:40"
},
{
title: "スノー・エキスプレス",
romanization: "Snow Express",
duration: "3:51"
},
{
title: "人力飛行機の夜",
romanization: "Jinryokuhikōki no Yoru",
duration: "2:33"
},
{
title: "100ワットの恋人",
romanization: "100-Watto no Koibito",
duration: "4:36"
},
{
title: "ウッド・ペッカー",
romanization: "Wood Pecker",
duration: "3:08"
},
{
title: "夕焼け波止場",
romanization: "Yūyakehatoba",
duration: "4:44"
},
{
title: "銀河ラプソディー",
romanization: "Ginga Rhapsody",
duration: "3:47"
},
]
)
CreateAlbumWithTracks({
title: "Lagoon",
romanization: "",
romaji_artist: "Shigeru Suzuki",
japanese_artist: "鈴木茂",
year: "1976",
description: "",
flavor: "Rock, Funk"
},
[{
title: "Lady Pink Panther",
romanization: "",
duration: "2:56"
},
{
title: "Devil Game",
romanization: "",
duration: "3:21"
},
{
title: "Brandy Wine",
romanization: "",
duration: "3:10"
},
{
title: "Tokyo Harbor Line",
romanization: "",
duration: "4:17"
},
{
title: "Hawaiian",
romanization: "",
duration: "2:32"
},
{
title: "Hashire-Rabbit",
romanization: "",
duration: "3:51"
},
{
title: "Cordoba-Night",
romanization: "",
duration: "3:12"
},
{
title: "Almeria",
romanization: "",
duration: "3:14"
},
{
title: "8-Note Song",
romanization: "",
duration: "4:15"
},
]
)
CreateAlbumWithTracks({
title: "Telescope",
romanization: "",
romaji_artist: "Shigeru Suzuki",
japanese_artist: "鈴木茂",
year: "1978",
description: "",
flavor: "Rock, Funk"
},
[{
title: "Tuesday Queen",
romanization: "",
duration: "4:07"
},
{
title: "イメージ・チェンジ",
romanization: "Image Change",
duration: "3:34"
},
{
title: "ラハイナ・ガール",
romanization: "Lahaina Girl",
duration: "3:57"
},
{
title: "ストリップ・ティーズ",
romanization: "Strip Tease",
duration: "3:43"
},
{
title: "マドモアゼル",
romanization: "Mademoiselle",
duration: "3:37"
},
{
title: "スパニッシュフライ（媚薬）",
romanization: "Spansh Fly (Biyaku)",
duration: "3:14"
},
{
title: "ハヴァナ・シガレット",
romanization: "Havana Cigarette",
duration: "4:22"
},
{
title: "10セントの魂",
romanization: "10-cent no Tamashī",
duration: "5:29"
},
{
title: "スウィート・インスピレイション",
romanization: "Sweet Inspiration",
duration: "2:59"
},
{
title: "テレスコープ",
romanization: "Telescope",
duration: "2:16"
},
]
)
CreateAlbumWithTracks({
title: "Cosmos '51",
romanization: "",
romaji_artist: "Shigeru Suzuki",
japanese_artist: "鈴木茂",
year: "1979",
description: "",
flavor: "Fock, Funk"
},
[{
title: "You Are a Bad Liar",
romanization: "",
duration: "4:28"
},
{
title: "Five Steps",
romanization: "",
duration: "3:48"
},
{
title: "Illusion",
romanization: "",
duration: "3:44"
},
{
title: "Galaxy Girl",
romanization: "",
duration: "4:15"
},
{
title: "Viva California",
romanization: "",
duration: "4:43"
},
{
title: "Hey! Woman",
romanization: "",
duration: "4:37"
},
{
title: "Bad Dream",
romanization: "",
duration: "3:48"
},
{
title: "Santa Monica Rally",
romanization: "",
duration: "4:44"
},
{
title: "Cold Blood",
romanization: "",
duration: "4:50"
},
{
title: "Phoenix",
romanization: "",
duration: "4:14"
},
]
)
CreateAlbumWithTracks({
title: "White Heat",
romanization: "",
romaji_artist: "Shigeru Suzuki",
japanese_artist: "鈴木茂",
year: "1979",
description: "",
flavor: "Rock, Funk"
},
[{
title: "Hot Blooded",
romanization: "",
duration: "4:08"
},
{
title: "Wild Fire",
romanization: "",
duration: "4:15"
},
{
title: "City Streets",
romanization: "",
duration: "4:38"
},
{
title: "Moonstruck",
romanization: "",
duration: "3:11"
},
{
title: "On the Coast",
romanization: "",
duration: "4:22"
},
{
title: "Los Enamorados",
romanization: "",
duration: "4:06"
},
{
title: "Starlite Melody",
romanization: "",
duration: "4:51"
},
{
title: "Da Doo Love for You",
romanization: "",
duration: "3:40"
},
]
)
CreateAlbumWithTracks({
title: "Sei Do Ya",
romanization: "",
romaji_artist: "Shigeru Suzuki",
japanese_artist: "鈴木茂",
year: "1985",
description: "",
flavor: "Rock, Funk"
},
[{
title: "Sei Do Ya (星 導 夜)",
romanization: "",
duration: "4:57"
},
{
title: "Close Up",
romanization: "",
duration: "2:54"
},
{
title: "Machine Gun",
romanization: "",
duration: "3:54"
},
{
title: "Moon Light",
romanization: "",
duration: "5:04"
},
{
title: "小市民の冒険",
romanization: "Koichimin no Bōken",
duration: "3:24"
},
{
title: "Modern Girl",
romanization: "",
duration: "5:16"
},
{
title: "Sei Do Ya (Instrumental)",
romanization: "",
duration: "2:43"
},
{
title: "Nuba",
romanization: "",
duration: "4:42"
},
{
title: "明日に向かって振り返れ",
romanization: "Ashita ni Mukatte Furikaere",
duration: "1:39"
},
])
CreateAlbumWithTracks({
title: "月姫",
romanization: "Tsukihime",
romaji_artist: "Mioko Yamaguchi",
japanese_artist: "山口美央子",
year: "1983",
description: "",
flavor: "Techno, Synth"
},
[{
title: "夕顔～あはれ",
romanization: "Yu-Gao ～aware",
duration: "4:36"
},
{
title: "夏",
romanization: "Natsu",
duration: "4:50"
},
{
title: "沈みゆく",
romanization: "Shizumi Yuku",
duration: "2:42"
},
{
title: "鏡",
romanization: "Kagami",
duration: "5:37"
},
{
title: "白日夢",
romanization: "Hakujitsu Yume",
duration: "6:07"
},
{
title: "月姫 (Moon-Light Princess)",
romanization: "Tsukihime (Moon-Light Princess)",
duration: "3:44"
},
{
title: "さても天晴 夢桜",
romanization: "Sate mo Ten Hare Yume Sakura",
duration: "3:51"
},
{
title: "恋は春感",
romanization: "Koi wa Haru Kan",
duration: "3:39"
},
])
CreateAlbumWithTracks({
title: "浮遊空間",
romanization: "Fuyū kūkan",
romaji_artist: "Tomoko Aran",
japanese_artist: "亜蘭知子",
year: "1983",
description: "",
flavor: "Synth, Funk"
},
[{
title: "Body to Body",
romanization: "",
duration: "4:06"
},
{
title: "Lonely Night",
romanization: "",
duration: "2:25"
},
{
title: "I'm in Love",
romanization: "",
duration: "5:53"
},
{
title: "ジ・レ・ン・マ",
romanization: "Dilemma",
duration: "3:33"
},
{
title: "Midnight Pretenders",
romanization: "",
duration: "5:45"
},
{
title: "ひと夏のタペストリー",
romanization: "Hito Natsu no Tapestry",
duration: "4:29"
},
{
title: "Hannya",
romanization: "",
duration: "5:30"
},
{
title: "しゃくなyesterday",
romanization: "Shaku na Yesterday",
duration: "5:01"
},
{
title: "Baby, Don't You Cry Anymore",
romanization: "",
duration: "5:25"
},
]
)
CreateAlbumWithTracks({
title: "More Relax",
romanization: "",
romaji_artist: "Tomoko Aran",
japanese_artist: "亜蘭知子",
year: "1984",
description: "",
flavor: "Synth, Funk"
},
[{
title: "Drive to Love (愛の海へ)",
romanization: "Drive to Love (Ai no Umi e)",
duration: "3:57"
},
{
title: "Slow Nights",
romanization: "",
duration: "3:43"
},
{
title: "Relax",
romanization: "",
duration: "3:59"
},
{
title: "I Can't Say Good-Bye",
romanization: "",
duration: "4:05"
},
{
title: "E☆spy (エ・ス・パ・イ)",
romanization: "E☆spy (España)",
duration: "3:54"
},
{
title: "Waterless Pool (水のないプール)",
romanization: "Waterless Pool (Sui no Nai Pool)",
duration: "4:21"
},
{
title: "もう一度south Wind",
romanization: "Mo-Ichido South Wind",
duration: "3:28"
},
{
title: "裸足のサロメ",
romanization: "Hadashi no Salome",
duration: "3:43"
},
{
title: "13月の奇跡",
romanization: "13-tsuki no Kiseki",
duration: "3:20"
},
{
title: "Privacy",
romanization: "",
duration: "4:03"
},
]
)
CreateAlbumWithTracks({
title: "思い出は美しすぎて",
romanization: "Omoide wa Utsukushi Sugi Te",
romaji_artist: "Junko Yagami",
japanese_artist: "八神純子",
year: "1978",
description: "",
flavor: "Funk"
},
[{
title: "雨の日のひとりごと",
romanization: "Ame no hi no Hitori Goto",
duration: "3:48"
},
{
title: "時の流れに",
romanization: "Toki no Nagare Ni",
duration: "3:42"
},
{
title: "思い出の部屋より",
romanization: "Omoide no Heya Yori",
duration: "4:22"
},
{
title: "思い出は美しすぎて",
romanization: "Omoide wa Utsukushi Sugi Te",
duration: "3:19"
},
{
title: "追慕",
romanization: "Tsuibo",
duration: "3:18"
},
{
title: "気まぐれでいいの",
romanization: "Kimagure de ii No",
duration: "4:40"
},
{
title: "せいたかあわだち草",
romanization: "Sei ta ka Awadachi Kusa",
duration: "2:52"
},
{
title: "窓辺",
romanization: "Madobe",
duration: "4:44"
},
{
title: "もう忘れましょう",
romanization: "Mo Wasure Masho U",
duration: "4:34"
},
{
title: "さよならの言葉",
romanization: "Sayonara no Kotoba",
duration: "4:18"
},
]
)
CreateAlbumWithTracks({
title: "素顔の私",
romanization: "Sugao no Watashi",
romaji_artist: "Junko Yagami",
japanese_artist: "八神純子",
year: "1979",
description: "",
flavor: "Funk"
},
[{
title: "バースデイ・ソング",
romanization: "Birthday Song",
duration: "3:26"
},
{
title: "明日に向かって行け",
romanization: "Ashita ni te Ike",
duration: "4:50"
},
{
title: "揺れる気持",
romanization: "Yureru Kimochi",
duration: "4:13"
},
{
title: "みずいろの雨",
romanization: "Mi Zui ro no Ame",
duration: "3:28"
},
{
title: "夜間飛行",
romanization: "Yakan Hikō",
duration: "6:23"
},
{
title: "アダムとイブ",
romanization: "Adam and Eve",
duration: "3:24"
},
{
title: "そっと後から",
romanization: "Sotto go Kara",
duration: "4:09"
},
{
title: "ハロー・アンド・グッドバイ",
romanization: "Hello and Goodbye",
duration: "3:22"
},
{
title: "渚",
romanization: "Nagisa",
duration: "3:46"
},
{
title: "Dawn",
romanization: "",
duration: "7:45"
},
]
)
CreateAlbumWithTracks({
title: "Mr.メトロポリス",
romanization: "Mr. Metropolis",
romaji_artist: "Junko Yagami",
japanese_artist: "八神純子",
year: "1980",
description: "",
flavor: "Funk"
},
[{
title: "Mr. メトロポリス",
romanization: "Mr. Metropolis",
duration: "5:56"
},
{
title: "小さな頃",
romanization: "Chi-Sana Koro",
duration: "1:53"
},
{
title: "Deja Vu",
romanization: "",
duration: "4:55"
},
{
title: "ポーラスター",
romanization: "Polar Star",
duration: "4:10"
},
{
title: "グッパイ美しい日々",
romanization: "Goodbye Utsukushii Hibi",
duration: "4:39"
},
{
title: "ワンダフル・シティ",
romanization: "Wonderful City",
duration: "4:09"
},
{
title: "冬",
romanization: "Fuyu",
duration: "3:45"
},
{
title: "サンディエゴ サンセット",
romanization: "San Diego Sunset",
duration: "4:11"
},
{
title: "シルエット",
romanization: "Silhouette",
duration: "5:10"
},
{
title: "Another Day, Another Me",
romanization: "",
duration: "6:06"
},
]
)
CreateAlbumWithTracks({
title: "夢みる頃を過ぎても",
romanization: "Yumemiru Koro wo Sugi te Mo",
romaji_artist: "Junko Yagami",
japanese_artist: "八神純子",
year: "1982",
description: "",
flavor: "Funk"
},
[{
title: "夢みる頃を過ぎても",
romanization: "Yumemiru Koro wo Sugi te Mo",
duration: "4:39"
},
{
title: "シークレット・ラブ",
romanization: "Secret Love",
duration: "4:55"
},
{
title: "白い花束",
romanization: "Shiroi Hanataba",
duration: "4:23"
},
{
title: "金曜日の夜",
romanization: "Kinyo-Bi no Yoru",
duration: "4:01"
},
{
title: "一年前の恋人",
romanization: "Ichi-nen Mae no Koibito",
duration: "4:24"
},
{
title: "ナイス・メモリーズ",
romanization: "Nice Memories",
duration: "5:45"
},
{
title: "B・g・m",
romanization: "",
duration: "2:43"
},
{
title: "I'm a Woman",
romanization: "",
duration: "4:15"
},
{
title: "Fly Away",
romanization: "",
duration: "4:44"
},
{
title: "二人だけ",
romanization: "Futaridake",
duration: "5:03"
},
]
)
CreateAlbumWithTracks({
title: "I Wanna Make a Hit Wit-Choo",
romanization: "",
romaji_artist: "Junko Yagami",
japanese_artist: "八神純子",
year: "1983",
description: "",
flavor: "Funk"
},
[{
title: "I Wanna Make a Hit Wit-Choo",
romanization: "",
duration: "3:54"
},
{
title: "He's My Kind",
romanization: "",
duration: "3:30"
},
{
title: "Manhattan",
romanization: "",
duration: "3:30"
},
{
title: "Hey Kid",
romanization: "",
duration: "3:08"
},
{
title: "Don't Wanna Be Lonely",
romanization: "",
duration: "3:51"
},
{
title: "Broadway Kisses",
romanization: "",
duration: "3:17"
},
{
title: "It's Always Been You",
romanization: "",
duration: "3:40"
},
{
title: "The Heart",
romanization: "",
duration: "3:15"
},
{
title: "We're Gonna Make It After All",
romanization: "",
duration: "3:34"
},
{
title: "You'll Take the Best of Me",
romanization: "",
duration: "3:56"
},
]
)
CreateAlbumWithTracks({
title: "純",
romanization: "Jun",
romaji_artist: "Junko Yagami",
japanese_artist: "八神純子",
year: "1985",
description: "",
flavor: "Funk"
},
[{
title: "ベイビースターの悲劇",
romanization: "Baby Star no Higeki",
duration: "3:30"
},
{
title: "邪魔しないで",
romanization: "Jama Shi Nai De",
duration: "3:28"
},
{
title: "不倫ラブ",
romanization: "Furin Love",
duration: "5:03"
},
{
title: "リーチ・アウト・イン・ザ・ナイト",
romanization: "Reach Out in The Night",
duration: "5:27"
},
{
title: "危険なエモーション",
romanization: "Kiken na Emotion",
duration: "3:59"
},
{
title: "オペレーター",
romanization: "Operator",
duration: "5:25"
},
{
title: "セーラーの旅立ち",
romanization: "Sailor no Tabidachi",
duration: "5:28"
},
{
title: "摩天楼のハリケーン",
romanization: "Matenro- no Hurricane",
duration: "3:41"
},
{
title: "素敵ダウンタウン ジミー",
romanization: "Suteki Downtown Jimmy",
duration: "5:41"
},
]
)
CreateAlbumWithTracks({
title: "ヤガマニア",
romanization: "Yagamania",
romaji_artist: "Junko Yagami",
japanese_artist: "八神純子",
year: "1986",
description: "",
flavor: "Funk"
},
[{
title: "ルーザー",
romanization: "Loser",
duration: "4:20"
},
{
title: "ダイナマイト ラブ",
romanization: "Dynamite Love",
duration: "4:14"
},
{
title: "Fun City",
romanization: "",
duration: "4:33"
},
{
title: "消えたサイゴンの娘",
romanization: "Kie ta Saigon no Musume",
duration: "6:06"
},
{
title: "哀愁パラダイス",
romanization: "Aishu- Paradise",
duration: "3:58"
},
{
title: "ボクサー",
romanization: "Boxer",
duration: "5:04"
},
{
title: "Chameleon",
romanization: "",
duration: "4:10"
},
{
title: "Kiniro No Surprise",
romanization: "",
duration: "4:29"
},
{
title: "Cosmos No Yoru (Seireki 2000 Nen Ni Mukute Party)",
romanization: "",
duration: "5:20"
},
{
title: "Brother & Sister",
romanization: "",
duration: "4:11"
},
]
)
CreateAlbumWithTracks({
title: "Mellow Cafe",
romanization: "",
romaji_artist: "Junko Yagami",
japanese_artist: "八神純子",
year: "1992",
description: "",
flavor: "Funk"
},
[{
title: "Paradise",
romanization: "",
duration: "5:21"
},
{
title: "Mellow Cafe",
romanization: "",
duration: "5:13"
},
{
title: "Sympathy",
romanization: "",
duration: "4:38"
},
{
title: "鳳仙花",
romanization: "Ho-Senka",
duration: "4:58"
},
{
title: "Bluebird",
romanization: "",
duration: "3:39"
},
{
title: "Eurasian",
romanization: "",
duration: "4:57"
},
{
title: "If You Ever",
romanization: "",
duration: "4:47"
},
{
title: "Love Light",
romanization: "",
duration: "4:46"
},
{
title: "さよなら夏の光",
romanization: "Sayonara Natsu no Hikari",
duration: "4:54"
},
{
title: "Love in the Key of 'G'",
romanization: "",
duration: "4:30"
},
]
)
CreateAlbumWithTracks({
title: "Lonely Girl",
romanization: "",
romaji_artist: "Junko Yagami",
japanese_artist: "八神純子",
year: "2003",
description: "",
flavor: "Funk"
},
[{
title: "Lonely Girl",
romanization: "",
duration: "4:40"
},
{
title: "夜空のイヤリング",
romanization: "Yozora no Earrings",
duration: "4:02"
},
{
title: "鼓動のララバイ",
romanization: "Kodō no Lullaby",
duration: "4:24"
},
{
title: "Touch You, Tonight",
romanization: "",
duration: "4:12"
},
{
title: "燃えつきるまで",
romanization: "Moetsukiru Made",
duration: "4:58"
},
{
title: "And I Love You",
romanization: "",
duration: "3:44"
},
{
title: "ジェラス",
romanization: "Jealousy",
duration: "3:59"
},
{
title: "ラブ・シュプリーム~至上の愛~",
romanization: "Love Supreme ~Shijo- no Ai~",
duration: "4:13"
},
{
title: "You & I",
romanization: "",
duration: "3:25"
},
{
title: "Falling for You",
romanization: "",
duration: "4:20"
},
{
title: "その胸にもう一度",
romanization: "Sono Mune ni Mo-Ichido",
duration: "4:53"
},
]
)
CreateAlbumWithTracks({
title: "ほうろう",
romanization: "Houro",
romaji_artist: "Chu Kosaka",
japanese_artist: "小坂忠",
year: "1975",
description: "",
flavor: "Soul, Funk"
},
[{
title: "ほうろう",
romanization: "Houro",
duration: "2:53"
},
{
title: "機関車",
romanization: "Kikan Sha",
duration: "3:48"
},
{
title: "ボン・ボヤージ波止場",
romanization: "Bon Boyage Hatoba",
duration: "4:33"
},
{
title: "氷雨月のスケッチ",
romanization: "Hisame Tsuki no Sketch",
duration: "4:03"
},
{
title: "ゆうがたラブ",
romanization: "Yuu Gata Rabu",
duration: "4:21"
},
{
title: "しらけちまうぜ",
romanization: "Shirake Chimau Ze",
duration: "3:08"
},
{
title: "流星都市",
romanization: "Ryu-Sei Toshi",
duration: "3:56"
},
{
title: "つるべ糸",
romanization: "Tsuru be Ito",
duration: "3:12"
},
{
title: "ふうらい坊",
romanization: "Fu- Rai Bo-",
duration: "4:36"
},
]
)
CreateAlbumWithTracks({
title: "Orange Sky - Endless Summer",
romanization: "",
romaji_artist: "Izumi Kobayashi",
japanese_artist: "小林泉美",
year: "1978",
description: "",
flavor: "Fusion, Latin"
},
[{
title: "サンタモニカの夜明け",
romanization: "Santa Monica no Yoake",
duration: "1:24"
},
{
title: "夕ぐれ時の恋人たち",
romanization: "Yu-Gure ji no Koibito Tachi",
duration: "5:42"
},
{
title: "オレンジ・ビーチ",
romanization: "Orange Beach",
duration: "5:48"
},
{
title: "マイ・ビーチ・サンバ",
romanization: "My Beach Samba",
duration: "4:25"
},
{
title: "海を見にいく",
romanization: "Umi wo mi ni Iku",
duration: "6:32"
},
{
title: "コーヒー",
romanization: "Coffee",
duration: "4:02"
},
{
title: "フルーツ・パフェ One Note Samba",
romanization: "Fruit Parfait One Note Samba",
duration: "3:56"
},
{
title: "そよそよ",
romanization: "Soyosoyo",
duration: "3:55"
},
{
title: "ハロー・ハロー・ハロー",
romanization: "Hello Hello Hello",
duration: "5:38"
},
{
title: "サンタモニカの夜明け",
romanization: "Santa Monika no Yoake",
duration: "3:15"
},
]
)
CreateAlbumWithTracks({
title: "Sea Flight",
romanization: "",
romaji_artist: "Izumi Kobayashi",
japanese_artist: "小林泉美",
year: "1978",
description: "",
flavor: "Fusion, Latin"
},
[{
title: "Concrete Wave",
romanization: "",
duration: "2:37"
},
{
title: "Angel Sky",
romanization: "",
duration: "4:56"
},
{
title: "Naze",
romanization: "",
duration: "5:12"
},
{
title: "Summer Wine",
romanization: "",
duration: "4:15"
},
{
title: "Whisper of Shell",
romanization: "",
duration: "4:59"
},
{
title: "Sea Flight",
romanization: "",
duration: "4:51"
},
{
title: "Carnival",
romanization: "",
duration: "5:34"
},
{
title: "It's Raining",
romanization: "",
duration: "5:25"
},
]
)
CreateAlbumWithTracks({
title: "落葉のメロディー",
romanization: "Rakuyō no Melody",
romaji_artist: "Asami Kobayashi",
japanese_artist: "小林麻美",
year: "1973",
description: "",
flavor: "Idol"
},
[{
title: "落葉のメロディー",
romanization: "Rakuyō no Melody",
duration: "3:19"
},
{
title: "恋のレッスン",
romanization: "Koi no Lesson",
duration: "2:55"
},
{
title: "恋はそよ風",
romanization: "Koi wa Soyokaze",
duration: "2:19"
},
{
title: "あふれる愛に",
romanization: "Afureru ai Ni",
duration: "3:14"
},
{
title: "チョット・マッテ・クダサイ",
romanization: "Chotto Matte Kudasai",
duration: "2:59"
},
{
title: "女の子は淋しくても",
romanization: "Onnanoko wa Sabishiku te Mo",
duration: "2:25"
},
{
title: "初恋のメロディー",
romanization: "Hatsukoi no Melody",
duration: "3:29"
},
{
title: "夢見るシャンソン人形",
romanization: "Yumemiru Shanson Ningyo-",
duration: "2:41"
},
{
title: "可愛いベイビー",
romanization: "Kawaii Baby",
duration: "2:35"
},
{
title: "砂に消えた恋",
romanization: "Suna ni Kie ta Koi",
duration: "2:14"
},
{
title: "さよならのブルース",
romanization: "Sayonara no Blues",
duration: "3:05"
},
{
title: "海辺の白い家",
romanization: "Umibe no Shiroi Ie",
duration: "2:49"
},
]
)
CreateAlbumWithTracks({
title: "20才の愛",
romanization: "20sai no Ai",
romaji_artist: "Asami Kobayashi",
japanese_artist: "小林麻美",
year: "1974",
description: "",
flavor: "Idol"
},
[{
title: "ある事情",
romanization: "Aru Jijo-",
duration: "3:12"
},
{
title: "ぶどう色の経験",
romanization: "Budo-Iro no Keiken",
duration: "3:46"
},
{
title: "あなたは恋の旅人",
romanization: "Anata wa Koi no Tabibito",
duration: "3:19"
},
{
title: "夢でいいから",
romanization: "Yume de ii Kara",
duration: "3:13"
},
{
title: "イヴの横顔",
romanization: "Eve no Yokogao",
duration: "4:07"
},
{
title: "あなたのネクタイ",
romanization: "Anata no Nekutai",
duration: "2:54"
},
{
title: "メドレー",
romanization: "Medley",
duration: "5:45"
},
{
title: "あなたのことでいっぱい",
romanization: "Anata no Koto de Ippai",
duration: "2:52"
},
{
title: "雨だれ",
romanization: "Amadare",
duration: "3:10"
},
{
title: "小さな旅",
romanization: "Chi-Sana Tabi",
duration: "3:42"
},
{
title: "青春が終る日",
romanization: "Seishun ga Owaru Hi",
duration: "3:16"
},
]
)
CreateAlbumWithTracks({
title: "Cryptgraph～愛の暗号～",
romanization: "Cryptgraph ～Ai no Ango- ～",
romaji_artist: "Asami Kobayashi",
japanese_artist: "小林麻美",
year: "1984",
description: "",
flavor: "Techno"
},
[{
title: "月影のパラノイア",
romanization: "Tsukikage no Paranoia",
duration: "4:16"
},
{
title: "微熱",
romanization: "Binetsu",
duration: "4:40"
},
{
title: "Typhoon",
romanization: "",
duration: "4:17"
},
{
title: "グランプリの夏",
romanization: "Grand Prix no Natsu",
duration: "4:22"
},
{
title: "Transit",
romanization: "",
duration: "3:30"
},
{
title: "Sugar Shuffle",
romanization: "",
duration: "4:08"
},
{
title: "恋なんてかんたん",
romanization: "Koi Nante Kantan",
duration: "3:57"
},
{
title: "アネモネ",
romanization: "Anemone",
duration: "3:55"
},
{
title: "雨音はショパンの調べ",
romanization: "Ame on wa Shopan no Shirabe",
duration: "4:30"
},
{
title: "Lolita Go Home",
romanization: "",
duration: "3:46"
},
]
)
CreateAlbumWithTracks({
title: "Grey",
romanization: "",
romaji_artist: "Asami Kobayashi",
japanese_artist: "小林麻美",
year: "1987",
description: "",
flavor: "Techno"
},
[{
title: "Erotique",
romanization: "",
duration: "4:14"
},
{
title: "愛のプロフェッサー",
romanization: "Ai no Professor",
duration: "3:54"
},
{
title: "移りゆく心",
romanization: "Utsuri Yuku Kokoro",
duration: "4:00"
},
{
title: "夜の響きを聞いている",
romanization: "Yoru no Hibiki wo Kii te Iru",
duration: "4:41"
},
{
title: "昼の三日月",
romanization: "Hiru no Mikazuki",
duration: "5:44"
},
{
title: "I Miss You",
romanization: "",
duration: "5:19"
},
{
title: "飯倉グラフィティー",
romanization: "I-Kura Graffiti",
duration: "3:59"
},
{
title: "ルームサービス",
romanization: "Room Service",
duration: "4:40"
},
{
title: "遠くからHappy Birthday",
romanization: "To-Ku Kara Happy Birthday",
duration: "4:57"
},
{
title: "Grey",
romanization: "",
duration: "3:43"
},
])
CreateAlbumWithTracks({
title: "Aqua City",
romanization: "",
romaji_artist: "Sugiyama Kiyotaka & The Omega Tribe",
japanese_artist: "杉山清貴&オメガトライブ",
year: "1984",
description: "",
flavor: "Disco, Boogie"
},
[{
title: "Summer Suspicion",
romanization: "",
duration: "4:34"
},
{
title: "Paddling to You",
romanization: "",
duration: "3:19"
},
{
title: "Mindnight Down Town",
romanization: "",
duration: "5:05"
},
{
title: "Light Morning",
romanization: "",
duration: "4:24"
},
{
title: "Umikaze Tsushin",
romanization: "",
duration: "4:36"
},
{
title: "Transit in Summer",
romanization: "",
duration: "4:19"
},
{
title: "Trade Wind",
romanization: "",
duration: "5:47"
},
{
title: "Sexy Halation",
romanization: "",
duration: "4:33"
},
{
title: "Alone Again",
romanization: "",
duration: "5:06"
},
]
)
CreateAlbumWithTracks({
title: "Just Call Me Penny",
romanization: "",
romaji_artist: "Hitomi Tohyama",
japanese_artist: "当山ひとみ",
year: "1981",
description: "",
flavor: "Synth"
},
[{
title: "ドア越しのgood Song (So Many Times)",
romanization: "Doa Goshi no Good Song (So Many Times)",
duration: "4:20"
},
{
title: "My Guy (Cafe Sign)",
romanization: "",
duration: "4:23"
},
{
title: "Image Change",
romanization: "",
duration: "4:10"
},
{
title: "Rainy Driver",
romanization: "",
duration: "4:32"
},
{
title: "Station",
romanization: "",
duration: "3:31"
},
{
title: "Baby, Baby, Baby",
romanization: "",
duration: "4:15"
},
{
title: "Midnight Express",
romanization: "",
duration: "4:05"
},
{
title: "Sfo-Oakland (サンフランシスコからオークランドへ)",
romanization: "Sfo-Oakland (San Francisco Kara Auckland e)",
duration: "3:37"
},
{
title: "Instant Polaroid",
romanization: "",
duration: "4:09"
},
]
)
CreateAlbumWithTracks({
title: "Heart Full of L.A. Mind",
romanization: "",
romaji_artist: "Hitomi Tohyama",
japanese_artist: "当山ひとみ",
year: "1982",
description: "",
flavor: "Synth, Funk"
},
[{
title: "Another Day, Another Love",
romanization: "",
duration: "4:22"
},
{
title: "Office Date",
romanization: "",
duration: "4:14"
},
{
title: "今のままでいて",
romanization: "Ima no Mama de i Te",
duration: "4:19"
},
{
title: "サボテンの花",
romanization: "Saboten no Hana",
duration: "4:42"
},
{
title: "Air Mail",
romanization: "",
duration: "4:17"
},
{
title: "シンフォニー",
romanization: "Symphony",
duration: "4:07"
},
{
title: "Don't Stop the Music",
romanization: "",
duration: "3:43"
},
{
title: "Isn't It Magic",
romanization: "",
duration: "4:12"
},
{
title: "Call Me",
romanization: "",
duration: "3:46"
},
]
)
CreateAlbumWithTracks({
title: "Next Door",
romanization: "",
romaji_artist: "Hitomi Tohyama",
japanese_artist: "当山ひとみ",
year: "1983",
description: "",
flavor: "Synth"
},
[{
title: "エキゾチック横顔",
romanization: "Ekizochikku Yokogao",
duration: "4:34"
},
{
title: "サングラスを外して",
romanization: "Sunglasses wo Hazushi Te",
duration: "3:51"
},
{
title: "Teardrops Romance",
romanization: "",
duration: "3:56"
},
{
title: "グッバイ～シャープに抱いて",
romanization: "Goodbye ～Sharp ni Dai Te",
duration: "4:09"
},
{
title: "Kiss the Yesterday",
romanization: "",
duration: "3:57"
},
{
title: "Love Is the Competition",
romanization: "",
duration: "3:51"
},
{
title: "High-Heel Dancer",
romanization: "",
duration: "3:42"
},
{
title: "Mystery Driver",
romanization: "",
duration: "4:27"
},
{
title: "愛を奪って",
romanization: "Ai wo Te",
duration: "4:10"
},
{
title: "Our Lovely Days",
romanization: "",
duration: "4:25"
},
]
)
CreateAlbumWithTracks({
title: "Sexy Robot",
romanization: "",
romaji_artist: "Hitomi Tohyama",
japanese_artist: "当山ひとみ",
year: "1983",
description: "",
flavor: "Synth"
},
[{
title: "Sexy Robot",
romanization: "",
duration: "4:02"
},
{
title: "Wanna Kiss",
romanization: "",
duration: "4:33"
},
{
title: "Tuxedo Connection",
romanization: "",
duration: "3:23"
},
{
title: "Let's Talk in Bed",
romanization: "",
duration: "3:50"
},
{
title: "We Are in the Dark",
romanization: "",
duration: "3:50"
},
{
title: "Behind You",
romanization: "",
duration: "3:29"
},
{
title: "Try to Say",
romanization: "",
duration: "3:51"
},
{
title: "Cathy",
romanization: "",
duration: "5:44"
},
{
title: "Slow Love",
romanization: "",
duration: "4:40"
},
{
title: "Be Mine",
romanization: "",
duration: "4:31"
},
]
)
CreateAlbumWithTracks({
title: "Hello Me",
romanization: "",
romaji_artist: "Hitomi Tohyama",
japanese_artist: "当山ひとみ",
year: "1986",
description: "",
flavor: "Synth"
},
[{
title: "Anytime Anyplace",
romanization: "",
duration: "5:13"
},
{
title: "Brand-New Day",
romanization: "",
duration: "4:58"
},
{
title: "木もれ陽の降る季節",
romanization: "Ki More hi no Furu Kisetsu",
duration: "5:03"
},
{
title: "銀河の片隅で",
romanization: "Ginga no Katasumi De",
duration: "5:10"
},
{
title: "まつ毛の先のBoyish",
romanization: "Matsuge no Saki no Boyish",
duration: "3:30"
},
{
title: "Maybe Someday (行き先は教えない)",
romanization: "Maybe Someday (Yukisaki wa Oshie Nai)",
duration: "4:47"
},
{
title: "Shine on Lady",
romanization: "",
duration: "4:32"
},
{
title: "星空のscreen",
romanization: "Hoshizora no Screen",
duration: "5:09"
},
{
title: "Hello Me",
romanization: "",
duration: "3:47"
},
]
)
CreateAlbumWithTracks({
title: "Style",
romanization: "",
romaji_artist: "Keiko Kimura",
japanese_artist: "木村恵子",
year: "1988",
description: "",
flavor: "Synth"
},
[{
title: "Good Morning",
romanization: "",
duration: "4:52"
},
{
title: "泉に誘って",
romanization: "Izumi ni Te",
duration: "4:30"
},
{
title: "電話しないで",
romanization: "電話shi Nai De",
duration: "5:12"
},
{
title: "シンジラレネーション",
romanization: "Shinjiranation",
duration: "3:34"
},
{
title: "水の都",
romanization: "Mizu no To",
duration: "4:42"
},
{
title: "コルトレーンで愛して",
romanization: "Coltrane de Aishi Te",
duration: "5:34"
},
{
title: "Do You Remember Me",
romanization: "",
duration: "3:57"
},
{
title: "黒いマニキュア",
romanization: "Kuroi Manicure",
duration: "6:00"
},
{
title: "Good-Bye Eggman",
romanization: "",
duration: "4:53"
},
{
title: "シャレード'88",
romanization: "Charade'88",
duration: "3:26"
},
]
)
CreateAlbumWithTracks({
title: "Ambiva",
romanization: "",
romaji_artist: "Keiko Kimura",
japanese_artist: "木村恵子",
year: "1989",
description: "",
flavor: "Synth"
},
[{
title: "夏のアンテナ",
romanization: "Natsu no Antenna",
duration: "4:34"
},
{
title: "Bye Bye Visconti",
romanization: "",
duration: "4:07"
},
{
title: "N.Y.からモーニングコール",
romanization: "N.Y. Kara Morning Call",
duration: "3:20"
},
{
title: "モノクロームの太陽",
romanization: "Monochrome no Taiyo-",
duration: "5:30"
},
{
title: "甘い復讐",
romanization: "Amai Fukushu",
duration: "4:39"
},
{
title: "体重計とアンブレラ(Long Version)",
romanization: "Taiju-Kei to Umbrella (Long Version)",
duration: "4:50"
},
{
title: "水曜日の贅沢",
romanization: "Suiyo-Bi no Zeitaku",
duration: "5:48"
},
{
title: "バナナフィッシュにうってつけの日",
romanization: "Banana Fish ni Uttetsuke no Hi",
duration: "4:05"
},
{
title: "サイドシートの彼",
romanization: "Side Seat no Kare",
duration: "4:03"
},
{
title: "ある微笑",
romanization: "Aru Bishō",
duration: "3:49"
},
]
)
CreateAlbumWithTracks({
title: "Green Water",
romanization: "",
romaji_artist: "Kunio Muramatsu",
japanese_artist: "村松邦男",
year: "1983",
description: "",
flavor: "Synth, Boogie"
},
[{
title: "The Party",
romanization: "",
duration: "4:55"
},
{
title: "僕のガールズ",
romanization: "Boku no Girls",
duration: "4:26"
},
{
title: "フェアリー",
romanization: "Fairy-",
duration: "4:59"
},
{
title: "ジェラシー",
romanization: "Jealousy",
duration: "4:50"
},
{
title: "天国色の夢 (Heaven Color's Dream)",
romanization: "Tengoku Shoku no Yume (Heaven Color's Dream)",
duration: "3:46"
},
{
title: "アフターケア",
romanization: "Aftercare",
duration: "4:51"
},
{
title: "うたたね",
romanization: "Utata Ne",
duration: "4:15"
},
{
title: "Katharina",
romanization: "",
duration: "4:29"
},
{
title: "Midnight Desire",
romanization: "",
duration: "4:06"
},
]
)
CreateAlbumWithTracks({
title: "美代子・リバージュ",
romanization: "Miyoko Rivage",
romaji_artist: "Miyoko Nagao",
japanese_artist: "永尾美代子",
year: "1981",
description: "",
flavor: "Ballad"
},
[{
title: "涙を珊瑚色",
romanization: "Namida wo Sango Shoku",
duration: "4:45"
},
{
title: "芦屋セーリング・スポット",
romanization: "Ashiya Sailing Spot",
duration: "3:51"
},
{
title: "もう海には帰らない",
romanization: "Mo- Umi ni wa Kaera Nai",
duration: "4:31"
},
{
title: "雨のボートハウス",
romanization: "Ame no Boat House",
duration: "3:39"
},
{
title: "Sea Wind",
romanization: "",
duration: "4:56"
},
{
title: "さよならトリコロール",
romanization: "Sayonara Tricolore",
duration: "4:12"
},
{
title: "恋舟",
romanization: "Koi Fune",
duration: "5:21"
},
{
title: "Friday Night",
romanization: "",
duration: "4:07"
},
{
title: "さ・よ・な・ら",
romanization: "Sa yo na ra",
duration: "3:52"
},
{
title: "Night View Hill",
romanization: "",
duration: "4:56"
},
{
title: "ブルーのタオル",
romanization: "Blue no Towel",
duration: "3:53"
},
{
title: "ボンジュール恋",
romanization: "Bonjour Koi",
duration: "3:40"
},
{
title: "渚にて",
romanization: "Nagisa Nite",
duration: "3:43"
},
]
)
CreateAlbumWithTracks({
title: "Dream in the Street",
romanization: "",
romaji_artist: "Noriyo Ikeda",
japanese_artist: "池田典代",
year: "1980",
description: "",
flavor: "Latin, Soul"
},
[{
title: "アディオス",
romanization: "Adios",
duration: "4:02"
},
{
title: "Dream in the Street",
romanization: "",
duration: "4:58"
},
{
title: "サマーオレンジの恋",
romanization: "Summer Orange no Koi",
duration: "4:23"
},
{
title: "冷たい雨",
romanization: "Tsumetai Ame",
duration: "2:58"
},
{
title: "Love Is Like a Party",
romanization: "",
duration: "4:29"
},
{
title: "My Prayer",
romanization: "",
duration: "3:36"
},
{
title: "愛のかけら",
romanization: "Ai no Kake Ra",
duration: "4:51"
},
{
title: "恋のジャイロ",
romanization: "Koi no Gyro",
duration: "3:29"
},
{
title: "Sunday Morning",
romanization: "",
duration: "3:12"
},
{
title: "たたずんだ街角",
romanization: "Tatazun da Machikado",
duration: "4:12"
},
]
)
CreateAlbumWithTracks({
title: "ティーンズ・ロマンス",
romanization: "Teen's Romance",
romaji_artist: "Yoko Oginome",
japanese_artist: "荻野目洋子",
year: "1984",
description: "",
flavor: "Synth"
},
[{
title: "未来航海 - Sailing",
romanization: "Mirai Kōkai - Sailing",
duration: "3:15"
},
{
title: "サファイア色のプレリュード",
romanization: "Sapphire Shoku no Prelude",
duration: "2:44"
},
{
title: "夏の微笑",
romanization: "Natsu no Bishō",
duration: "5:01"
},
{
title: "十月物語",
romanization: "Ju-Gatsu Monogatari",
duration: "3:49"
},
{
title: "悲しみプレゼント",
romanization: "Kanashimi Present",
duration: "3:53"
},
{
title: "さよならから始まる物語",
romanization: "Sayonara Kara Hajimaru Monogatari",
duration: "3:18"
},
{
title: "星空夜曲（プラネット・ノクターン）",
romanization: "Hoshizora Yakyoku (Planet Nocturne)",
duration: "4:18"
},
{
title: "流星少女",
romanization: "Ryu-Sei Sho-Jo",
duration: "4:06"
},
{
title: "虹色シンドローム",
romanization: "Niji Shoku Syndrome",
duration: "3:46"
},
{
title: "ティーンズ・ロマンス",
romanization: "Teen's Romance",
duration: "3:43"
}
]
)
CreateAlbumWithTracks({
title: "Freesia No Ame",
romanization: "",
romaji_artist: "Yoko Oginome",
japanese_artist: "荻野目洋子",
year: "1985",
description: "",
flavor: "Synth"
},
[{
title: "Irie Ni Kaeru Yotto No You Ni",
romanization: "",
duration: "4:58"
},
{
title: "Freesia No Ame",
romanization: "",
duration: "3:39"
},
{
title: "Mukouseki Romance",
romanization: "",
duration: "3:20"
},
{
title: "Omoide No Juke Box",
romanization: "",
duration: "4:21"
},
{
title: "My Catherine",
romanization: "",
duration: "3:46"
},
{
title: "B-No Uwasa",
romanization: "",
duration: "3:43"
},
{
title: "Kare to Kanojo to Hikoukigumo",
romanization: "",
duration: "3:53"
},
{
title: "Poinsettia No Omoi",
romanization: "",
duration: "3:50"
},
{
title: "Ame to Jasmine",
romanization: "",
duration: "3:41"
},
{
title: "Ame No Memory",
romanization: "",
duration: "5:16"
},
{
title: "December Memory",
romanization: "",
duration: "4:19"
},
{
title: "Tasogare Angel",
romanization: "",
duration: "3:59"
},
]
)
CreateAlbumWithTracks({
title: "Kaigara Terrace",
romanization: "",
romaji_artist: "Yoko Oginome",
japanese_artist: "荻野目洋子",
year: "1985",
description: "",
flavor: "Synth"
},
[{
title: "Koishite Caribbean",
romanization: "",
duration: "3:51"
},
{
title: "Cecile Wa Toshigoro",
romanization: "",
duration: "3:14"
},
{
title: "Aishuu Caravan",
romanization: "",
duration: "3:41"
},
{
title: "Yuuhi No Gondola",
romanization: "",
duration: "4:18"
},
{
title: "2b No Enpitsu",
romanization: "",
duration: "4:08"
},
{
title: "Kokoro No Mama Ni ~I'm Just a Lady~",
romanization: "",
duration: "4:20"
},
{
title: "9-Gatsu No Tokai",
romanization: "",
duration: "4:22"
},
{
title: "Kaigara Terrace",
romanization: "",
duration: "3:37"
},
{
title: "Heart No Present",
romanization: "",
duration: "4:46"
},
{
title: "Joanna",
romanization: "",
duration: "3:42"
},
{
title: "Ai No Time Capsule",
romanization: "",
duration: "2:56"
},
{
title: "Sweet Vacation",
romanization: "",
duration: "3:19"
},
]
)
CreateAlbumWithTracks({
title: "Heartbeat Express",
romanization: "",
romaji_artist: "Yoko Oginome",
japanese_artist: "荻野目洋子",
year: "1986",
description: "",
flavor: "Synth"
},
[{
title: "Dance Beat Wa Yoake Made",
romanization: "",
duration: "3:41"
},
{
title: "Pandora No Namida",
romanization: "",
duration: "4:03"
},
{
title: "Rain -Natsu Wo Tsuresaru Ame-",
romanization: "",
duration: "3:53"
},
{
title: "Velvet No Itazura",
romanization: "",
duration: "4:12"
},
{
title: "Hito Natsu Dake No Tenshi",
romanization: "",
duration: "4:56"
},
{
title: "After My Heart Beats",
romanization: "",
duration: "4:51"
},
{
title: "Romantic Odyssey",
romanization: "",
duration: "4:12"
},
{
title: "Dance Beat Wa Yoake Made 'In Sevilla'",
romanization: "",
duration: "4:01"
},
{
title: "I Love You Wo Ienai Mama Ni",
romanization: "",
duration: "5:11"
},
{
title: "Skyway Wo Mitsumete",
romanization: "",
duration: "5:23"
},
{
title: "Yogoreta Kutsu No Initial",
romanization: "",
duration: "4:21"
},
{
title: "Omoide Ni Wa Hayasugiru",
romanization: "",
duration: "3:46"
},
{
title: "Main Theme",
romanization: "",
duration: "3:51"
},
{
title: "Rock My Love",
romanization: "",
duration: "4:33"
},
{
title: "More More Shiawase",
romanization: "",
duration: "4:57"
},
]
)
CreateAlbumWithTracks({
title: "Non-Stopper",
romanization: "",
romaji_artist: "Yoko Oginome",
japanese_artist: "荻野目洋子",
year: "1986",
description: "",
flavor: "Synth, Compilation"
},
[{
title: "Dancing Hero (Eat You Up) ''modern Version''",
romanization: "",
duration: "4:04"
},
{
title: "Dance Beat Wa Yoake Made",
romanization: "",
duration: "3:38"
},
{
title: "Flamingo in Paradise ''dance-Mix''",
romanization: "",
duration: "3:58"
},
{
title: "Venus",
romanization: "",
duration: "3:38"
},
{
title: "Melting Point",
romanization: "",
duration: "3:51"
},
{
title: "Roppongi Junjoha",
romanization: "",
duration: "3:28"
},
{
title: "D2d",
romanization: "",
duration: "4:18"
},
{
title: "Non-Stop Dancer",
romanization: "",
duration: "4:29"
},
{
title: "Cha-Cha-Cha",
romanization: "",
duration: "3:36"
},
{
title: "Hitomi Ni I Love You",
romanization: "",
duration: "3:55"
}
]
)
CreateAlbumWithTracks({
title: "Raspberry No Kaze",
romanization: "",
romaji_artist: "Yoko Oginome",
japanese_artist: "荻野目洋子",
year: "1986",
description: "",
flavor: "Synth"
},
[{
title: " Namida Wa Speed Yurasukara",
romanization: "",
duration: "4:01"
},
{
title: "Flamingo in Paradise",
romanization: "",
duration: "3:56"
},
{
title: "1.2.3, Let Me Dance",
romanization: "",
duration: "3:43"
},
{
title: "Tasogare No Neighborhood",
romanization: "",
duration: "3:21"
},
{
title: "Slope Ni Tenki Ame",
romanization: "",
duration: "4:22"
},
{
title: "Lazy Dance",
romanization: "",
duration: "4:32"
},
{
title: "Beach Boys Wo Tomenaide",
romanization: "",
duration: "3:50"
},
{
title: "Namida Shika Mienai",
romanization: "",
duration: "4:21"
},
{
title: "Mayonaka No Stranger",
romanization: "",
duration: "3:51"
},
{
title: "Natsu No Stage Light",
romanization: "",
duration: "4:47"
},
{
title: "Dancing Hero (Eat You Up)",
romanization: "",
duration: "3:49"
},
{
title: "Zenmaiji Kake No Suiyoubi",
romanization: "",
duration: "4:10"
},
{
title: "Flamingo in Paradise",
romanization: "",
duration: "3:55"
}
]
)
CreateAlbumWithTracks({
title: "246 Connection",
romanization: "",
romaji_artist: "Yoko Oginome",
japanese_artist: "荻野目洋子",
year: "1987",
description: "",
flavor: "Synth"
},
[{
title: "246 Planet Girls",
romanization: "",
duration: "4:39"
},
{
title: "Kita Aoyama 3 Choume 4 Banchi",
romanization: "",
duration: "4:19"
},
{
title: "Zoku Roppongi Junjoha",
romanization: "",
duration: "3:54"
},
{
title: "Killer Doori Wa Mai-Nichi Ga Party",
romanization: "",
duration: "4:40"
},
{
title: "Babylon a Go Go",
romanization: "",
duration: "3:34"
},
{
title: "Kanashiki Hair Pin Circus",
romanization: "",
duration: "4:00"
},
{
title: "Karuizawa Connection",
romanization: "",
duration: "3:46"
},
{
title: "Shonen Saigo No Natsu",
romanization: "",
duration: "4:10"
},
{
title: "Hishochi No Natsu",
romanization: "",
duration: "4:24"
},
{
title: "Wangan Taiyou Zoku",
romanization: "",
duration: "3:41"
},
{
title: "Koyuki No Resort",
romanization: "",
duration: "4:23"
},
{
title: "Sayonara No Kajitsu-Tachi",
romanization: "",
duration: "3:46"
},
{
title: "Loft Side Graffiti",
romanization: "",
duration: "4:10"
},
{
title: "Kitakaze No Carol",
romanization: "",
duration: "3:57"
},
{
title: "Getsuyoubi No Marina",
romanization: "",
duration: "4:20"
},
{
title: "Kitakaze No Carol -On Christmas Day-",
romanization: "",
duration: "3:32"
},
]
)
CreateAlbumWithTracks({
title: "CD-Rider",
romanization: "",
romaji_artist: "Yoko Oginome",
japanese_artist: "荻野目洋子",
year: "1988",
description: "",
flavor: "Synth"
},
[{
title: "Dear 〜コバルトの彼方へ〜",
romanization: "Dear ~Cobalt no Kanata e~",
duration: "4:54"
},
{
title: "パームトゥリー・キャンドル",
romanization: "Palm Tree Candle",
duration: "3:41"
},
{
title: "Superstition",
romanization: "",
duration: "3:47"
},
{
title: "ペルシャン・ローズ",
romanization: "Persian Rose",
duration: "3:57"
},
{
title: "朝の街",
romanization: "Asa no Machi",
duration: "3:53"
},
{
title: "Eye Spy the Night",
romanization: "",
duration: "4:00"
},
{
title: "アフター5はパラダイス",
romanization: "After 5 wa Paradaise",
duration: "4:37"
},
{
title: "素敵にFade Away",
romanization: "Suteki ni Fade Away",
duration: "3:52"
},
{
title: "銀色のペーパームーン",
romanization: "Giniro no Paper Moon",
duration: "4:31"
},
]
)
CreateAlbumWithTracks({
title: "ヴァージ・オブ・ラヴ",
romanization: "Verge of Love",
romaji_artist: "Yoko Oginome",
japanese_artist: "荻野目洋子",
year: "1989",
description: "",
flavor: "Synth"
},
[{
title: "ジス・クッド・ビー・ザ・ナイト",
romanization: "This Could Be The Night",
duration: "4:07"
},
{
title: "サムシング・アバウト・ユー",
romanization: "Something About You",
duration: "4:37"
},
{
title: "パッセージ・オブ・タイム",
romanization: "Passage of Time",
duration: "4:52"
},
{
title: "ウィッケッド",
romanization: "Wicked",
duration: "5:08"
},
{
title: "ヴァージ・オブ・ラヴ",
romanization: "Verge of Love",
duration: "6:55"
},
{
title: "ポストカード・フロム・パリ",
romanization: "Postcard from Paris",
duration: "5:51"
},
{
title: "スゥーピン・イン",
romanization: "Suu Ping Inn",
duration: "5:20"
},
{
title: "イズ・イット・トゥルー",
romanization: "Is It True",
duration: "5:15"
},
{
title: "ディジー、ディジー、ディジー",
romanization: "Dizzy, Dizzy, Dizzy",
duration: "4:39"
},
{
title: "ユー・テイク・イット・オール・アウェイ",
romanization: "You Take It All Away",
duration: "5:05"
},
])

