require 'rails_helper'

RSpec.describe MentorProfile, type: :model do
  describe 'validations for mentor' do
    subject { MentorProfile.new(mentor: true) }
    it { should validate_presence_of(:field_of_knowledge) }
    it { should validate_presence_of(:experience_level) }
    it { should validate_presence_of(:work_day_question) }
    it { should validate_presence_of(:enjoyment_question) }
    it { should validate_presence_of(:teaching_points_question) }
    it { should validate_presence_of(:advice_question) }
  end
end
