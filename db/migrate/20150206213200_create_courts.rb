class CreateCourts < ActiveRecord::Migration
  def change
    create_table :courts do |t|
      t.references :park, index: true
      t.string :img

      t.timestamps null: false
    end
    add_foreign_key :courts, :parks
  end
end
