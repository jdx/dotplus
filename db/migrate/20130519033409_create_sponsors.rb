class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name, null: false
      t.string :twitter

      t.timestamps null: false
    end

    add_index :sponsors, :twitter, unique: true
  end
end
