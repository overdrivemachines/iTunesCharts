class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :album
      t.string :artist
      t.string :name
      t.string :release_date
      t.string :youtube_likes
      t.string :youtube_dislikes
      t.string :youtube_id
      t.string :youtube_views

      t.timestamps
    end
  end
end
