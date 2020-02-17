class CreateConnection < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.column 'mentee_id', :integer
      t.column 'mentor_id', :integer
    end
  end
end
