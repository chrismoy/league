class CreateSocialRegistrations < ActiveRecord::Migration
  def change
    create_table :social_registrations do |t|
      t.references :user, index: true, foreign_key: true
      t.string :provider
      t.string :uid
      t.string :token
      t.string :secret

      t.timestamps null: false
    end
  end
end
