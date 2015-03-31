

def generate_match
  if self.role == "Student"
    candidates = User.where(role: "Mentor", location: self.location)
    if candidates.count > 0
      mentor = candidates.sample
      Match.create(student_id: self.id, mentor_id: mentor.id)
    else
      return "No matches found."
    end
  else
    candidates = User.where(role: "Student", location: self.location)
    if candidates.count > 0
      student = candidates.sample
      self.students << student
    end
  end
end




