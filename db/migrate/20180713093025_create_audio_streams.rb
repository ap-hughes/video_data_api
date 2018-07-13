class CreateAudioStreams < ActiveRecord::Migration[5.1]
  def change
    create_table :audio_streams do |t|
      t.integer :stream_id
      t.string :language
      t.integer :sample_rate
      t.string :format
      t.references :video_datum, foreign_key: true

      t.timestamps
    end
  end
end
