class AddEducationLevelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :education_level, :string
  end
end
