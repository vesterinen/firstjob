class User < ActiveRecord::Base
  # has_secure_password

  # validates :role, presence: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, presence: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  # validates :location, presence: true

  has_many :user_industries
  has_many :industries, through: :user_industries

  #as a mentor
  has_many :student_matches, class_name: "Match", foreign_key: :mentor_id
  has_many :students, through: :student_matches

  #as student
  has_one :mentor_match,  class_name: "Match", foreign_key: :student_id
  delegate :mentor, to: :mentor_match

  accepts_nested_attributes_for :industries

  def self.login(email)
    (user = User.find_by(:email => email)) #&& user.authenticate(password)
  end

  def generate_match
    if self.role == "Student"
      candidates = User.where(role: "Mentor", location: self.location)
      if candidates.count > 0
        mentor = candidates.sample
         #mentor = candidates.find { |candidate|  candidate.students.length < 2 }
         #if mentor
        Match.create(student_id: self.id, mentor_id: mentor.id)
      else
        return "No matches found."
      end
    else
      candidates = User.where(role: "Student", location: self.location)
     # candidates = candidates.collect{|candidate| candidate if !candidate.mentor_match}.compact
      if candidates.count > 0
        student = candidates.sample
        self.students << student
      end
    end
  end
end
