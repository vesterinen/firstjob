module ApplicationHelper

  def login_or_logout
    if logged_in?
      "Logged in as: #{current_user.email} #{link_to "Logout", logout_path}".html_safe
    else
      link_to "Login", login_path
    end
  end  
end
