class AddDescriptionToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :description, :string
  end
end
