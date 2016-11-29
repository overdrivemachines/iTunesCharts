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
end
