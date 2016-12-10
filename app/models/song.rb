# == Schema Information
#
# Table name: songs
#
#  id                :integer          not null, primary key
#  name              :string
#  artist            :string
#  album             :string
#  category_id       :integer
#  image_url         :string
#  preview_audio_url :string
#  release_date      :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  youtube_id        :string
#  youtube_views     :integer
#  youtube_likes     :integer
#  youtube_dislikes  :integer
#

class Song < ApplicationRecord
	belongs_to :category
	has_many :votes

	def fullName
		artist + " - " + name
	end

	def liked_by(user)
		vote = Vote.where(:user_id => user.id).where(:song_id => id)[0]
		# Check if vote already exists in DB
		if (vote == nil)
			# Create new vote
			vote = Vote.create(song_id: id, user_id: user.id, like: true)
		else
			vote.like = true
			vote.save
		end
	end

	def disliked_by(user)
		vote = Vote.where(:user_id => user.id).where(:song_id => id)[0]
		# Check if vote already exists in DB
		if (vote == nil)
			# Create new vote
			vote = Vote.create(song_id: id, user_id: user.id, like: false)
		else
			vote.like = false
			vote.save
		end
	end

	def removevote_by(user)
		vote = Vote.where(:user_id => user.id).where(:song_id => id)[0]
		vote.destroy
	end

end
