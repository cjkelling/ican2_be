class User < ApplicationRecord
  has_many :connections, class_name: 'Connection', foreign_key: 'mentee_id', dependent: :destroy

  validates_presence_of :name
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip_code
  validates_presence_of :meetup_radius
  validates_presence_of :field_of_interest
  validates_presence_of :about_me
  validates_presence_of :gender
  validates_presence_of :image
  validates :mentor, inclusion: { in: [true, false] }
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest
  has_secure_password

  validates_presence_of :field_of_knowledge, if: ->(x) { x.mentor }
  validates_presence_of :experience_level, if: ->(x) { x.mentor }
  validates_presence_of :work_day_question, if: ->(x) { x.mentor }
  validates_presence_of :enjoyment_question, if: ->(x) { x.mentor }
  validates_presence_of :teaching_points_question, if: ->(x) { x.mentor }
  validates_presence_of :advice_question, if: ->(x) { x.mentor }



  def User.get_all_mentors(params)
    selections = params.select {|k,v| v != nil }
    selections[:mentor] = true
    User.where(selections)
  end

  def User.get_user(id)
    User.find(id)
  end








end
