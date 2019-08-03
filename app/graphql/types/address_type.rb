module Types
  class AddressType < BaseObject
    field :id, Integer, null: true
    field :street_1, String, null: true
    field :street_2, String, null: false
    field :city, String, null: false, method: :capitalize_city
    field :state, String, null: true
    field :zip, String, null: true
    field :addressable_type, String, null: true
    field :addressable_id, String, null: true
  end
end
