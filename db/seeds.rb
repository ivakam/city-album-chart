require 'faker'
require 'yaml'
Faker::UniqueGenerator.clear

def orphan_dummy
	user = User.new()
	user.username = '<Deleted>'
	user.email = 'deleted@dummy.com'
	user.password = Faker::Internet.password(8, 16)
	user.admin = false
	user.banned = false
	user.gender = 'Unknown'
	user.birth_year = 'Unknown'
	user.location = ''
	user.bio = ''
	user.signature = ''
	user.badges = ''
	user.album_fav = ''
	user.save
	p "Dummy generated"
end

orphan_dummy

(0..50).each do | i |
	user = User.new()
	user.username = Faker::Internet.unique.username
	user.email = Faker::Internet.unique.email
	user.password = Faker::Internet.password(8, 16)
	user.admin = rand(0..50) > 47 ? true : false
	user.banned = false
	user.gender = rand(0..1) == 1 ? 'Male' : 'Female'
	user.birth_year = rand(1900..2019)
	user.location = Faker::Address.country
	user.bio = Faker::MostInterestingManInTheWorld.quote
	user.signature = Faker::Dota.quote
	badgeArr = ['Admin ', 'VIP ', 'Honorary ', 'Funk_master ', 'Oldie ']
	user.badges = ''
	badgeArr.each do | b |
		if rand(0..2) == 1
			user.badges << b
		end
	end
	user.album_fav = ''
	albums = Album.all.size
	(0...5).each do | j |
		user.album_fav << rand(1..albums).to_s + ' '
	end
	user.save
	p "User #{i} generated"
end

@usercount = User.all.length

(0..5).each do | i |
	thread = ForumThread.new()
	thread.title = Faker::Book.title
	thread.category = 'rules'
	thread.stickied = true
	thread.archived = false
	thread.locked = false
	thread.user = User.find(rand(2..@usercount))
	thread.body = Faker::HitchhikersGuideToTheGalaxy.quote
	thread.save
	p "Thread #{i} generated"
end

(0..50).each do | i |
	thread = ForumThread.new()
	thread.title = Faker::Book.title
	thread.category = 'rules'
	thread.stickied = false
	thread.archived = false
	thread.locked = false
	thread.user = User.find(rand(2..@usercount))
	thread.body = Faker::HitchhikersGuideToTheGalaxy.quote
	thread.save
	p "Thread #{i} generated"
end

ForumThread.all.each_with_index do | parentThread, i |
	(1..rand(5..20)).each do | j |
		reply = Post.new()
		reply.user = User.find(rand(2..@usercount))
		reply.forum_thread = parentThread
		reply.body = Faker::HitchhikersGuideToTheGalaxy.quote
		reply.post_index = j
		(1..rand(5..20)).each do | k |
			upvote = Upvote.new()
			upvote.post = reply
			upvote.user = User.find(rand(2..@usercount))
			upvote.save
		end
		p "Post #{j} for thread ##{parentThread.id} #{parentThread.title} generated"
		reply.save
	end
end

(0..10).each do | i |
	article = Article.new()
	article.user = User.find(rand(2..@usercount))
	article.title = Faker::Book.title
	article.subtitle = Faker::Lorem.sentence(4, false, 5)
	article.body = Faker::Lorem.paragraphs(5)
	article.featured = rand(0...8) == 1 ? true : false
	(1..rand(5..20)).each do | k |
		upvote = Upvote.new()
		upvote.article = article
		upvote.user = User.find(rand(2..@usercount))
		upvote.save
	end
	p "Article #{i} generated"
end

Article.all.each_with_index do | article, i |
	(1..rand(5..20)).each do | j |
		reply = Comment.new()
		reply.user = User.find(rand(2..@usercount))
		reply.article = article
		reply.body = Faker::HitchhikersGuideToTheGalaxy.quote
		(1..rand(5..20)).each do | k |
			upvote = Upvote.new()
			upvote.comment = reply
			upvote.user = User.find(rand(2..@usercount))
			upvote.save
		end
		p "Comment #{j} for article ##{article.id} #{article.title} generated"
		reply.save
	end
end

def CreateAlbumWithTracks(albumParam, tracks = [])
	currentAlbum = Album.new(albumParam)
	coverName = currentAlbum.title.downcase.gsub(/[^[\u3000-\u303F][\u3040-\u309F][\u30A0-\u30FF][\uFF00-\uFFEF][\u4E00-\u9FAF][\u2605-\u2606][\u2190-\u2195]\u203B\p{L}\d\\]/, '')
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
    	currentAlbum.user_id = rand(2..User.all.size)
    end
    tracks.each do |t|
        currentAlbum.tags << " #{t[:title]} #{t[:romanization]}"
    end
	tempQuality = 0
	trackDurationCount = 0
	tracks.each_with_index do | t, i |
		t[:order] = i + 1
	end
	hasTracks = (tracks == []) ? false : true
	tracks.each do | t |
		albumTrack = Track.new()
		albumTrack.title = t[:title]
		albumTrack.romanization = t[:romanization]
		albumTrack.duration = t[:duration]
		albumTrack.album = currentAlbum
		albumTrack.save
		if t[:duration].present?
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

@albumData = YAML::load(File.open('albums.yml', 'r'))
@albumData.each do | key, value |
	CreateAlbumWithTracks(value[:album_info], value[:tracks])
end