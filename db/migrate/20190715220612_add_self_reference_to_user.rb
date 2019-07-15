class AddSelfReferenceToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :guardian
  end
end
