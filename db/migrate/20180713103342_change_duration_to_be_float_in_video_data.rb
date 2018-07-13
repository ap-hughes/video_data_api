class ChangeDurationToBeFloatInVideoData < ActiveRecord::Migration[5.1]
  def change
    change_column :video_data, :duration, 'float USING CAST(duration AS float)'
  end
end
