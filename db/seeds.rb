# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

VideoDatum.destroy_all

video = VideoDatum.create!(name: "Video Test", duration: "27")
VideoStream.create!(bitrate: 27000, fps: 24.75, resolution: "640x480", stream_id: 2, video_datum: video)
AudioStream.create!(language: "eng", sample_rate: 48000, format: "aac", stream_id: 1, video_datum: video)
CaptionStream.create!(language: "pol", stream_id: 3, video_datum: video)

5.times do
  VideoDatum.create!(name: "Video", duration: "12")
end
