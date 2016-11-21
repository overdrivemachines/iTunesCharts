class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.string :album
      t.references :category, foreign_key: true
      t.string :image_url
      t.string :preview_audio_url
      t.date :release_date

      t.timestamps
    end
  end
end
