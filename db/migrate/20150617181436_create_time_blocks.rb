class CreateTimeBlocks < ActiveRecord::Migration
  def change
    create_table :time_blocks do |t|
      t.integer :day_of_week
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
