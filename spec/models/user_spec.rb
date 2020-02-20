require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'relationships' do
    it { should have_many :connections }
    it { should have_many :conversations }

    it { should have_one :location }
    it { should have_one :profile }
    it { should have_one :mentor_profile }
  end
end
