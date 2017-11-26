class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.string :body, null: false
      t.string :author, null: false
      t.timestamp
    end
  end
end
