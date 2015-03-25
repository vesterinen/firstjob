class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :student_id
      t.integer :mentor_id
      t.string :status, default: "pending"
      t.timestamps null: false
    end
  end
end


