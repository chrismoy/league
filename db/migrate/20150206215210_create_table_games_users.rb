class CreateTableGamesUsers < ActiveRecord::Migration
  def change
    create_table :games_users do |t|
      t.belongs_to :game, index: true
      t.belongs_to :user, index: true
    end
    add_foreign_key :games_users, :games
    add_foreign_key :games_users, :users
  end
end
