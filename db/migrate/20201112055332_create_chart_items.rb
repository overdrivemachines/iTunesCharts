class CreateChartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :chart_items do |t|
      t.integer :position
      t.references :song, null: false, foreign_key: true
      t.integer :top10_count
      t.integer :top25_count
      t.string :top5_count
      t.string :integer

      t.timestamps
    end
  end
end
