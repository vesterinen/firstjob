class User < ActiveRecord::Base
  validates :role, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :location, presence: true

  #as a mentor
  has_many :student_matches, class_name: "Match", foreign_key: :mentor_id
  has_many :students, through: :student_matches

  #as student
  has_one :mentor_match,  class_name: "Match", foreign_key: :student_id
  delegate :mentor, to: :mentor_match
end
