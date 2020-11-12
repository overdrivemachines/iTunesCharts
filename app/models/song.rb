# == Schema Information
#
# Table name: songs
#
#  id               :integer          not null, primary key
#  album            :string
#  artist           :string
#  name             :string
#  release_date     :string
#  youtube_likes    :string
#  youtube_dislikes :string
#  youtube_id       :string
#  youtube_views    :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Song < ApplicationRecord
end
