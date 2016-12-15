# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  song_id    :integer
#  user_id    :integer
#  like       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vote < ApplicationRecord
  belongs_to :song
  belongs_to :user
end
