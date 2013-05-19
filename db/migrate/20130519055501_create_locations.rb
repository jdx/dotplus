class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.references :city, null: false, index: true
      t.text :notes
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
