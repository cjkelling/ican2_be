module Types
  class LocationType < Types::BaseObject
    field :id, Int, null: false
    field :city, String, null: false
    field :state, String, null: false
    field :meetup_radius, Int, null: false

  end
end
