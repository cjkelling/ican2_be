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
end
