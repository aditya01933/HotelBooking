class Reservation < ActiveRecord::Base
  belongs_to :room
  belongs_to :user

  # This will scope out
  scope :on, -> (checkin_date, checkout_date) {where('checkin_at < ? AND checkout_at > ?', checkout_date, checkin_date) }

  # This is used to find valid build of reservation.
  def without_any_error?
    errors.present?
  end

end
