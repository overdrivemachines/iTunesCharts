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

# Get the json from Apple
itunes_result = JSON.parse(open("https://itunes.apple.com/us/rss/topsongs/limit=#{count}/explicit=true/json").read)
entries = itunes_result["feed"]["entry"]

for i in 0..(count - 1)
	puts entries[i]["category"]["attributes"]["im:id"]
end
