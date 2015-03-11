class RemoveLatitudeAndLongitudeFromParks < ActiveRecord::Migration
  def change
    remove_column :parks, :latitude
    remove_column :parks, :longitude
    add_column :parks, :latitude, :float
    add_column :parks, :longitude, :float
  end
end
