class AddLatitudeAndLongitudeToLocation < ActiveRecord::Migration
  def change
    add_column :parks, :latitude, :string
    add_column :parks, :longitude, :string
  end
end
