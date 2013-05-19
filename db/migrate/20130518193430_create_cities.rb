class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :subdomain, null: false
      t.string :name, null: false
      t.string :time_zone, null: false

      t.timestamps null: false
    end

    add_index :cities, :subdomain, unique: true
  end
end
