json.extract! chart_item, :id, :song_id, :position, :top5, :top10, :top25, :created_at, :updated_at
json.url chart_item_url(chart_item, format: :json)