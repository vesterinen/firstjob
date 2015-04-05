  # #User
  # FIRST_NAMES = ["Alexis", "Alex", "Glenn", "Simone", "Theo", "Max", "Mel", "Nat", "Nicki", "Robin", "Sam", "Vic", "Chris", "Bobbie", "Remi"]
  # LAST_NAMES = ["Steinberg", "Flombaum", "Sardina", "Taveras", "Ramirez", "Ain", "Johnson", "Jordan", "Stevenson", "Smith"]
  # BIRTHDATE = Date.new(rand(1950..1996), rand(1..12), rand(1..28))
  # GENDERS = ["male", "female"]
  # LOCATIONS = ["New York City", "Boston", "San Francisco", "Florida", "Philadelphia"]
  # EDUCATION_LEVELS = ["High School Diploma", "Trade School or Technical Program", "BA/BS", "MA/MS", "PhD"]
  # EMPLOYMENT_STATUS = ["Unemployed","Self-Employed","Looking","Retired"]
  # ROLES = ["Student", "Mentor"]
  # emails_array = emails

  #Language
  LANGUAGES = ["English", "Spanish", "Italian", "French", "Portuguese", "Chinese", "Japanese"]

  #Industry
  INDUSTRIES = ["Research", "Academia", "Computer Science", "Politics", "Medicine", "Healthcare", "Administration", "Music", "Sports", "Journalism", "Economics", "No Preference"]

# def users
#   User.create(
#     {
#     first_name: FIRST_NAMES.sample,
#     last_name: LAST_NAMES.sample,
#     role: ROLES.sample,
#     email: emails_array[time],
#     gender: GENDERS.sample,
#     birthday: BIRTHDATE,
#     location: LOCATIONS.sample,
#     education_level: EDUCATION_LEVELS.sample,
#     employment_status: EMPLOYMENT_STATUS.sample
#     })
# end

# def emails
#   emails = []
#   base_string = "person_0@example.com"
#   (1..20).each do |number|
#     emails << base_string.gsub("0", number.to_s)
#   end
#   emails
# end

def industries
  INDUSTRIES.each{|industry| Industry.create(name: industry)}
end

def languages
  LANGUAGES.each{|language| Language.create(name: language)}
end

languages
industries
# users
