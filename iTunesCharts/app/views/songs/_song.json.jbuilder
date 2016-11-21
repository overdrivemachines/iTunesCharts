json.extract! song, :id, :name, :artist, :album, :category_id, :image_url, :preview_audio_url, :release_date, :created_at, :updated_at
json.url song_url(song, format: :json)