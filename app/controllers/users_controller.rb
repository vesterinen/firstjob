class UsersController < ApplicationController
#  before_action :login_required, :only => [:show, :edit]

  def new
    @user = User.new
  end

  def students_index
    @users = User.where(role: "Student")
    render :index
  end

  def mentors_index
    @users = User.where(role: "Mentor")
    render :index
  end

  def show
    set_user
  end

  def edit
    set_user
  end

  def update
    set_user
    @user.update(user_params)
    if current_user.mentor?
        redirect_to mentor_path(@user)
    else
       redirect_to student_path(@user)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      @user.generate_match
      if @user.has_match?
        flash[:notice] = "Here's your new match! Feel free to reach out anytime."
        if @user.student?
          redirect_to mentor_path(@user.mentor)
        else
          redirect_to student_path(@user.students.last)
        end
      else
        redirect_to student_path(@user) if @user.student?
        redirect_to mentor_path(@user) if @user.mentor?
      end
    else
      render :new
    end
  end

private
  def user_params
    params.require(:user).permit(:avatar, :password, :first_name, :last_name, :role, :picture, :gender, :location, :bio, :email, :birthday, :education_level, :linkedin_url, :provider, :uid, :employment_status, industries_attributes: [:name], :industry_ids => [], :language_ids => [])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
