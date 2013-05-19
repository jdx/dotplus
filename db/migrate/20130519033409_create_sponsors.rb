class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name, null: false
      t.string :address
      t.string :notes

      t.timestamps null: false
    end
  end
end
