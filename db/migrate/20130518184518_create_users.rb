class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :twitter, null: false
      t.string :email
      t.string :avatar, null: false
      t.string :bio
      t.string :location
      t.string :url
      t.boolean :admin, null: false, default: false
      t.string :cities, array: true, null: false, default: []

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :twitter, unique: true
  end
end
