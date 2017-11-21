class AddPictureToStories < ActiveRecord::Migration[5.1]
  def change
    add_attachment :stories, :picture
  end
end
