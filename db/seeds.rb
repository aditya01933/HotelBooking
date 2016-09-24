
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

(11..20).each do |n|
  Room.create(
      [
        {category: 'Luxury Suites', description: 'King Size Bed and Pool Facing', price: 12000, identifier: "D#{n}"}
      ]
    )
end

(1..2).each do |n|
  Room.create(
        [
          {category: 'Luxury Suites', description: 'King Size Bed and Pool Facing', price: 12000, identifier: "E#{n}"}
        ]
      )
end

(3..10).each do |n|
  Room.create(
        [
          {category: 'Presidential Suites', description: 'King Size Bed, Pool Facing with a Gym', price: 20000, identifier: "E#{n}"}
        ]
      )
end