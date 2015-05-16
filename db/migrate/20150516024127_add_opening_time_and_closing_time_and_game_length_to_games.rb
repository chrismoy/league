class AddOpeningTimeAndClosingTimeAndGameLengthToGames < ActiveRecord::Migration
  def change
    add_column :games, :opening_time, :time
    add_column :games, :closing_time, :time
    add_column :games, :game_length, :integer
  end
end
