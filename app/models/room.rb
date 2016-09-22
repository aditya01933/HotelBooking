class Room < ActiveRecord::Base    
  # Rooms can have many reservations but only one active reservation
  # at a time.

  has_many :reservations
  has_many :users, through: :reservations

  # Find all unreserved rooms for given date and category
  def self.find_unreserved date_begin, date_end, category = nil 
    if category.present?
      where.not(id: Reservation.on(date_begin, date_end).pluck('DISTINCT room_id')).where(category: category).uniq
    else
      where.not(id: Reservation.on(date_begin, date_end).pluck('DISTINCT room_id')).uniq
    end
  end
end
