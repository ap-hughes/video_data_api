class CreateVideoStreams < ActiveRecord::Migration[5.1]
  def change
    create_table :video_streams do |t|
      t.integer :stream_id
      t.integer :bitrate
      t.float :fps
      t.string :resolution
      t.references :video_datum, foreign_key: true

      t.timestamps
    end
  end
end
