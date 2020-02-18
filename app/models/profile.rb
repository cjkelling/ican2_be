class Profile< ApplicationRecord
  belongs_to :user

  validates_presence_of :age
  validates_presence_of :gender
  validates_presence_of :about_me
  validates_presence_of :image
  validates_presence_of :field_of_interest
end
