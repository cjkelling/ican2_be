module Types
  class ProfileType < Types::BaseObject
    field :id, Int, null: false
    field :field_of_interest, String, null: false
    field :about_me, String, null: false
    field :gender, String, null: false
    field :image, String, null: false
    field :mentor, Boolean, null: false
  end
end
