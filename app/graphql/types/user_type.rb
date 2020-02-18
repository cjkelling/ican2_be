module Types
  class UserType < Types::BaseObject
    field :id, Int, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :password_digest, String, null: false
    field :city, String, null: false
    field :state, String, null: false
    field :meetup_radius, Int, null: false
    field :field_of_interest, String, null: false
    field :about_me, String, null: false
    field :gender, String, null: false
    field :image, String, null: false
    field :mentor, Boolean, null: false

    field :field_of_knowledge, String, null: true
    field :experience_level, String, null: true
    field :work_day_question, String, null: true
    field :enjoyment_question, String, null: true
    field :teaching_points_question, String, null: true
    field :advice_question, String, null: true
  end
end
