class AddressRelationships < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :address_id
    add_reference :addresses, :addressable, polymorphic: true, index: true
  end
end
