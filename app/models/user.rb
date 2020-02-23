class User < ApplicationRecord
  has_many :connections, class_name: 'Connection', foreign_key: 'mentee_id', dependent: :destroy
  has_many :conversations, foreign_key: 'sender_id', dependent: :destroy

  has_one :profile, dependent: :destroy
  has_one :mentor_profile, dependent: :destroy

  validates :mentor, inclusion: { in: [true, false] }
  validates_presence_of :name
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest
  validates_presence_of :address
  has_secure_password


  geocoded_by :address
  after_validation :geocode

  def User.get_all_mentors(params)
    user = User.find_by(email: params[:user_email])
    formatted_selections = format_selections(params)
    if params[:distance]
      ids = get_nearby_users(user, params[:distance])
      formatted_selections.delete(:distance)
      formatted_selections[:id] = ids
    end
    formatted_selections = params.select {|k,v| v != nil }
    formatted_selections[:mentor] = true
    mentors = User.joins(:mentor_profile).joins(:profile).where(formatted_selections)
  end

  def User.get_user(email)
    User.find_by(email: email)
  end

  def User.create_user_and_info(user_info, profile_info, mentor_info)
    user = User.new(user_info)
    if user.save
      profile_info[:user_id] = user.id
      Profile.create!(profile_info)
      if user.mentor
        mentor_info[:user_id] = user.id
        MentorProfile.create!(mentor_info)
      end
    end
  end

  def User.update_user_and_info(user_info, profile_info, mentor_info)
    user = User.find_by(email: user_info[:email])
    user.update(user_info)
    if !profile_info.empty?
      user.profile.update(profile_info)
    elsif user.mentor && !mentor_info.empty? && user.mentor_profile
      user.mentor_profile.update(mentor_info)
    elsif !user.mentor && user.mentor_profile
      MentorProfile.destroy(user.mentor_profile.id)
    end
  end

  def updated?(user_info, profile_info, mentor_info)
    if check_user_info(user_info) && check_profile_info(profile_info) &&
                                     check_mentor_info(mentor_info)
      true
    else
      false
    end
  end

  private

  def self.get_nearby_users(user, distance)
    nearbys = user.nearbys(distance)
    ids = nearbys.map {|user| user.id}
  end

  def check_user_info(user_info)
    user_info.all? {|k,v| v == self[k]}
  end

  def check_profile_info(profile_info)
    return true if profile_info.empty?
    profile_info.all? {|k,v| v == self.profile[k]}
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
    params.delete(:user_email)
    params['profiles.gender'] = params.delete(:gender)
    params['mentor_profiles.field_of_knowledge'] = params.delete(:field)
    params['mentor_profiles.experience_level'] = params.delete(:expert_lvl)
    params
  end
end
