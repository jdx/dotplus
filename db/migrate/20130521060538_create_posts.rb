class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body, null: false
      t.references :user, index: true, null: false
      t.references :postable, index: true, polymorphic: true, null: false

      t.timestamps null: false
    end
  end
end
