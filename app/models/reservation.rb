class Reservation < ActiveRecord::Base
  belongs_to :room
  belongs_to :user

  # This will scope out
  scope :on, -> (checkin_date, checkout_date) {where('checkin_at < ? AND checkout_at > ?', checkout_date, checkin_date) }

end
