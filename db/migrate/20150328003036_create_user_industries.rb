class CreateUserIndustries < ActiveRecord::Migration
  def change
    create_table :user_industries do |t|
      t.belongs_to :user, index: true
      t.belongs_to :industry, index: true
    end
    add_foreign_key :user_industries, :users
    add_foreign_key :user_industries, :industries
  end
end
