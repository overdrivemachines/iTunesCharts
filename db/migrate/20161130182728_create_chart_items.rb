class CreateChartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :chart_items do |t|
      t.references :song, foreign_key: true
      t.integer :position, :limit => 1 # tinyint (1 byte, -128 to 127)
      t.integer :top5, :limit => 2 # smallint (2 bytes, max 32,767)
      t.integer :top10, :limit => 2 # smallint (2 bytes, max 32,767)
      t.integer :top25, :limit => 2 # smallint (2 bytes, max 32,767)

      t.timestamps
    end
  end
end
