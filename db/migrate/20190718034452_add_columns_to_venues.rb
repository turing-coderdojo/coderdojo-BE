class AddColumnsToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :email, :string
    add_column :venues, :web_url, :string
    add_column :venues, :photo_url, :string
  end
end
