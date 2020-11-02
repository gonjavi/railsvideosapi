module Api
  module V1
    class VideosController < ApplicationController
      protect_from_forgery with: :null_session
      before_action :set_video, only: %i[destroy update]

      def index
        video = Video.all

        render json: VideoSerializer.new(video).serialized_json
      end

      def create
        video = Video.new(video_params)

        if video.save
          render json: VideoSerializer.new(video).serialized_json
        else
          render json: { error: video.errors.messages }, status: 422
        end
      end

      def update
        if @video.update(video_params)
          render json: VideoSerializer.new(@video).serialized_json
        else
          render json: { error: video.errors.messages }, status: 422
        end
      end
    

      def destroy
        head :no_content if @video.destroy
      end

      private

      def set_video
        @video = Video.find(params[:id])
      end

      def video_params
        params.require(:video).permit(:title, :description, :url, :year, :author)
      end
    end
  end
end
