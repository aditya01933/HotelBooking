class Reservation < ActiveRecord::Base
  belongs_to :room
  belongs_to :user

  # This will scope out
  scope :on, -> (checkin_date, checkout_date) {where('checkin_at < ? AND checkout_at > ?', checkout_date, checkin_date) }

  validates :checkin_at, :checkout_at, presence: true

  validate :checkout_at_after_checkin_at
  validate :checkin_before_6_months

  private
    # Booking should only be for day1 to day2 as booking is done for 
    # night for example today's 12pm to next day's 12pm.
    def checkout_at_after_checkin_at  
      return if dates_blank            
      if checkout_at <= checkin_at
        self.errors.add(:checkout_at, ': Should be greater than checkin date ')
      end
    end 

    # Restriction to book only upto 6 months. User can do checkin within 6 months.
    # Checkout is not restricted. 
    def checkin_before_6_months
      return if dates_blank
      if checkin_at >= (Date.today + 6.months)
        self.errors.add(:checkin_at, ': Should be less than or equal to 6 months')
      end
    end

    def dates_blank
      [checkin_at, checkout_at].any?(&:blank?)      
    end
end
