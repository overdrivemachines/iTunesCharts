# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

count = 5
youtube_api_key = "AIzaSyBCX3JOJlNp76w6b38jwgY3ksQcwHl7F70"
entry = Hash.new
query = ""
youtube_result = Hash.new

# Get the json from Apple
itunes_result = JSON.parse(open("https://itunes.apple.com/us/rss/topsongs/limit=#{count}/explicit=true/json").read)
entries = itunes_result["feed"]["entry"]

for i in 0..(count - 1)
	entry = entries[i]
	# Check if Song already exists
	if (!Song.find_by_id(entry["id"]["attributes"]["im:id"].to_i))
		# New Song object
		song = Song.new

		song.id = entry["id"]["attributes"]["im:id"].to_i
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
		puts "Query: " + query
		youtube_result = JSON.parse(open("https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=1&order=viewCount&q=#{query}&type=video&key=#{youtube_api_key}").read) 
		youtube_video = youtube_result["items"][0]
		song.youtube_id = youtube_video["id"]["videoId"]		
		puts "Youtube Video Title: " + youtube_video["snippet"]["title"]

		# Get stats for the Youtube video
		youtube_result = JSON.parse(open("https://www.googleapis.com/youtube/v3/videos?id=#{song.youtube_id}&key=#{youtube_api_key}&part=snippet,statistics").read) 
		song.views = youtube_result["items"]["statistics"]["viewCount"]
		puts "Views = " + song.views
		song.likes = youtube_result["items"]["statistics"]["likeCount"]
		puts "Likes = " + song.likes
		song.dislikes = youtube_result["items"]["statistics"]["dislikeCount"]
		puts "Dislikes = " + song.dislikes


		# Check if category exists
		if (!Category.find_by_id(song.category_id))
			category = Category.new
			category.id = song.category_id
			category.name = entry["category"]["attributes"]["term"]

			# Save new Category
			category.save
		end

		# Save new Song
		song.save
	end
	
end
