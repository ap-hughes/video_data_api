# README
<h2>About</h2>
This is a Ruby on Rails API designed to accept a URL path of a video file, examine the contents and return details in a json format:
* File name
* Duration
* List of video streams and specified details
* List of audio streams and specified details
* List of caption streams and specified details

<h2>Getting started</h2>
Ruby version: 2.4.3
Rails Version: 5.1.6

You will also need to install ffmpeg on your system.

ffmpeg version: 3.4.2

You can find download versions here https://www.ffmpeg.org/download.html

If you are running Linux, you may find this package helps: https://launchpad.net/~jonathonf/+archive/ubuntu/ffmpeg-3
Further instruction here: https://tecadmin.net/install-ffmpeg-on-linux/

Additional gem added:
gem 'streamio-ffmpeg'

The programme runs on Rails API only, no views are present.

<h3>Installation instructions</h3>
Once ffmpeg is installed on your system...
* Switch current working directory to location where you want cloned directory to be made
* Clone the repo - <code>git@github.com:ap-hughes/video_data_api.git</code> and press enter
* Run <code>bundle install</code>
* Run <code>rails db:create</code>
* Run <code>rails db:migrate</code>
* Run <code>rails db:seed</code>.
* Run <code>rails s</code> to start server and go to http://localhost:3000/

The seed loads some dummy data and the root page is the index of all this data.

In order to test CRUD actions, I used Postman to make relevant GET, POST, PATCH and DESTROY actions specifying:
* content-type of application/json in the headers
* writing raw json in the body, as follows

{
  "name": "http://mirrors.standaloneinstaller.com/video-sample/DLP_PART_2_768k.mp4"
}

The create action would take the name as the url for passing through to ffmpeg to analyse and write the relevant metadata.

<h2>A big note and word of caution</h2>
Unfortunately it doesn't work as it should yet ...

The JSON crud actions work assuming sent by JSON through a tool like Postman but the transcription of data using FFMPEG is not working. I have an rb file which works locally and collects the correct data from the sample files but the ffmpeg tool is not being initialized in the create action of the videodata_controller. I have enclosed contents of the local rb file further below for interest, only piece which is missing is the loop to collect relevant stream_ids (similar to the create action in rails app)

It may be something simple but I have come to the deadline :(

I may pick this up again for interest and in order to complete the project ...

As per above, I have not managed to test extensively with different video formats and urls, etc. to check the relevant metadata is being secured. The local test rb file did work for the local files sent as test samples.

<h3>Areas for improvement</h3>
After getting it work as briefed as above...
* Tests - beyond testing the api with postman using json the various controller actions - writing actual rspect scripts and code to test the methods. Ideally with more time there would be more robust tests and validations.
* Form to enter the URL - this is an option, not sure if necessary. But currently the user has to send a post request to input data using curl on the command line or a tool like Postman to make entries.

<h3>Looking further ahead</h3>
Some more feature ideas...
* Add authentication so only an authorised user can view, add, edit and delete entries in the database.

<h4>Sample local Ruby test script</h4>
Installing of ffmpeg and installation of streamio-ffmpeg apply

require 'rubygems'
require 'streamio-ffmpeg'
require 'net/http'

movie_1 = FFMPEG::Movie.new("REPLACE/WITH/VIDEO/FILEPATH.MP4")

p "Filename - i.e. url the person puts in"
p movie_1.path
p "Duration"
p movie_1.duration
p "The video_stream id"
p "bitrate"
p movie_1.bitrate
p "frame_rate"
p movie_1.frame_rate
p "resolution"
p movie_1.resolution
p "The audio_stream id"
p "sample_rate"
p movie_1.audio_sample_rate
p "audio_codec"
p movie_1.audio_codec
p "The caption_stream id"

<i>Raw ffmpeg metadata script</i>
def read_video(url)
  system "ffprobe -print_format json -show_streams -show_streams #{url}"
end

read_video("vualto/test_resources/test_resources/sample_1.mp4")
