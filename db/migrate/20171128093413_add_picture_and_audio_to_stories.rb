class AddPictureAndAudioToStories < ActiveRecord::Migration[5.1]
  def change
      add_column :stories, :picture, :oid
      add_column :stories, :audio, :oid
  end
end
