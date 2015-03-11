# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Mentor.create(
  [
  {first_name: "Michael", last_name: "Jordan", gender: "Male", birthday: Date.new(1968, 11, 10), location: 'Chicago', employment_status: "Retired", industry: "Entertainment", bio: "The greatest basketball player of all time. Not so great golfer."},
{first_name: "John", last_name: "Jordan", gender: "Male", birthday: Date.new(1968, 11, 10), location: 'Chicago', employment_status: "Retired", industry: "Entertainment", bio: "The greatest basketball player of all time. Not so great golfer."},
{first_name: "Jim", last_name: "Jordan", gender: "Male", birthday: Date.new(1968, 11, 10), location: 'Chicago', employment_status: "Retired", industry: "Entertainment", bio: "The greatest basketball player of all time. Not so great golfer."},
{first_name: "Jack", last_name: "Jordan", gender: "Male", birthday: Date.new(1968, 11, 10), location: 'Chicago', employment_status: "Retired", industry: "Entertainment", bio: "The greatest basketball player of all time. Not so great golfer."},
{first_name: "Tom", last_name: "Jordan", gender: "Male", birthday: Date.new(1968, 11, 10), location: 'Chicago', employment_status: "Retired", industry: "Entertainment", bio: "The greatest basketball player of all time. Not so great golfer."},
{first_name: "Michael", last_name: "Jordan", gender: "Male", birthday: Date.new(1968, 11, 10), location: 'Chicago', employment_status: "Retired", industry: "Entertainment", bio: "The greatest basketball player of all time. Not so great golfer."},
{first_name: "Michael", last_name: "Jordan", gender: "Male", birthday: Date.new(1968, 11, 10), location: 'Chicago', employment_status: "Retired", industry: "Entertainment", bio: "The greatest basketball player of all time. Not so great golfer."},
{first_name: "Michael", last_name: "Jordan", gender: "Male", birthday: Date.new(1968, 11, 10), location: 'Chicago', employment_status: "Retired", industry: "Entertainment", bio: "The greatest basketball player of all time. Not so great golfer."},
{first_name: "Michael", last_name: "Jordan", gender: "Male", birthday: Date.new(1968, 11, 10), location: 'Chicago', employment_status: "Retired", industry: "Entertainment", bio: "The greatest basketball player of all time. Not so great golfer."}
]
)
Student.create(
  [
  {first_name: "Mary", last_name: "Michaels", gender: "Female", mentor_id: 1, birthday: Date.new(1978, 10, 10), location: 'Chicago', education_level: "High School", bio: "The greatest basketball player of all time. Not so great golfer."},
  {first_name: "Jenny", last_name: "Michaels", gender: "Female", mentor_id: 1, birthday: Date.new(1978, 10, 10), location: 'Chicago', education_level: "High School", bio: "The greatest basketball player of all time. Not so great golfer."},
  {first_name: "Casie", last_name: "Michaels", gender: "Female", mentor_id: 2, birthday: Date.new(1978, 10, 10), location: 'Chicago', education_level: "High School", bio: "The greatest basketball player of all time. Not so great golfer."},
  {first_name: "Katy", last_name: "Michaels", gender: "Female", mentor_id: 3, birthday: Date.new(1978, 10, 10), location: 'Chicago', education_level: "High School", bio: "The greatest basketball player of all time. Not so great golfer."},
  {first_name: "Emma", last_name: "Michaels", gender: "Female", mentor_id: 4, birthday: Date.new(1978, 10, 10), location: 'Chicago', education_level: "High School", bio: "The greatest basketball player of all time. Not so great golfer."},
  {first_name: "Michelle", last_name: "Michaels", gender: "Female", mentor_id: 5, birthday: Date.new(1978, 10, 10), location: 'Chicago', education_level: "High School", bio: "The greatest basketball player of all time. Not so great golfer."}

  ])
