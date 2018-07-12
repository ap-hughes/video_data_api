module Api
  module V1
    class VideodataController < ApplicationController
      def index
        videodata = VideoDatum.all
        render json: {status: 'SUCCESS', message: 'Loaded Video Data', data: videodata}, status: :ok
      end
    end
  end
end
