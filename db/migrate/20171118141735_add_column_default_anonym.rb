class AddColumnDefaultAnonym < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:stories, :author, 'anonym')
  end
end
