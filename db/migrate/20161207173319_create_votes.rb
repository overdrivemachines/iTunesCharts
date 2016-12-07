class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :song, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :like

      t.timestamps
    end
  end
end
