class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, uniqueness: true
      t.string :password_digest
      t.string :city
      t.string :state
      t.string :zip_code
      t.integer :meetup_radius
      t.string :field_of_interest
      t.text :about_me
      t.string :gender
      t.string :image
      t.boolean :mentor

      t.string :field_of_knowledge
      t.string :experience_level
      t.text :work_day_question
      t.text :enjoyment_question
      t.text :teaching_points_question
      t.text :advice_question

      t.timestamps
    end
  end
end
