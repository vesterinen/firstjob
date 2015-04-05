class User < ActiveRecord::Base
  # has_many :identities, dependent: :destroy
  has_secure_password

  # has_many :lists, dependent: :destroy
  # has_many :items, through: :lists

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "20x20#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :role, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :location, presence: true

  has_many :user_industries
  has_many :industries, through: :user_industries
  accepts_nested_attributes_for :industries

  has_many :user_languages
  has_many :languages, through: :user_languages
  accepts_nested_attributes_for :languages

  # as a mentor
  has_many :student_matches, class_name: "Match", foreign_key: :mentor_id
  has_many :students, through: :student_matches

  #as student
  has_one :mentor_match,  class_name: "Match", foreign_key: :student_id
  delegate :mentor, to: :mentor_match
  CATEGORIES = ["industries", "languages"]

  def categories_array
    CATEGORIES
  end

  def self.login(email, password)
    (user = User.find_by(:email => email)) && user.authenticate(password)
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

  def user_type
    self.is_a?(Array) ? self.first.role.downcase : self.role.downcase
  end

  def match
    self.mentor? ? self.students : self.mentor
  end

  def pronoun #is user a him or her?
    self.gender == 'male' ? 'him' : 'her'
  end

  def has_match?
    has_mentor? || has_students?
  end

  def candidate_pool #based on role and location
    # binding.pry
    pool = User.where.not(role: self.role).where(location: self.location)
    if self.mentor? && !pool.empty?
      pool = pool.flat_map{|potential_candidate| potential_candidate if !potential_candidate.has_match?}.compact
    elsif self.student? && !pool.empty?
      pool = pool.flat_map{|potential_candidate| potential_candidate if potential_candidate.match.count <= 2}.compact
    end
    pool
  end

  def candidate_filter
    candidates = []

    self.categories_array.each do |category|
      self.send(category).each do |attribute|
        candidates << (candidate_pool.select{|candidate| candidate.send(category).include?(attribute)})
      end
    end
    candidates.flatten
  end

  def candidate
    candidate_filter.sample
  end

  def generate_match
    if !!candidate
      Match.create("#{self.user_type}_id".to_sym => self.id, "#{candidate.user_type}_id".to_sym => candidate.id)
    else
      return "No matches found."
    end
  end
end