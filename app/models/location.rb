class Location< ApplicationRecord
  belongs_to :user

  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip_code
  validates_presence_of :meetup_radius
end
