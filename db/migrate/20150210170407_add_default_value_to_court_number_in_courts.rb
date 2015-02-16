class AddDefaultValueToCourtNumberInCourts < ActiveRecord::Migration
  def change
    change_column_default :courts, :court_number, 0
  end
end
