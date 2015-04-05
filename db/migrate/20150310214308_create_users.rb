class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :gender
      t.date :birthday
      t.string :location
      t.string :employment_status
      t.integer :status, default: 0
      t.text :bio
      t.string :role
      t.string :linkedin_url

      t.timestamps null: false
    end
  end
end
