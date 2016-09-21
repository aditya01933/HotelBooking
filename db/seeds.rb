
['A', 'B', 'C', 'D'].each do |c|
  (1..5).each do |n|
    Room.create(
        [
          {category: 'Deluxe Rooms', description: 'Queen Size Bed ', price: 7000, identifier: "#{c}0#{n}"}
        ]
      )
  end

  (6..9).each do |n|
    Room.create(
        [
          {category: 'Luxury Rooms', description: 'Queen Size Bed and Pool Facing', price: 8500, identifier: "#{c}0#{n}"}
        ]
      )
  end


  Room.create(
          [
            {category: 'Luxury Rooms', description: 'Queen Size Bed and Pool Facing', price: 8500, identifier: "#{c}10"}
          ]
        )

end
