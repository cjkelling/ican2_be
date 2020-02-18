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
    selections = params.select {|k,v| v != nil }
    selections[:mentor] = true
    User.where(selections)
  end

  def User.get_user(id)
    User.find(id)
  end
end
