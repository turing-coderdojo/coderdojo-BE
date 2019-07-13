class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :nickname
      t.string :password
      t.integer :role
      t.string :name
      t.text :notes
      t.string :phone_number

      t.timestamps
    end
  end
end
