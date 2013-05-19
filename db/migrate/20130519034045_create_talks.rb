class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.references :city, null: false, index: true
      t.references :event, index: true
      t.references :user, index: true, null: false
      t.boolean :newbie, null: false, default: false
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
