module RoomHelper
  def fetch_rooms
    room_info =  $redis.get("room_info")
    if room_info.nil?
      room_info = Room.select(:category, :description, :price).distinct.to_json
      $redis.set("room_info", room_info)
    end
    JSON.load room_info
  end
end