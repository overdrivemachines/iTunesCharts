json.extract! vote, :id, :song_id, :user_id, :like, :created_at, :updated_at
json.url vote_url(vote, format: :json)