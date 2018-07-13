class VideoDatum < ApplicationRecord
  has_many :video_streams, dependent: :destroy
  has_many :audio_streams, dependent: :destroy
  has_many :caption_streams, dependent: :destroy
end
