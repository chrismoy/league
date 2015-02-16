class AdTimeToGames < ActiveRecord::Migration
  def change
    remove_column :games, :time
    add_column :games, :time, :datetime
  end
end
