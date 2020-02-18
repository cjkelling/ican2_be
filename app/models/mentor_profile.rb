class MentorProfile< ApplicationRecord
  belongs_to :user

  validates :mentor, inclusion: { in: [true, false] }
  validates_presence_of :field_of_knowledge, if: ->(x) { x.mentor }
  validates_presence_of :experience_level, if: ->(x) { x.mentor }
  validates_presence_of :work_day_question, if: ->(x) { x.mentor }
  validates_presence_of :enjoyment_question, if: ->(x) { x.mentor }
  validates_presence_of :teaching_points_question, if: ->(x) { x.mentor }
  validates_presence_of :advice_question, if: ->(x) { x.mentor }
end
