class CreateStudentAchvGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :student_achv_goals do |t|
      t.references :user, foreign_key: true
      t.references :achievement_goal, foreign_key: true
      t.datetime :started_at
      t.datetime :completed_at
      t.boolean :notified

      t.timestamps
    end
  end
end
