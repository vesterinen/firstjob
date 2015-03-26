class UsersController < ApplicationController
  before_action :login_required, :only => [:show, :edit]

  def new
    @user = User.new
  end

  def students_index
    @users = User.where(role: "student")
    render :index
  end

  def mentors_index
    @users = User.where(role: "mentor")
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
      redirect_to root_path
    else
      render :new
    end
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :role, :picture, :gender, :location, :bio, :email, :birthday, :education_level, :linkedin_url, :employment_status, :industry)
  end

end



