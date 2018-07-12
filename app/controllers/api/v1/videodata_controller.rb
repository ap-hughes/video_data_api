module Api
  module V1
    class VideodataController < ApplicationController
      def index
        videodata = VideoDatum.all
        render json: {status: 'SUCCESS', message: 'Loaded all video data', data: videodata.to_json(:include => [:file_name, :duration], :except => [:id, :created_at, :updated_at])}, status: :ok
      end

      def show
        videodatum = VideoDatum.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded video data', data: videodatum}, status: :ok
      end

      def create
        videodatum = VideoDatum.new(videodatum_params)
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
        params.require(:videodatum).permit(:file_name, :duration)
      end
    end
  end
end
