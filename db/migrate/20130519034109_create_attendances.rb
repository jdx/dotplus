class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :user, index: true, null: false
      t.references :event, index: true, null: false

      t.timestamps null: false
    end
  end
end
