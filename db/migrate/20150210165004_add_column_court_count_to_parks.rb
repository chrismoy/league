class AddColumnCourtCountToParks < ActiveRecord::Migration
  def change
    add_column :parks, :court_count, :integer
  end
end
