class Reservation < ActiveRecord::Base
  belongs_to :room
  belongs_to :user

  # This will scope out
  scope :on, -> (checkin_date, checkout_date) {where('checkin_at < ? AND checkout_at > ?', checkout_date, checkin_date) }

  validates :checkin_at, :checkout_at, presence: true

  validate :checkout_at_after_checkin_at

  private
    def checkout_at_after_checkin_at  
      return if [checkin_at, checkout_at].any?(&:blank?)            
      if checkout_at <= checkin_at
        self.errors.add(:checkout_at, ': Should be greater than checkin date ')
      end
    end 
end
