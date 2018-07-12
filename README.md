# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Install ffmpeg on your system
Install streamio-ffmpeg (included in Gemfile)

TODO:
Create an API that accepts a url path to a video file. The API must examine the video and return the following data about the video in the specified json format provided.

•             File name

•             Duration

•             List of video streams and specified details

•             List of audio streams and specified details

•             List of caption streams and specified details



Some mp4 files have been provided to help with testing.



The API can be developed using any technology stack you feel comfortable working with. You may use 3rd party tools, such as FFmpeg or libav, to extract data from the source or for any part of the application you deem it fit. The application must be hosted on an online repository of your choice. Pleases make this repository accessible for review.



The test should be completed by the end of the week. If for some reason this is not possible, please let us know and we will discuss an extension. Once completed, please reply to this email with a link to the repository. Feel free to ask any questions regarding the test.


JSON Format

{
    "name": "[file_name]",
    "duration": "[duration]",
  "video_streams": [
        {
            "stream_id": "[stream_id]",
            "bitrate": "[bitrate]",
            "fps":"[frames_per_second]",
            "resolution":"[resolution]"
        }
    ],
    "audio_streams": [
        {
            "stream_id": "[stream_id]",
            "language": "[language]",
            "sample_rate": "[sample_rate]",
            "format": "[format]"
        }
    ],
    "caption_streams": [
        {
            "stream_id": "[stream_id]",
            "language": "[language]"
        }
    ]
}
