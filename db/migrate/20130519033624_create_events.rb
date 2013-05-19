class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :city, index: true, null: false
      t.datetime :start, null: false, index: true
      t.datetime :end, null: false
      t.references :sponsor, index: true
      t.references :location, index: true
      t.references :organizer, index: true
      t.text :food
      t.boolean :draft, default: true, null: false

      t.timestamps null: false
    end
  end
end
