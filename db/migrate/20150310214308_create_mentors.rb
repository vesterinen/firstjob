class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :birthday
      t.string :location
      t.string :employment_status
      t.string :industry
      t.text :bio
      t.binary :picture

      t.timestamps null: false
    end
  end
end
