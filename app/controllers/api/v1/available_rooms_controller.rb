module Api;module V1
  class AvailableRoomsController < ApplicationController
    skip_before_filter :authenticate_user!
    before_action :set_available_rooms, only: :index
    def index      
      if @available_rooms.present? 
        render json: @available_rooms
      else
        head 404 # Room Not Found
      end
    end

    private

      def set_available_rooms
        @available_rooms = Room.find_unreserved( params[:checkin_at],
                              params[:checkout_at],
                              params[:category]
                            ) 
      end

  end
end;end     