# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

count = 20
youtube_api_key = "AIzaSyBCX3JOJlNp76w6b38jwgY3ksQcwHl7F70"
entry = Hash.new
query = ""
youtube_result = Hash.new

# Get the json from Apple
itunes_result = JSON.parse(open("https://itunes.apple.com/us/rss/topsongs/limit=#{count}/explicit=true/json").read)
entries = itunes_result["feed"]["entry"]

for i in 0..(count - 1)
	entry = entries[i]
	songID = entry["id"]["attributes"]["im:id"].to_i
	# Check if Song already exists in Songs Table
	if (!Song.find_by_id(songID))
		puts "==================================="
		puts "POSITION #{i + 1}. NEW SONG"
		# New Song object
		song = Song.new

		song.id = songID
		song.name = entry["im:name"]["label"]
		song.artist = entry["im:artist"]["label"]
		song.album = entry["im:collection"]["im:name"]["label"]
		song.category_id = entry["category"]["attributes"]["im:id"].to_i
		song.image_url = entry["im:image"][2]["label"]
		song.preview_audio_url = entry["link"][1]["attributes"]["href"]
		song.release_date = entry["im:releaseDate"]["attributes"]["label"]

		# Youtube
		# Find Youtube video
		query = entry["title"]["label"]
		puts "Original Query: " + query
		# remove accents
		# ActiveSupport::Inflector.transliterate(query)
		# # remove non-ascii characters
		# query.gsub!(/\P{ASCII}/, '')
		# escape the URI
		query = URI.escape(query)
		puts "URL Friendly Query: " + query
		# youtube_result = JSON.parse(open("https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=1&order=viewCount&q=#{query}&type=video&key=#{youtube_api_key}").read) 
		youtube_result = JSON.parse(open("https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=1&q=#{query}&type=video&key=#{youtube_api_key}").read) 
		youtube_video = youtube_result["items"][0]
		song.youtube_id = youtube_video["id"]["videoId"]		
		puts "Youtube Video Title: " + youtube_video["snippet"]["title"]

		# Get stats for the Youtube video
		youtube_result = JSON.parse(open("https://www.googleapis.com/youtube/v3/videos?id=#{song.youtube_id}&key=#{youtube_api_key}&part=snippet,statistics").read) 
		# puts youtube_result["items"][0]["statistics"].inspect
		song.youtube_views = youtube_result["items"][0]["statistics"]["viewCount"].to_i
		puts "Views = " + song.youtube_views.to_s
		song.youtube_likes = youtube_result["items"][0]["statistics"]["likeCount"].to_i
		puts "Likes = " + song.youtube_likes.to_s
		song.youtube_dislikes = youtube_result["items"][0]["statistics"]["dislikeCount"].to_i
		puts "Dislikes = " + song.youtube_dislikes.to_s


		# Check if category exists
		if (!Category.find_by_id(song.category_id))
			category = Category.new
			category.id = song.category_id
			category.name = entry["category"]["attributes"]["term"]

			# Save new Category
			category.save
		end

		puts "Category: " + song.category_id.to_s + " " + song.category.name

		# Save new Song
		song.save
		puts "==================================="
	else
		# Song exists. Need to update stats.
		puts "================="
		puts "POSITION #{i + 1}. UPDATING SONG"
		song = Song.find_by_id(songID)
		youtube_result = JSON.parse(open("https://www.googleapis.com/youtube/v3/videos?id=#{song.youtube_id}&key=#{youtube_api_key}&part=snippet,statistics").read)
		puts "Youtube Video Title: " + youtube_result["items"][0]["snippet"]["title"]
		song.youtube_views = youtube_result["items"][0]["statistics"]["viewCount"].to_i
		puts "Views = " + song.youtube_views.to_s
		song.youtube_likes = youtube_result["items"][0]["statistics"]["likeCount"].to_i
		puts "Likes = " + song.youtube_likes.to_s
		song.youtube_dislikes = youtube_result["items"][0]["statistics"]["dislikeCount"].to_i
		puts "Dislikes = " + song.youtube_dislikes.to_s
		puts "================="
	end

	# Check if entry exists in ChartItems table
	ci = ChartItem.find_by_song_id(songID)
	if (ci == nil)
		puts "New Chart Entry " + (i + 1).to_s + ": " + songID.to_s
		# Create new ChartItem
		ci = ChartItem.new
		ci.song_id = songID
	end
	ci.position = i + 1
	if (i < 25)
		ci.top25 += 1
	end
	if (i < 10)
		ci.top10 += 1
	end
	if (i < 5)
		ci.top5 += 1
	end
	ci.save	
end
