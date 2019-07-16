class User < ApplicationRecord
  validates_presence_of :username
  validates_presence_of :password

  has_many :students, class_name: "User",
                     foreign_key: "guardian_id"

  belongs_to :guardian, optional: true, class_name: "User"
end
