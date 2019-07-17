class ChangeUsersTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :nickname, :username
    add_column :users, :birthdate, :string
  end
end
