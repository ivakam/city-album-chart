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
title: "Signifie",
romanization: "",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "1983",
description: "",
coverlink: "signifie.jpg",
flavor: "Electronic"
},
[{
title: "夏に恋する女たち",
romanization: "",
duration: "4:43"
},
{
title: "幻惑",
romanization: "",
duration: "4:55"
},
{
title: "Signe_記号_",
romanization: "",
duration: "4:14"
},
{
title: "Patio_中庭_",
romanization: "",
duration: "3:52"
},
{
title: "ルクレツィア",
romanization: "",
duration: "1:43"
},
{
title: "テディベア",
romanization: "",
duration: "3:49"
},
{
title: "Recipe_調理法_",
romanization: "",
duration: "3:33"
},
{
title: "アーニャ",
romanization: "",
duration: "2:07"
},
{
title: "Siesta_ひるね_",
romanization: "",
duration: "4:08"
},
{
title: "エル.トゥルニエ_虹の神_",
romanization: "",
duration: "3:17"
},
{
title: "みずうみ",
romanization: "",
duration: "2:18"
},
]
)
CreateAlbumWithTracks({
title: "カイエ",
romanization: "Caillet",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "1984",
description: "",
coverlink: "カイエ.jpg",
flavor: "Electronic"
},
[{
title: "カイエ 1",
romanization: "",
duration: "2:02"
},
{
title: "Amour Levant -若き日の望楼-",
romanization: "",
duration: "3:49"
},
{
title: "輪舞",
romanization: "",
duration: "3:03"
},
{
title: "Le Courant De Mecontentment",
romanization: "",
duration: "4:18"
},
{
title: "カイエ 2",
romanization: "",
duration: "2:26"
},
{
title: "宇宙みつけた",
romanization: "",
duration: "3:44"
},
{
title: "ラ.ストラーダ",
romanization: "",
duration: "4:49"
},
{
title: "雨の夜明け",
romanization: "",
duration: "4:20"
},
{
title: "夏に恋する女たち",
romanization: "",
duration: "4:59"
},
{
title: "メトロポリタン美術館",
romanization: "",
duration: "2:19"
},
]
)
CreateAlbumWithTracks({
title: "Copine",
romanization: "",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "1985",
description: "",
coverlink: "copine.jpg",
flavor: "Electronic"
},
[{
title: "Les Aventurea De Tintin",
romanization: "",
duration: "4:33"
},
{
title: "ベジタブル",
romanization: "",
duration: "4:13"
},
{
title: "春の嵐",
romanization: "",
duration: "3:58"
},
{
title: "Siena",
romanization: "",
duration: "4:21"
},
{
title: "Amico, Sei Felice?",
romanization: "",
duration: "4:07"
},
{
title: "Out Of Africa",
romanization: "",
duration: "3:21"
},
{
title: "Leave Me Alone",
romanization: "",
duration: "4:42"
},
{
title: "Jaques-Henri Lartigue",
romanization: "",
duration: "3:11"
},
{
title: "しあわせな男達へ",
romanization: "",
duration: "4:48"
},
{
title: "野辺",
romanization: "",
duration: "2:45"
},
]
)
CreateAlbumWithTracks({
title: "Comin' Soon",
romanization: "",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "1986",
description: "",
coverlink: "cominsoon.jpg",
flavor: "Electronic"
},
[{
title: "Alice",
romanization: "",
duration: "5:43"
},
{
title: "ピーターラビットとわたし",
romanization: "",
duration: "3:11"
},
{
title: "ロボット・マーチ",
romanization: "",
duration: "3:47"
},
{
title: "メトロポリタン美術館 (ミュージアム)",
romanization: "",
duration: "2:18"
},
{
title: "MOMO",
romanization: "",
duration: "3:40"
},
{
title: "森のクリスマス",
romanization: "",
duration: "4:04"
},
{
title: "テディ・ベア",
romanization: "",
duration: "3:49"
},
{
title: "チェッカーくん",
romanization: "",
duration: "3:56"
},
{
title: "お天気のいい日",
romanization: "",
duration: "3:19"
},
{
title: "地下鉄のザジ",
romanization: "",
duration: "3:17"
},
{
title: "タンタンの冒険",
romanization: "",
duration: "4:35"
},
{
title: "Comin' Soon ''Small Days In a Big World''",
romanization: "",
duration: "4:18"
},
]
)
CreateAlbumWithTracks({
title: "Purissima",
romanization: "",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "1988",
description: "",
coverlink: "purissima.jpg",
flavor: "Jazz/Electronic"
},
[{
title: "Tema Purissima",
romanization: "",
duration: "3:54"
},
{
title: "Monochrome & Colours",
romanization: "",
duration: "4:10"
},
{
title: "Cavalier Servente",
romanization: "",
duration: "3:56"
},
{
title: "Voce e Bossanova",
romanization: "",
duration: "3:27"
},
{
title: "恋人とは",
romanization: "",
duration: "4:08"
},
{
title: "Rain Dance",
romanization: "",
duration: "3:28"
},
{
title: "Good Luck! 小さなショーウインド",
romanization: "",
duration: "4:16"
},
{
title: "或る晴れた日",
romanization: "",
duration: "4:29"
},
{
title: "月のきざはし",
romanization: "",
duration: "5:07"
},
]
)
CreateAlbumWithTracks({
title: "New Moon",
romanization: "",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "1990",
description: "",
coverlink: "newmoon.jpg",
flavor: "Electronic/Experimental"
},
[{
title: "泳ぐ人",
romanization: "",
duration: "5:04"
},
{
title: "Call my Heart",
romanization: "",
duration: "4:00"
},
{
title: "We are One Circle",
romanization: "",
duration: "4:32"
},
{
title: "楽園をはなれて",
romanization: "",
duration: "4:59"
},
{
title: "風の吹く街 -Hello New Days-",
romanization: "",
duration: "5:00"
},
{
title: "My Bravery",
romanization: "",
duration: "4:33"
},
{
title: "花咲くころに",
romanization: "",
duration: "4:24"
},
{
title: "水の上の一日 -A Day On The Water-",
romanization: "",
duration: "5:06"
},
{
title: "Little Hope",
romanization: "",
duration: "3:08"
},
{
title: "地球ファミリーのテーマ -The Wind Of My Heart-",
romanization: "",
duration: "4:05"
},
]
)
CreateAlbumWithTracks({
title: "Drawing",
romanization: "",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "1992",
description: "",
coverlink: "drawing.jpg",
flavor: "Ballad"
},
[{
title: "OKAVANGO",
romanization: "",
duration: "4:39"
},
{
title: "White Wolf",
romanization: "",
duration: "4:29"
},
{
title: "素直になりたい",
romanization: "",
duration: "4:38"
},
{
title: "dreamland",
romanization: "",
duration: "4:45"
},
{
title: "哀しみの足音",
romanization: "",
duration: "4:29"
},
{
title: "Dr.ドリトル",
romanization: "",
duration: "3:57"
},
{
title: "What to do 'cause love you",
romanization: "",
duration: "5:10"
},
{
title: "静かな約束",
romanization: "",
duration: "4:37"
},
{
title: "恋に落ちて",
romanization: "",
duration: "4:24"
},
{
title: "あなたと私",
romanization: "",
duration: "3:25"
},
]
)
CreateAlbumWithTracks({
title: "Shooting Star in the Blue Sky",
romanization: "",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "1993",
description: "",
coverlink: "shootingstarinthebluesky.jpg",
flavor: "Electronic/Experimental"
},
[{
title: "しあわせのサンドウィッチ",
romanization: "",
duration: "3:39"
},
{
title: "Shooting star in the blue sky",
romanization: "",
duration: "4:32"
},
{
title: "Do you smile again",
romanization: "",
duration: "4:55"
},
{
title: "Crazy on you",
romanization: "",
duration: "4:53"
},
{
title: "Sea of Cortez",
romanization: "",
duration: "5:50"
},
{
title: "Million bucks",
romanization: "",
duration: "5:33"
},
{
title: "六月の晴れた午後",
romanization: "",
duration: "3:46"
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
title: "Tchou!",
romanization: "",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "1995",
description: "",
coverlink: "tchou!.jpg",
flavor: "Electronic"
},
[{
title: "美しい人よ (アルバム・ヴァージョン)",
romanization: "",
duration: "4:32"
},
{
title: "小さなワルツ",
romanization: "",
duration: "4:12"
},
{
title: "BERIMBAU DO BEM",
romanization: "",
duration: "5:23"
},
{
title: "Praia Linda / 美しい浜辺",
romanization: "",
duration: "4:09"
},
{
title: "永遠の夏",
romanization: "",
duration: "5:15"
},
{
title: "Onde esta voce",
romanization: "",
duration: "3:40"
},
{
title: "JAPAO",
romanization: "",
duration: "4:28"
},
{
title: "Meu Namorado / 私の恋人",
romanization: "",
duration: "3:30"
},
{
title: "FRIENDS",
romanization: "",
duration: "4:48"
},
{
title: "歌う森、踊る水",
romanization: "",
duration: "5:16"
},
{
title: "SAMBA DO MAR",
romanization: "",
duration: "4:51"
},
]
)
CreateAlbumWithTracks({
title: "Lucy",
romanization: "",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "1997",
description: "",
coverlink: "lucy.jpg",
flavor: "Ambient/Experimental"
},
[{
title: "Lulu",
romanization: "",
duration: "4:29"
},
{
title: "Happy-go-Lucky",
romanization: "",
duration: "4:27"
},
{
title: "Simba Kubwa",
romanization: "",
duration: "5:16"
},
{
title: "Volcano",
romanization: "",
duration: "5:34"
},
{
title: "Tango",
romanization: "",
duration: "5:59"
},
{
title: "夢のあと",
romanization: "",
duration: "4:06"
},
{
title: "CaCao",
romanization: "",
duration: "3:16"
},
{
title: "Mon doux Soleil",
romanization: "",
duration: "4:40"
},
{
title: "空へ",
romanization: "",
duration: "5:28"
},
{
title: "Rain",
romanization: "",
duration: "6:05"
},
]
)
CreateAlbumWithTracks({
title: "Attraction",
romanization: "",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "1999",
description: "",
coverlink: "attraction.jpg",
flavor: "Electronic/Experimental"
},
[{
title: "Cosmic Moon",
romanization: "",
duration: "6:16"
},
{
title: "枯葉",
romanization: "",
duration: "4:55"
},
{
title: "それとも ~Pour un oui ou Pour un non~",
romanization: "",
duration: "3:57"
},
{
title: "昨日,今日,明日",
romanization: "",
duration: "4:23"
},
{
title: "四季",
romanization: "",
duration: "4:16"
},
{
title: "Kiss The Dream",
romanization: "",
duration: "2:52"
},
{
title: "Mon doux Soleil",
romanization: "",
duration: "4:01"
},
{
title: "Cicada",
romanization: "",
duration: "1:01"
},
{
title: "風の旅人",
romanization: "",
duration: "3:28"
},
{
title: "Kiss The Dream (Piano)",
romanization: "",
duration: "2:45"
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
title: "Ensemble",
romanization: "",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "2000",
description: "",
coverlink: "ensemble.jpg",
flavor: "Euro/Ballad"
},
[{
title: "風花",
romanization: "",
duration: "4:14"
},
{
title: "Comment oublier～忘却",
romanization: "",
duration: "4:00"
},
{
title: "L'ecume des jours～うたかたの日々",
romanization: "",
duration: "3:05"
},
{
title: "太陽の人",
romanization: "",
duration: "2:40"
},
{
title: "RENDEZ-VOUS",
romanization: "",
duration: "3:30"
},
{
title: "エトランゼ～etranger",
romanization: "",
duration: "3:23"
},
{
title: "花を待ちながら～en espera de una flor",
romanization: "",
duration: "3:50"
},
{
title: "愛を忘れないように～Pour ne pas oublier l'amour",
romanization: "",
duration: "3:51"
},
{
title: "Espoir",
romanization: "",
duration: "4:01"
},
{
title: "アカンサスの庭",
romanization: "",
duration: "1:52"
},
]
)
CreateAlbumWithTracks({
title: "Note",
romanization: "",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "2002",
description: "",
coverlink: "note.jpg",
flavor: "Jazz/Ballad"
},
[{
title: "あなたを思うと",
romanization: "",
duration: "4:17"
},
{
title: "緑の風",
romanization: "",
duration: "3:34"
},
{
title: "友達",
romanization: "",
duration: "4:10"
},
{
title: "Wonderland",
romanization: "",
duration: "4:40"
},
{
title: "虹",
romanization: "",
duration: "4:11"
},
{
title: "la musique",
romanization: "",
duration: "3:51"
},
{
title: "太陽がいっぱい",
romanization: "",
duration: "3:44"
},
{
title: "snow",
romanization: "",
duration: "4:51"
},
{
title: "星の奇跡",
romanization: "",
duration: "4:25"
},
{
title: "ただ",
romanization: "",
duration: "3:08"
},
]
)
CreateAlbumWithTracks({
title: "Boucles d'oreilles",
romanization: "",
romaji_artist: "Taeko Ohnuki",
japanese_artist: "大貫妙子",
year: "2007",
description: "",
coverlink: "bouclesdoreilles.jpg",
flavor: "Ballad"
},
[{
title: "Shall we dance?",
romanization: "",
duration: "3:19"
},
{
title: "Cavaliere Servente",
romanization: "",
duration: "4:00"
},
{
title: "彼と彼女のソネット",
romanization: "",
duration: "4:21"
},
{
title: "若き日の望楼",
romanization: "",
duration: "4:31"
},
{
title: "風の道",
romanization: "",
duration: "3:40"
},
{
title: "Hiver",
romanization: "",
duration: "4:10"
},
{
title: "Time To Go",
romanization: "",
duration: "5:43"
},
{
title: "Shenandoah",
romanization: "",
duration: "3:12"
},
{
title: "メトロポリタン美術館",
romanization: "",
duration: "2:32"
},
{
title: "黒のクレール",
romanization: "",
duration: "5:55"
},
{
title: "横顔",
romanization: "",
duration: "3:12"
},
{
title: "新しいシャツ",
romanization: "",
duration: "3:27"
},
{
title: "Siena",
romanization: "",
duration: "4:25"
},
{
title: "突然の贈りもの",
romanization: "",
duration: "4:31"
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
flavor: "Fusion/Samba"
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
flavor: "Fusion/Samba/Compilation"
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
title: "CAT'S EYE",
romanization: "",
duration: "3:09"
},
{
title: "WINDY SUMMER",
romanization: "",
duration: "4:06"
},
{
title: "STAY BY ME",
romanization: "",
duration: "3:37"
},
{
title: "A HOPE FROM SAD STREET",
romanization: "",
duration: "4:19"
},
{
title: "YOU ARE NOT ALONE",
romanization: "",
duration: "4:03"
},
{
title: "悲しみがとまらない",
romanization: "",
duration: "4:23"
},
{
title: "SHYNESS BOY",
romanization: "",
duration: "3:16"
},
{
title: "LOST LOVE IN THE RAIN",
romanization: "",
duration: "4:19"
},
{
title: "DRIVING MY LOVE",
romanization: "",
duration: "4:51"
},
{
title: "GOOD-NIGHT FOR YOU",
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
