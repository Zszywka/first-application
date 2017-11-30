class RemovePaperclip < ActiveRecord::Migration[5.1]
  def up
    # remove_attachment :stories, :picture
    # remove_attachment :stories, :file
  end

  def down
    # add_attachment :stories, :picture
    # add_attachment :stories, :file
  end
end
