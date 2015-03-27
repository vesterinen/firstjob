class User < ActiveRecord::Base
  # has_secure_password

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

  def self.login(email)
    (user = User.find_by(:email => email)) #&& user.authenticate(password)
  end

  def generate_match
    if self.role == "Student"
      mentors = User.where(role: "Mentor") #create large pool of candidates
      mentor = User.find_by(role: "Mentor", location: self.location)
      if mentor
        Match.create(student_id: self.id, mentor_id: mentor.id)
      else
        return "No matches found."
      end
    # else
    #   students = User.where(role: "Student")
    #   self.students << User.where(location: self.location).limit(3)
    end
    # 1. Create pool of candidates
        # a. if the user is a 
  end
end
