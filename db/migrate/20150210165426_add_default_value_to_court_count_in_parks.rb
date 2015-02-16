class AddDefaultValueToCourtCountInParks < ActiveRecord::Migration
  def change
    change_column_default :parks, :court_count, 0
  end
end
