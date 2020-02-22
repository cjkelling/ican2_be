class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, uniqueness: true
      t.string :password_digest
      t.boolean :mentor
      t.string :address
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
