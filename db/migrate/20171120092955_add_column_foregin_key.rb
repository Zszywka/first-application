class AddColumnForeginKey < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :category_id, :integer
    add_index :stories, :category_id
    add_foreign_key :stories, :categories
  end
end
