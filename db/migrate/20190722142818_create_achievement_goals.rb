class CreateAchievementGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :achievement_goals do |t|
      t.references :achievement, foreign_key: true
      t.references :goal, foreign_key: true

      t.timestamps
    end
  end
end
