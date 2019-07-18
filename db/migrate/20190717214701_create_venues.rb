class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.text :notes
      t.string :name

      t.timestamps
    end
  end
end
