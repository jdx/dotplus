class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.references :event, null: false, index: true
      t.references :user, index: true
      t.boolean :newbie, null: false, default: false
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
