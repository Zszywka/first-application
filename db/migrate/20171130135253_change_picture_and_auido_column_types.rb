class ChangePictureAndAuidoColumnTypes < ActiveRecord::Migration[5.1]
  def change
   remove_column :stories, :picture
   remove_column :stories, :audio

   add_column :stories, :picture, :string
   add_column :stories, :audio, :string
  end
end
