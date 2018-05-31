def CreateAlbumWithTracks(albumParam, tracks = [])
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
coverlink: "bigwave.jpg",
flavor: "Dreamy/Ballad"
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
coverlink: "greyskies.jpg",
flavor: "Soul/Jazz"
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
description: "",
coverlink: "sunshower.jpg",
flavor: "Jazz"
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
coverlink: "romantique.jpg",
flavor: "Electronic/Euro"
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
coverlink: "mignonne.jpg",
flavor: "Funk/Ballad"
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
coverlink: "cliche.jpg",
flavor: "Electronic/Euro"
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
coverlink: "aventure.jpg",
flavor: "Electronic/Euro"
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
coverlink: "大貫妙子トリビュート・アルバム.jpg",
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
coverlink: "pacific.jpg",
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
title: "ノスタルジア・オブ・アイランド～パート1:バード・ウィンド/パート2:ウォーキング・オン・ザ・ビーチ",
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
coverlink: "niagaratrianglevol1.jpg",
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
coverlink: "niagaratrianglevol2.jpg",
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
coverlink: "love.jpg",
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
coverlink: "songs.jpg",
flavor: "Jazz/Rock"
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
coverlink: "supermarket.jpg",
flavor: "Folk/Rock"
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
coverlink: "time.jpg",
flavor: "Funk/Jazz"
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
coverlink: "orient.jpg",
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
coverlink: "awakening.jpg",
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
coverlink: "thisboy.jpg",
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
coverlink: "扉の冬.jpg",
flavor: "Soul/Ballad"
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
coverlink: "flapper.jpg",
flavor: "Funk/Soul"
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
coverlink: "minako.jpg",
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
coverlink: "minakoii.jpg",
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
title: "Precious Lord, Take My Hand/Yo",
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
coverlink: "twilightzone.jpg",
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
coverlink: "letsdoit.jpg",
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
coverlink: "minakofavorites.jpg",
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
coverlink: "monstersintown.jpg",
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
coverlink: "monochrome.jpg",
flavor: "Funk/Soul"
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
coverlink: "lightnup.jpg",
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
coverlink: "bells.jpg",
flavor: "Funk/Ballad"
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
coverlink: "seychelles.jpg",
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
coverlink: "aninsatiablehigh.jpg",
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
coverlink: "takanaka.jpg",
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
coverlink: "brasilianskies.jpg",
flavor: "Fusion/Latin"
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
coverlink: "allofme.jpg",
flavor: "Fusion/Latin/Compilation"
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
coverlink: "baccochachame.jpg",
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
coverlink: "jollyjive.jpg",
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
coverlink: "alone.jpg",
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
coverlink: "therainbowgoblins.jpg",
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
coverlink: "oceanbreeze.jpg",
flavor: "Fusion/Compilation"
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
coverlink: "canising.jpg",
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
coverlink: "saudade.jpg",
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
coverlink: "夏全開.jpg",
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
coverlink: "traumatic.jpg",
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
coverlink: "junglejane.jpg",
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
coverlink: "hotpepper.jpg",
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
coverlink: "gaps.jpg",
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
coverlink: "thepartysjustbegun.jpg",
flavor: "Fusion/Compilation"
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
coverlink: "onenightgig.jpg",
flavor: "Fusion/Live"
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
coverlink: "aquaplanet.jpg",
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
coverlink: "thelover.jpg",
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
coverlink: "themanwiththeguitar.jpg",
flavor: "Fusion/Compilation"
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
coverlink: "thebrilliantbest.jpg",
flavor: "Fusion/Compilation"
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
coverlink: "natsudo.jpg",
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
coverlink: "karuizawadaydream.jpg",
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
coverlink: "lovesongs.jpg",
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
coverlink: "missm.jpg",
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
coverlink: "variety.jpg",
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
coverlink: "request.jpg",
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
coverlink: "quietlife.jpg",
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
coverlink: "bonappetit.jpg",
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
coverlink: "denim.jpg",
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
title: "ラスト・デイト",
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
coverlink: "trad.jpg",
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
coverlink: "apricotjam.jpg",
flavor: "Soul/Funk"
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
coverlink: "feelin.jpg",
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
coverlink: "heavenbeach.jpg",
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
coverlink: "bikini.jpg",
flavor: "Funk/Disco"
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
coverlink: "timely.jpg",
flavor: "Funk/Disco"
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
coverlink: "coool.jpg",
flavor: "Disco/Ballad"
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
coverlink: "wave.jpg",
flavor: "Funk/Disco"
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
coverlink: "哀しみの孔雀.jpg",
flavor: "Ballad/Folk"
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
coverlink: "reflections.jpg",
flavor: "Rock"
},
[{
title: "Habana Express",
romanization: "",
duration: "4:13"
},
{
title: "渚のカンパリ・ソーダ",
romanization: "",
duration: "4:31"
},
{
title: "喜望峰",
romanization: "",
duration: "4:11"
},
{
title: "二季物語",
romanization: "",
duration: "8:07"
},
{
title: "ルビーの指環",
romanization: "",
duration: "4:17"
},
{
title: "Shadow City",
romanization: "",
duration: "4:23"
},
{
title: "予期せぬ出来事",
romanization: "",
duration: "4:19"
},
{
title: "ダイヤルM",
romanization: "",
duration: "3:48"
},
{
title: "北ウィング",
romanization: "",
duration: "4:51"
},
{
title: "出航 Sasurai",
romanization: "",
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
coverlink: "atmosphere.jpg",
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
coverlink: "thrutraffic.jpg",
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
coverlink: "firstlight.jpg",
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
coverlink: "thepressuresandthepleasures.jpg",
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
coverlink: "quietskies.jpg",
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
coverlink: "cologne.jpg",
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
coverlink: "瞳に映して.png",
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
coverlink: "lovetrip.jpg",
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
coverlink: "jody.jpg",
flavor: "Cover/Tribute"
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
coverlink: "artisan.jpg",
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
coverlink: "cheerupthesummer.jpg",
flavor: "Single/Dreamy"
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
coverlink: "comealong3.jpg",
flavor: "Funk/Compilation"
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
coverlink: "cozy.jpg",
flavor: "Dreamy/Funk"
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
year: "1984",
description: "",
coverlink: "foryou.jpg",
flavor: "Funk/Dreamy"
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
coverlink: "melodies.jpg",
flavor: "Funk/Dreamy"
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
coverlink: "onthestreetcorner1.jpg",
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
coverlink: "onthestreetcorner2.jpg",
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
coverlink: "onthestreetcorner3.jpg",
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
coverlink: "pocketmusic.jpg",
flavor: "Dreamy/Ballad"
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
coverlink: "reborn.jpg",
flavor: "Dreamy/Compilation"
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
coverlink: "seasonsgreetings.jpg",
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
coverlink: "treasures.jpg",
flavor: "Dreamy/Compilation"
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
coverlink: "僕の中の少年.jpg",
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
title: "僕の中の少年",
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
coverlink: "光と君へのレクイエム.jpg",
flavor: "Dreamy/Single"
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
coverlink: "tatsurosongsfromla2.jpg",
flavor: "Cover/Tribute/English"
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
coverlink: "tatsurosongsfromla.jpg",
flavor: "Cover/Tribute/English"
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
coverlink: "surfsnow.jpg",
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
coverlink: "seabreeze.jpg",
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
coverlink: "weekendflytothesun.jpg",
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
coverlink: "onthecityshore.jpg",
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
coverlink: "after5crash.jpg",
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
coverlink: "summertimeromance.jpg",
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
coverlink: "golddigger.jpg",
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
coverlink: "touchandgo.jpg",
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
coverlink: "seaisalady.jpg",
flavor: "Funk"
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
coverlink: "beforethedaylight.jpg",
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
coverlink: "reasonsforthousandlovers.jpg",
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
coverlink: "legacyofyou.jpg",
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
coverlink: "allisvanity.jpg",
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
coverlink: "あるがままに.jpg",
flavor: "Funk"
},
[{
title: "さよならなんて絶對言わない",
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
coverlink: "君をこえる日.jpg",
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
coverlink: "timetunnel.jpg",
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
coverlink: "存在の証明.jpg",
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
coverlink: "incarnatio.jpg",
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
coverlink: "summer4rhythm.jpg",
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
coverlink: "noturns.jpg",
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
coverlink: "citylightsdandy.jpg",
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
coverlink: "rebirth1remakebest.jpg",
flavor: "Funk/Compilation"
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
coverlink: "seaisalady2017.jpg",
flavor: "Funk/Remake"
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
coverlink: "coconutshouse.jpg",
flavor: "Funk/Latin"
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
coverlink: "fridaymagic.jpg",
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
coverlink: "mint.jpg",
flavor: "Funk/Ballad"
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
coverlink: "ロートスの果実.jpg",
flavor: "Funk/Latin"
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
coverlink: "chakichakiclub.jpg",
flavor: "Funk/Ballad"
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
coverlink: "moods.jpg",
flavor: "Funk/Ballad"
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
coverlink: "puzzle.jpg",
flavor: "Funk/Ballad"
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
coverlink: "casiopea.jpg",
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
coverlink: "superflight.jpg",
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
coverlink: "makeupcity.jpg",
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
coverlink: "crosspoint.jpg",
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
coverlink: "eyesofthemind.jpg",
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
coverlink: "4x4.jpg",
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
coverlink: "mintjams.jpg",
flavor: "Fusion/Compilation"
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
coverlink: "jivejive.jpg",
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
coverlink: "photographs.jpg",
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
coverlink: "downupbeat.jpg",
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
coverlink: "thesoundgraphy.jpg",
flavor: "Fusion/Compilation"
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
coverlink: "landingtosummer.jpg",
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
coverlink: "sunsun.jpg",
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
coverlink: "platinum.jpg",
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
coverlink: "euphony.jpg",
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
coverlink: "thelastmembers.jpg",
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
coverlink: "theparty.jpg",
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
coverlink: "fullcolors.jpg",
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
coverlink: "active.jpg",
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
coverlink: "answers.jpg",
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
coverlink: "heartynotes.jpg",
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
coverlink: "freshness.jpg",
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
coverlink: "workin.jpg",
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
coverlink: "lightandshadows.jpg",
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
coverlink: "be.jpg",
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
coverlink: "bittersweet.jpg",
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
coverlink: "marble.jpg",
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
coverlink: "gentlemellow.jpg",
flavor: "Fusion/Compilation"
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
coverlink: "groovepassion.jpg",
flavor: "Fusion/Compilation"
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
coverlink: "signal.jpg",
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
