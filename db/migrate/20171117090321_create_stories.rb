class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :author, null: false
      t.string :title, null: false
      t.string :level, null: false
      # t.attachment :file, null: false
      t.timestamp
    end
  end
end

# validates_attachment_content_type :file, content_type: "audio/mpeg
