class Location < ApplicationRecord
  belongs_to :user

  validates_presence_of :address
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :meetup_radius

  attr_accessor :address, :latitude, :longitude

  geocoded_by :address
  before_validation :geocode
end
