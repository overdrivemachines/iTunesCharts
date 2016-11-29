class AddYoutubeToSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :youtube_id, :string
    add_column :songs, :youtube_views, :integer
    add_column :songs, :youtube_likes, :integer
    add_column :songs, :youtube_dislikes, :integer
  end
end
