# This code can be put into model but service is used to make
# the model thin.
class ReservationService
  attr_accessor :reservation_params, :user, :category

  def initialize(reservation_params = {}, user:, category:)
    @reservation_params = reservation_params
    @user = user
    @category = category
  end

  # This is used to check and confirm reservation. 
  def check_availability_and_confirm
    if free_room.present?
      reservation = free_room.reservations.build(reservation_params.merge(user: user))
      reservation.save
    else
      reservation = Reservation.new
      reservation.errors.add(:room, "not available")
    end
    reservation
  end

  # This is used to find free room.
  def free_room
    def self.free_room
      @free_room
    end
    free_rooms = Room.find_unreserved( 
                    self.reservation_params[:checkin_at], 
                    self.reservation_params[:checkout_at], 
                    self.category
                  )
    @free_room = free_rooms.first
  end

end