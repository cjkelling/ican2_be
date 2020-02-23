module Types
  class UserType < Types::BaseObject
    field :profile, Types::ProfileType, null: false
    field :mentor_profile, Types::MentorProfileType, null: true

    field :id, Int, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :password_digest, String, null: false
    field :address, String, null: false
    field :mentor, Boolean, null: false
  end
end
