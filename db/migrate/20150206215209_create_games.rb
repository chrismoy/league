class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :court, index: true
      t.datetime :time

      t.timestamps null: false
    end
  end
end
