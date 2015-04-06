class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :game, index: true
      t.references :user, index: true
      t.string :content

      t.timestamps null: false
    end
    add_foreign_key :messages, :games
    add_foreign_key :messages, :users
  end
end
