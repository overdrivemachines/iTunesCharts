# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  like       :boolean
#  song_id    :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Vote < ApplicationRecord
  belongs_to :song
  belongs_to :user
end
