class User < ApplicationRecord
  has_many :connections, class_name: 'Connection', foreign_key: 'mentee_id', dependent: :destroy
  has_one :location
  has_one :profile
  has_one :mentor_profile

  validates :mentor, inclusion: { in: [true, false] }
  validates_presence_of :name
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest
  has_secure_password

  def User.get_all_mentors(params)
    formatted_selections = format_selections(params)
    formatted_selections = params.select {|k,v| v != nil }
    formatted_selections[:mentor] = true
    User.joins(:location).joins(:mentor_profile).joins(:profile).where(formatted_selections)
  end

  def User.get_user(email)
    User.find_by(email: email)
  end

  def User.create_user_and_info(user_info, profile_info, mentor_info, location_info)
    user = User.new(user_info)
    if user.save
      profile_info[:user_id] = user.id
      location_info[:user_id] = user.id
      Profile.create!(profile_info)
      Location.create!(location_info)
      if user.mentor
        mentor_info[:user_id] = user.id
        MentorProfile.create!(mentor_info)
      end
    end
  end

  private

  def self.format_selections(params)
    params['locations.zip_code'] = params.delete(:zip_code)
    params['profiles.gender'] = params.delete(:gender)
    params['mentor_profiles.field_of_knowledge'] = params.delete(:field)
    params['mentor_profiles.experience_level'] = params.delete(:expert_lvl)
    params
  end
end
