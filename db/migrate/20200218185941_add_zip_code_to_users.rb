class AddZipCodeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :zip_code, :string
  end
end
