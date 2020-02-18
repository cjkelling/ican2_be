class MentorProfile< ApplicationRecord
  belongs_to :user

  validates_presence_of :field_of_knowledge 
  validates_presence_of :experience_level 
  validates_presence_of :work_day_question 
  validates_presence_of :enjoyment_question 
  validates_presence_of :teaching_points_question 
  validates_presence_of :advice_question 
end
