# == Schema Information
#
# Table name: chart_items
#
#  id          :integer          not null, primary key
#  position    :integer
#  song_id     :integer          not null
#  top10_count :integer
#  top25_count :integer
#  top5_count  :string
#  integer     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class ChartItem < ApplicationRecord
  belongs_to :song
end
