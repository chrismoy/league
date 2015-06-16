class AddOrganizationToParks < ActiveRecord::Migration
  def change
    add_reference :parks, :organization, index: true, foreign_key: true
  end
end
