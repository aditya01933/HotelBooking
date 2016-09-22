class RoomSerializer < ActiveModel::Serializer
  attributes :category, :description, :price, :identifier
end
