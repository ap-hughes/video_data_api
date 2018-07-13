class CreateCaptionStreams < ActiveRecord::Migration[5.1]
  def change
    create_table :caption_streams do |t|
      t.integer :stream_id
      t.string :language
      t.references :video_datum, foreign_key: true

      t.timestamps
    end
  end
end
