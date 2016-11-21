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
#

class Song < ApplicationRecord
  belongs_to :category
end
