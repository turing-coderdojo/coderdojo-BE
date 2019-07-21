class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :category
      t.string :name
      t.text :description
      t.string :img_url

      t.timestamps
    end
  end
end
