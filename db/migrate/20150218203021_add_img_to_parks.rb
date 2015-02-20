class AddImgToParks < ActiveRecord::Migration
  def change
    add_column :parks, :img, :string
  end
end
