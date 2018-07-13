module Api
  module V1
    class VideodataController < ActionController::Base
      require 'streamio-ffmpeg'
      def index
        videodata = VideoDatum.all
        # render :json => videodata.map { |videodatum| videodatum.as_json(:only => :file_name, :methods => :duration)}
        render json: videodata, except: [:id, :created_at, :updated_at],
          include: {video_streams: { except: [:id, :video_datum_id, :created_at, :updated_at] },
          audio_streams: { except: [:id, :video_datum_id, :created_at, :updated_at] },
          caption_streams: { except: [:id, :video_datum_id, :created_at, :updated_at] }}
      end

      def show
        videodatum = VideoDatum.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded video data', data: videodatum}, status: :ok
      end

      def create
        videodatum = VideoDatum.new(videodatum_params)
        video = FFMPEG::Movie.new(videodatum.name)
        videodatum.duration = video.duration
        videodatum.video_streams.bitrate = video.bitrate
        videodatum.video_streams.fps = video.frame_rate
        videodatum.video_streams.resolution = video.resolution
        videodatum.audio_streams.sample_rate = video.audio_sample_rate
        videodatum.audio_streams.format = video.audio_codec
        video.metadata[:streams].each do |stream|
          videodatum.audio_streams.stream_id = stream[:index] if (stream[:codec_type]) == "audio"
          videodatum.caption_streams.stream_id = stream[:index] if (stream[:codec_type]) == "data"
          videodatum.video_streams.stream_id = stream[:index] if (stream[:codec_type]) == "video"
          videodatum.audio_streams.language = stream[:tags][:language] if (stream[:codec_type]) == "audio"
          videodatum.caption_streams.language = stream[:tags][:language] if (stream[:codec_type]) == "data"
        end
        if videodatum.save
          render json: {status: 'SUCCESS', message: 'Video data has been saved', data: videodatum}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Video data has NOT been saved', data: videodatum.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        videodatum = VideoDatum.find(params[:id])
        videodatum.destroy
        render json: {status: 'SUCCESS', message: 'Deleted video data', data: videodatum}, status: :ok
      end

      def update
        videodatum = VideoDatum.find(params[:id])
        if videodatum.update_attributes(videodatum_params)
          render json: {status: 'SUCCESS', message: 'Video data has been updated', data: videodatum}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Video data has NOT been updates', data: videodatum.errors}, status: :unprocessable_entity
        end
      end

      private

      def videodatum_params
        params.require(:videodatum).permit(:name, :duration,
          video_streams_attributes: [ :id, :stream_id, :bitrate, :fps, :resolution ],
          audio_streams_attributes: [ :id, :stream_id, :language, :sample_rate, :format ],
          caption_streams_attributes: [ :id, :stream_id, :language ])
      end
    end
  end
end
