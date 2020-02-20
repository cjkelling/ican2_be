class User < ApplicationRecord
  has_many :connections, class_name: 'Connection', foreign_key: 'mentee_id', dependent: :destroy
  has_many :conversations, foreign_key: 'sender_id', dependent: :destroy

  has_one :location, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_one :mentor_profile, dependent: :destroy

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

  def User.update_user_and_info(user_info, profile_info, mentor_info, location_info)
    user = User.find_by(email: user_info[:email])
    user.update(user_info)
    if !profile_info.empty?
      user.profile.update(profile_info)
    elsif !location_info.empty?
      user.location.update(location_info)
    elsif user.mentor && !mentor_info.empty? && user.mentor_profile
      user.mentor_profile.update(mentor_info)
    elsif !user.mentor && user.mentor_profile
      MentorProfile.destroy(user.mentor_profile.id)
    end
  end

  def updated?(user_info, profile_info, mentor_info, location_info)
    if check_user_info(user_info) && check_profile_info(profile_info) &&
                                     check_location_info(location_info) &&
                                    check_mentor_info(mentor_info)
      true
    else
      false
    end
  end

  private

  def check_user_info(user_info)
    user_info.all? {|k,v| v == self[k]}
  end

  def check_profile_info(profile_info)
    return true if profile_info.empty?
    profile_info.all? {|k,v| v == self.profile[k]}
  end

  def check_location_info(location_info)
    return true if location_info.empty?

    location_info.all? {|k,v| v == self.location[k]}
  end

  def check_mentor_info(mentor_info)
    if mentor_info.empty? && self.mentor_profile
      MentorProfile.destroy(self.mentor_profile.id)
    elsif mentor_info.empty?
      return true
    end
    if self.mentor_profile
      mentor_info.all? {|k,v| v == self.mentor_profile[k]}
    else
      mentor_info[:user_id] = self.id
      MentorProfile.create(mentor_info)
    end
  end

  def self.format_selections(params)
    if params[:location]
      params['locations.city'] = params[:location].split(',')[0]
      params['locations.state'] = params[:location].split(',')[1].strip
      params.delete(:location)
    end
    params['profiles.gender'] = params.delete(:gender)
    params['mentor_profiles.field_of_knowledge'] = params.delete(:field)
    params['mentor_profiles.experience_level'] = params.delete(:expert_lvl)
    params
  end
end
