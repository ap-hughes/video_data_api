class RenameFileNameToName < ActiveRecord::Migration[5.1]
  def change
    rename_column :video_data, :file_name, :name
  end
end
