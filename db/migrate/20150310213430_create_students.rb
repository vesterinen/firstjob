class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :birthday
      t.string :location
      t.string :education_level
      t.integer :mentor_id
      t.text :bio
      t.binary :picture

      t.timestamps null: false
    end
  end
end
