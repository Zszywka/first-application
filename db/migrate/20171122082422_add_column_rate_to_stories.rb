class AddColumnRateToStories < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :rate, :integer, default: 0
  end
end
