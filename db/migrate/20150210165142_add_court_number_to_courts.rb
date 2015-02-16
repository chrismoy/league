class AddCourtNumberToCourts < ActiveRecord::Migration
  def change
    add_column :courts, :court_number, :integer
  end
end
