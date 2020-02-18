require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:meetup_radius) }
    it { should validate_presence_of(:field_of_interest) }
    it { should validate_presence_of(:about_me) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'validations for mentor' do
    subject { User.new(mentor: true) }
    it { should validate_presence_of(:field_of_knowledge) }
    it { should validate_presence_of(:experience_level) }
    it { should validate_presence_of(:work_day_question) }
    it { should validate_presence_of(:enjoyment_question) }
    it { should validate_presence_of(:teaching_points_question) }
    it { should validate_presence_of(:advice_question) }
  end

  describe 'methods' do
    it 'get all mentors' do

    end

    it 'gets a user' do
      
    end
  end

end
