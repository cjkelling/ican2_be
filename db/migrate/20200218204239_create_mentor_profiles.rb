class CreateMentorProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :mentor_profiles do |t|
      t.string :field_of_knowledge
      t.string :experience_level
      t.text :work_day_question
      t.text :enjoyment_question
      t.text :teaching_points_question
      t.text :advice_question
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
