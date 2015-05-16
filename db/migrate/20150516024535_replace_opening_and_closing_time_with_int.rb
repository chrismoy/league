class ReplaceOpeningAndClosingTimeWithInt < ActiveRecord::Migration
  def change
    remove_column :games, :opening_time
    remove_column :games, :closing_time
    add_column :games, :opening_time, :integer
    add_column :games, :closing_time, :integer
  end
end
