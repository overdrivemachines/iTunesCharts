# == Schema Information
#
# Table name: chart_items
#
#  id         :integer          not null, primary key
#  song_id    :integer
#  position   :integer
#  top5       :integer          default(0)
#  top10      :integer          default(0)
#  top25      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ChartItem < ApplicationRecord
  belongs_to :song
end
