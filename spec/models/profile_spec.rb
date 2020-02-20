require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:about_me) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:field_of_interest) }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end
