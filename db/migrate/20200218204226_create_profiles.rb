class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :age
      t.string :gender
      t.text :about_me
      t.string :image
      t.string :field_of_interest
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
