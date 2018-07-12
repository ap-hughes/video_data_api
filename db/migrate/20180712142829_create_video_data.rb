class CreateVideoData < ActiveRecord::Migration[5.1]
  def change
    create_table :video_data do |t|
      t.string :file_name
      t.string :duration

      t.timestamps
    end
  end
end
