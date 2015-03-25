# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
def randomize(array)
   index = rand(1..array.length-1)
   array[index]
end

def users
  random_birthdate = Date.new(rand(1950..1996), rand(1..12), rand(1..28))

  first_names = ["Alexis", "Alex", "Glenn", "Simone", "Theo", "Max", "Mel", "Nat", "Nicki", "Robin", "Sam", "Vic", "Chris", "Bobbie", "Remi"]

  last_names = ["Steinberg", "Flombaum", "Sardina", "Taveras", "Ramirez", "Ain", "Johnson", "Jordan", "Stevenson", "Smith"]

  genders = ["male", "female"]

  locations = ["New York City", "Boston", "San Francisco", "Florida", "Philadelphia"]

  education_levels = ["High School Diploma", "Trade School or Technical Program", "BA/BS", "MA/MS", "PhD"]

  employment_status = ["Unemployed","Self-Employed","Looking","Retired"]

  industries = ["Health Sciences", "Education", "Politics", "Public Health", "Finances", "Law"]

  roles = ["student", "mentor"]

  emails_array = emails

  20.times do |time|
    User.create(
    {
    first_name: randomize(first_names),
    last_name: randomize(last_names),
    role: "student",
    email: emails_array[time],
    gender: randomize(genders),
    birthday: random_birthdate,
    location: randomize(locations),
    industry: randomize(industries),
    education_level: randomize(education_levels),
    employment_status: randomize(employment_status)
    })
  end
end

def emails
  emails = []
  base_string = "person_0@example.com"
  (1..20).each do |number|
    emails << base_string.gsub("0", number.to_s)
  end
  emails
end

users

# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Mentor.create(
#   [
#   {first_name: "Michael", last_name: "Jordan", gender: "Male", birthday: Date.new(1968, 11, 10), location: 'Chicago', employment_status: "Retired", industry: "Entertainment", bio: "The greatest basketball player of all time. Not so great golfer."},
# {first_name: "John", last_name: "Jordan", gender: "Male", birthday: Date.new(1968, 11, 10), location: 'Chicago', employment_status: "Retired", industry: "Entertainment", bio: "The greatest basketball player of all time. Not so great golfer."},
# {first_name: "Jim", last_name: "Jordan", gender: "Male", birthday: Date.new(1968, 11, 10), location: 'Chicago', employment_status: "Retired", industry: "Entertainment", bio: "The greatest basketball player of all time. Not so great golfer."},
# {first_name: "Jack", last_name: "Jordan", gender: "Male", birthday: Date.new(1968, 11, 10), location: 'Chicago', employment_status: "Retired", industry: "Entertainment", bio: "The greatest basketball player of all time. Not so great golfer."},
# {first_name: "Tom", last_name: "Jordan", gender: "Male", birthday: Date.new(1968, 11, 10), location: 'Chicago', employment_status: "Retired", industry: "Entertainment", bio: "The greatest basketball player of all time. Not so great golfer."},
# {first_name: "Michael", last_name: "Jordan", gender: "Male", birthday: Date.new(1968, 11, 10), location: 'Chicago', employment_status: "Retired", industry: "Entertainment", bio: "The greatest basketball player of all time. Not so great golfer."},
# {first_name: "Michael", last_name: "Jordan", gender: "Male", birthday: Date.new(1968, 11, 10), location: 'Chicago', employment_status: "Retired", industry: "Entertainment", bio: "The greatest basketball player of all time. Not so great golfer."},
# {first_name: "Michael", last_name: "Jordan", gender: "Male", birthday: Date.new(1968, 11, 10), location: 'Chicago', employment_status: "Retired", industry: "Entertainment", bio: "The greatest basketball player of all time. Not so great golfer."},
# {first_name: "Michael", last_name: "Jordan", gender: "Male", birthday: Date.new(1968, 11, 10), location: 'Chicago', employment_status: "Retired", industry: "Entertainment", bio: "The greatest basketball player of all time. Not so great golfer."}
# ]
# )
# Student.create(
#   [
#   {first_name: "Mary", last_name: "Michaels", gender: "Female", mentor_id: 1, birthday: Date.new(1978, 10, 10), location: 'Chicago', education_level: "High School", bio: "The greatest basketball player of all time. Not so great golfer."},
#   {first_name: "Jenny", last_name: "Michaels", gender: "Female", mentor_id: 1, birthday: Date.new(1978, 10, 10), location: 'Chicago', education_level: "High School", bio: "The greatest basketball player of all time. Not so great golfer."},
#   {first_name: "Casie", last_name: "Michaels", gender: "Female", mentor_id: 2, birthday: Date.new(1978, 10, 10), location: 'Chicago', education_level: "High School", bio: "The greatest basketball player of all time. Not so great golfer."},
#   {first_name: "Katy", last_name: "Michaels", gender: "Female", mentor_id: 3, birthday: Date.new(1978, 10, 10), location: 'Chicago', education_level: "High School", bio: "The greatest basketball player of all time. Not so great golfer."},
#   {first_name: "Emma", last_name: "Michaels", gender: "Female", mentor_id: 4, birthday: Date.new(1978, 10, 10), location: 'Chicago', education_level: "High School", bio: "The greatest basketball player of all time. Not so great golfer."},
#   {first_name: "Michelle", last_name: "Michaels", gender: "Female", mentor_id: 5, birthday: Date.new(1978, 10, 10), location: 'Chicago', education_level: "High School", bio: "The greatest basketball player of all time. Not so great golfer."}

#   ])

