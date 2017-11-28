class AddPictureAndAudioToStories < ActiveRecord::Migration[5.1]
  def change
      add_column :stories, :picture, :string
      add_column :stories, :audio, :string
  end
end
