class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :meetup_radius
  validates_presence_of :field_of_interest
  validates_presence_of :about_me
  validates_presence_of :gender
  validates_presence_of :image
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest
  has_secure_password
end
