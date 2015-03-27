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
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.generate_match
      if @user.role == "Student"
        flash[:notice] = "Here's your match. Feel free to contact anytime."
        redirect_to mentor_path(@user.mentor)
     else
       redirect_to student_path(@user)
      end
    else
      render :new
    end
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :role, :picture, :gender, :location, :bio, :email, :birthday, :education_level, :linkedin_url, :employment_status, :industry)
  end

  def flash_message
  end


end



