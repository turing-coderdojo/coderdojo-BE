class Address < ApplicationRecord
  validates_presence_of :street_1
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip

  belongs_to :user
end
