class ReservationsController < ApplicationController

  before_action :initialize_resrvation_service, only: :create

  def index
    
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = @reservation_service.check_availability_and_confirm
    unless @reservation.errors.present?
      flash[:notice] =  "Room reservation successful."
      redirect_to reservations_path
    else      
      render :new  # This will also generate error message if no room available.
    end
  end

  private
    # Service is used to make Model and Controller Thin.
    def initialize_resrvation_service
      @reservation_service = ReservationService.new(reservation_params,
                    user: current_user, 
                    category: params[:category])      
    end

    def reservation_params
      params.require(:reservation).permit(:title, :checkin_at, :checkout_at, :advance, :amount)
    end

end