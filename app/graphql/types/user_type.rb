module Types
  class UserType < BaseObject
    field :id, Integer, null: true
    field :email, String, null: true
    field :username, String, null: false
    field :password, String, null: false
    field :role, Integer, null: true
    field :name, String, null: true
    field :notes, String, null: true
    field :phone_number, String, null: true
    field :guardian_id, UserType, null: true, method: :guardian
    field :students, [UserType], null: true, method: :students
    field :addresses, [AddressType], null: true, method: :addresses
    field :created_at, String, null: false
    field :updated_at, String, null: false
  end
end
