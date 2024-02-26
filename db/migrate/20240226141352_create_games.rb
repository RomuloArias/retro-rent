class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :console
      t.string :genre
      t.integer :year
      t.references :user, null: false, foreign_key: true
      t.integer :price_per_day

      t.timestamps
    end
  end
end
