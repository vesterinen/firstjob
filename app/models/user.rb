class User < ActiveRecord::Base
  # has_secure_password

  validates :role, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :location, presence: true

  has_many :user_industries
  has_many :industries, through: :user_industries
  accepts_nested_attributes_for :industries

  # as a mentor
  has_many :student_matches, class_name: "Match", foreign_key: :mentor_id
  has_many :students, through: :student_matches

  #as student
  has_one :mentor_match,  class_name: "Match", foreign_key: :student_id
  delegate :mentor, to: :mentor_match


  def self.login(email)
    (user = User.find_by(:email => email)) #&& user.authenticate(password)
  end

  def student?
    self.role == "Student"
  end

  def mentor?
    self.role == "Mentor"
  end

  def registered?
    !!self.id 
  end

  def has_students?
    !!!self.students.empty?
  end

  def has_mentor?
    !!self.mentor_match
  end

  def match
    self.mentor? ? self.students : self.mentor
  end

  def has_match?
    has_mentor? || has_students?
  end

  def candidate_pool
    pool = User.where.not(role: self.role).where(location: self.location)
    pool.collect{|candidate| candidate if !candidate.has_match?}.compact if pool.first.student?
  end

  def candidate
    candidate_pool.sample if !candidate_pool.empty?
  end

  def user_type
    self.role.downcase
  end

  def generate_match
    if candidate
      match = Match.create("#{self.user_type}_id": self.id, "#{candidate.user_type}_id": candidate.id)
      self.students << candidate if self.mentor?
      self.mentor_match = match if self.student?
    else
      return "No matches found."
    end
  end
end