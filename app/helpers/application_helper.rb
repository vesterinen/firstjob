module ApplicationHelper

  def login_or_logout
    if logged_in?
      " #{link_to "Logout", logout_path}".html_safe
    else
      link_to "Login", login_path
    end
  end

  def student?
    current_user.role == "Student"
  end



end
