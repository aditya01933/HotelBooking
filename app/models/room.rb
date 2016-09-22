class Room < ActiveRecord::Base    
  # Rooms can have many reservations but only one active reservation
  # at a time.

  has_many :reservations
  has_many :users, through: :reservations

  # Find all unreserved rooms for given date and category
  def self.find_unreserved date_begin, date_end, category 
    reserved_room_ids = Reservation.on(date_begin, date_end).pluck('DISTINCT room_id')
    if reserved_room_ids.empty?
      where(category: category).uniq
    else
      where('id NOT IN ?', reserved_room_ids).where(category: category).uniq
    end
  end
end
