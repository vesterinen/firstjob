class Match < ActiveRecord::Base
  belongs_to :mentor, class_name: "User"
  belongs_to :student, class_name: "User"

  # def match(user, location)
  #   if user.role == "student"
  #     user.mentor << User.where(location: location).limit(3)
  #   end
  # end

end



