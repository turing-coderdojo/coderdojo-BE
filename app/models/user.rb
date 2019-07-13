class User < ApplicationRecord
  validates_presence_of :nickname
  validates_presence_of :password
  validates_presence_of :role
end
