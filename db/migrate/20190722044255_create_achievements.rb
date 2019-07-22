class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
      t.references :venue, foreign_key: true
      t.string :name
      t.string :badge_url
      t.text :description

      t.timestamps
    end
  end
end
