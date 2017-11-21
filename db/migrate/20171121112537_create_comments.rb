class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :author, null: false
      t.integer :story_id, null: false
      t.integer :rating
      t.timestamps
    end
    add_foreign_key :comments, :stories
  end
end
