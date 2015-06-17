class AddOrganizationToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :organization, index: true, foreign_key: true, default: nil
  end
end
