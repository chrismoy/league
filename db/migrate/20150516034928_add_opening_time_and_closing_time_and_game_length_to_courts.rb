class AddOpeningTimeAndClosingTimeAndGameLengthToCourts < ActiveRecord::Migration
  def change
    remove_column :games, :opening_time
    remove_column :games, :closing_time
    remove_column :games, :game_length
    add_column :parks, :opening_time, :integer
    add_column :parks, :closing_time, :integer
    add_column :parks, :game_length, :integer
  end
end
