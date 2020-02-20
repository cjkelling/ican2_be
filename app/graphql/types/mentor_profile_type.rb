module Types
  class MentorProfileType < Types::BaseObject
    field :id, Int, null: false
    field :field_of_knowledge, String, null: false
    field :experience_level, String, null: false
    field :work_day_question, String, null: false
    field :enjoyment_question, String, null: false
    field :teaching_points_question, String, null: false
    field :advice_question, String, null: false
  end
end
