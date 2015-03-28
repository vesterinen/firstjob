class Industry < ActiveRecord::Base
  has_many :user_industries
  has_many :users, through: :user_industries
end
